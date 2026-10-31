module soc_top #(
    parameter ROM_FILE = "firmware/board_coremark/board_coremark.hex"
)(
    input logic cpu_clk,
    input logic cpu_rst_n,

    output logic tx,
    output logic [31:0] pc
);

    logic [31:0] inst_addr;
    logic [31:0] inst;
    logic [12:0] prom_addr;
    logic prom_ce;
    assign prom_addr = inst_addr[14:2];

    board_stress_rom #(.ROM_FILE(ROM_FILE)) u_instruction_rom (
            .clk (cpu_clk),
            .ce  (prom_ce),
            .addr(prom_addr),
            .inst(inst)
        );

    logic axi_stall;
    logic axi_error;
    logic axi_error_is_handled;
    logic cpu_req;
    logic cpu_we;
    logic [31:0] cpu_addr;
    logic [31:0] cpu_wdata;
    logic [3:0] cpu_wstrb;
    logic [31:0] cpu_rdata;
    axi_lite_if #(
        .ADDR_WIDTH(32),
        .DATA_WIDTH(32)
    ) axi_bus (
        .aclk   (cpu_clk),
        .aresetn(cpu_rst_n)
    );

    cpu_core u_cpu_core(
        .clk                 (cpu_clk),
        .rst_n               (cpu_rst_n),
        .pc                  (pc),
        .inst                (inst),
        .inst_addr           (inst_addr),
        .prom_ce             (prom_ce),
        .axi_stall           (axi_stall),
        .axi_error           (axi_error),
        .axi_error_is_handled(axi_error_is_handled),
        .cpu_rdata           (cpu_rdata),
        .cpu_req             (cpu_req),
        .cpu_we              (cpu_we),
        .cpu_addr            (cpu_addr),
        .cpu_wdata           (cpu_wdata),
        .cpu_wstrb           (cpu_wstrb)
    );

    axi_lite_master u_axi_lite_master(
        .clk                 (cpu_clk),
        .rst_n               (cpu_rst_n),
        .axi_stall           (axi_stall),
        .axi_error           (axi_error),
        .axi_error_is_handled(axi_error_is_handled),
        .cpu_req             (cpu_req),
        .cpu_we              (cpu_we),
        .cpu_addr            (cpu_addr),
        .cpu_wdata           (cpu_wdata),
        .cpu_wstrb           (cpu_wstrb),
        .cpu_rdata           (cpu_rdata),
        .axi                 (axi_bus)
    );
endmodule

module board_stress_rom #(
    parameter ROM_FILE = "firmware/board_coremark/board_coremark.hex"
)(
    input  logic        clk,
    input  logic        ce,
    input  logic [12:0] addr,
    output logic [31:0] inst
);
    (* rom_style = "block" *) logic [31:0] words [0:8191];

    initial $readmemh(ROM_FILE, words);
    always_ff @(posedge clk) begin
        if (ce) inst <= words[addr];
    end
endmodule