// 废 FPGA 厂商选择：运行 switch_fpga.cmd，输入 1 选 Gowin、2 选 Xilinx
//`define FPGA_GOWIN
`define FPGA_XILINX
`include "D:/aaa1verilog_project/riscv_soc/firmware/board_coremark/board_coremark_config.vh"

module top #(
    parameter ROM_FILE = "D:/aaa1verilog_project/riscv_soc/firmware/board_coremark/board_coremark.hex",
    parameter [31:0] FAIL_PC = `BOARD_COREMARK_FAIL_PC,
    parameter [31:0] TRAP_FAIL_PC = `BOARD_COREMARK_TRAP_PC
)(
    input  wire raw_rst_n,
    input  wire clk      ,
    output wire led      ,

    output wire tx
);
    wire rst_n;
    wire cpu_clk;
    wire clk_locked;
    wire cpu_reset_ready = rst_n & clk_locked;
    (* ASYNC_REG = "TRUE" *) reg [1:0] cpu_reset_sync = 2'b00;
    wire cpu_rst_n = cpu_reset_sync[1];
    wire [31:0] inst_addr;
    wire [31:0] inst;
    wire [12:0] prom_addr;
    wire prom_ce;

    clk_wiz_0 u_clk_wiz (
        .clk_in1 (clk),
        .reset   (~rst_n),
        .clk_out1(cpu_clk),
        .locked  (clk_locked)
    );

    debounce u_debounce(
        .clk    (clk),
        .key_in (raw_rst_n),
        .key_out(rst_n)
    );
    // Assert reset immediately on reset/lock loss; release on CPU clock edges.
    always @(posedge cpu_clk or negedge cpu_reset_ready) begin
        if (!cpu_reset_ready)
            cpu_reset_sync <= 2'b00;
        else
            cpu_reset_sync <= {cpu_reset_sync[0], 1'b1};
    end

    // The CPU uses byte addresses.  The pROM stores 32-bit instruction words,
    // so discard the two always-zero byte-offset bits.
    assign prom_addr = inst_addr[14:2];

    `ifdef FPGA_GOWIN
        Gowin_pROM u_instruction_rom(
            .dout (inst),
            .clk  (clk),
            .oce  (1'b1),
            .ce   (prom_ce),
            .reset(~rst_n),
            .ad   (prom_addr)
        );
    `elsif FPGA_XILINX
        board_stress_rom #(.ROM_FILE(ROM_FILE)) u_instruction_rom (
            .clk (cpu_clk),
            .ce  (prom_ce),
            .addr(prom_addr),
            .inst(inst)
        );
    `else
        `error "FPGA vendor not selected!"
    `endif

    wire [31:0] pc;
    cpu_core u_cpu_core(
        .clk      (cpu_clk),
        .rst_n    (cpu_rst_n),
        .pc       (pc),
        .inst     (inst),
        .inst_addr(inst_addr),
        .prom_ce  (prom_ce),
        .tx       (tx)
    );

    // Generated park addresses match the current CoreMark firmware.
    reg failure_latched;

    always @(posedge cpu_clk or negedge cpu_rst_n) begin
        if (!cpu_rst_n) begin
            failure_latched <= 1'b0;
        end else begin
            if (pc == FAIL_PC || pc == TRAP_FAIL_PC)
                failure_latched <= 1'b1;
        end
    end

    // LED on means the test reached the failure park loop; pass stays dark.
    assign led = cpu_rst_n && failure_latched;

endmodule

`ifdef FPGA_XILINX
module board_stress_rom #(
    parameter ROM_FILE = "D:/aaa1verilog_project/riscv_soc/firmware/board_coremark/board_coremark.hex"
)(
    input  wire        clk ,
    input  wire        ce  ,
    input  wire [12:0] addr,
    output reg  [31:0] inst
);
    (* rom_style = "block" *) reg [31:0] words [0:8191];

    initial $readmemh(ROM_FILE, words);
    always @(posedge clk) begin
        if (ce) inst <= words[addr];
    end
endmodule
`endif
