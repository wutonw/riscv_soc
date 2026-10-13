`timescale 1ns/1ps

// Full current CPU, synchronous instruction ROM and the actual multiplier IP.
// Python supplies independent architectural WB/store traces and the final RAM.
module div_compare_tb;
    reg clk = 0, rst_n = 0;
    reg [31:0] inst;
    reg [31:0] rom [0:8191], initial_ram [0:8191], expected_ram [0:8191];
    reg [68:0] reg_trace [0:19999];
    reg [99:0] store_trace [0:19999];
    reg [1023:0] rom_file, init_file, ram_file, reg_file, store_file;
    wire [31:0] pc, inst_addr;
    wire prom_ce;
    integer reg_count, store_count, expected_retired, done_pc;
    integer ri, si, i, cycles, retired, div_commits, div_stalls;
    integer latency_sum, latency_min, latency_max, active_latency;
    integer calculating_cycles, errors;
    reg div_active, finished;

    cpu_core dut(.clk(clk), .rst_n(rst_n), .pc(pc), .inst(inst),
                 .inst_addr(inst_addr), .prom_ce(prom_ce));
    always #5 clk = ~clk;
    always @(posedge clk) begin
        if (!rst_n) inst <= 0;
        else if (prom_ce) inst <= rom[inst_addr[14:2]];
    end

    initial begin
        if (!$value$plusargs("ROM=%s", rom_file) ||
            !$value$plusargs("INIT=%s", init_file) ||
            !$value$plusargs("RAM=%s", ram_file) ||
            !$value$plusargs("REGS=%s", reg_file) ||
            !$value$plusargs("STORES=%s", store_file) ||
            !$value$plusargs("REG_COUNT=%d", reg_count) ||
            !$value$plusargs("STORE_COUNT=%d", store_count) ||
            !$value$plusargs("RETIRED=%d", expected_retired) ||
            !$value$plusargs("DONE_PC=%d", done_pc)) $fatal(1, "missing arguments");
        if (reg_count < 1 || reg_count > 20000 || store_count < 1 || store_count > 20000)
            $fatal(1, "invalid reference lengths");
        $readmemh(rom_file, rom);
        $readmemh(init_file, initial_ram);
        $readmemh(ram_file, expected_ram);
        $readmemh(reg_file, reg_trace, 0, reg_count-1);
        $readmemh(store_file, store_trace, 0, store_count-1);
        for (i = 0; i < 8192; i = i + 1) dut.u_ram.ram[i] = initial_ram[i];
        ri = 0; si = 0; cycles = 0; retired = 0; errors = 0;
        div_commits = 0; div_stalls = 0; calculating_cycles = 0;
        latency_sum = 0; latency_min = 1000; latency_max = 0;
        active_latency = 0; div_active = 0; finished = 0;
        repeat (4) @(posedge clk);
        @(negedge clk) rst_n = 1;
        while (!finished && cycles < 1000000) begin
            @(posedge clk);
            cycles = cycles + 1;
            if ($isunknown(dut.ex_m_ext_stall)) $fatal(1, "unknown M stall");
            if (dut.id_trap_enter === 1'b1)
                $fatal(1, "unexpected trap cause=%0d pc=%08x", dut.trap_cause, dut.trap_pc);
            if (dut.id_ex_valid && dut.id_ex_is_m_ext && dut.id_ex_m_op[2]) begin
                if (!div_active) begin
                    div_active = 1;
                    active_latency = 0;
                end
                active_latency = active_latency + 1;
                if (dut.ex_m_ext_stall) div_stalls = div_stalls + 1;
                if (dut.u_m_ext.u_div.state == 2'd2)
                    calculating_cycles = calculating_cycles + 1;
                if (!dut.ex_m_ext_stall) begin
                    latency_sum = latency_sum + active_latency;
                    if (active_latency < latency_min) latency_min = active_latency;
                    if (active_latency > latency_max) latency_max = active_latency;
                    div_active = 0;
                end
            end
            if (dut.mem_wb_valid) begin
                retired = retired + 1;
                if (rom[dut.mem_wb_pc[14:2]][6:0] == 7'h33 &&
                    rom[dut.mem_wb_pc[14:2]][31:25] == 7'd1 &&
                    rom[dut.mem_wb_pc[14:2]][14]) div_commits = div_commits + 1;
                if (dut.mem_wb_pc == done_pc) finished = 1;
            end
            if (dut.wb_wr_en && dut.wb_wr_addr != 0) begin
                if (ri >= reg_count ||
                    {dut.mem_wb_pc, dut.wb_wr_addr, dut.wb_wr_data} !== reg_trace[ri]) begin
                    if (errors < 8) $display("FAIL WB[%0d] pc=%08x x%0d=%08x",
                        ri, dut.mem_wb_pc, dut.wb_wr_addr, dut.wb_wr_data);
                    errors = errors + 1;
                end
                ri = ri + 1;
            end
            if (dut.mem_ram_s_we !== 4'b0) begin
                if (si >= store_count || {dut.ex_mem_pc, dut.ex_mem_alu_result,
                    dut.mem_ram_s_we, dut.mem_ram_w_data} !== store_trace[si]) begin
                    if (errors < 8) $display("FAIL STORE[%0d] pc=%08x addr=%08x data=%08x",
                        si, dut.ex_mem_pc, dut.ex_mem_alu_result, dut.mem_ram_w_data);
                    errors = errors + 1;
                end
                si = si + 1;
            end
        end
        #1;
        if (!finished) $fatal(1, "TIMEOUT pc=%08x", pc);
        if (ri != reg_count || si != store_count || retired != expected_retired)
            $fatal(1, "trace length WB=%0d/%0d stores=%0d/%0d retired=%0d/%0d",
                ri, reg_count, si, store_count, retired, expected_retired);
        for (i = 0; i < 8192; i = i + 1)
            if (dut.u_ram.ram[i] !== expected_ram[i]) begin
                if (errors < 8) $display("FAIL RAM addr=%08x got=%08x expected=%08x",
                    i*4, dut.u_ram.ram[i], expected_ram[i]);
                errors = errors + 1;
            end
        if (errors) $fatal(1, "%0d architectural mismatches", errors);
        $display("METRICS cycles=%0d retired=%0d divisions=%0d stalls=%0d iterations=%0d latency_sum=%0d latency_min=%0d latency_max=%0d",
            cycles, retired, div_commits, div_stalls, calculating_cycles,
            latency_sum, latency_min, latency_max);
        $display("PASS: division comparison, WB/store traces and all 8192 RAM words");
        $finish;
    end
endmodule
