// 废 FPGA 厂商选择：运行 switch_fpga.cmd，输入 1 选 Gowin、2 选 Xilinx
//`define FPGA_GOWIN
//`define FPGA_XILINX

`include "board_coremark_config.vh"

module top #(
    parameter ROM_FILE = "firmware/board_coremark/board_coremark.hex",
    parameter [31:0] FAIL_PC = `BOARD_COREMARK_FAIL_PC,
    parameter [31:0] TRAP_FAIL_PC = `BOARD_COREMARK_TRAP_PC
)(
    input  logic raw_rst_n,
    input  logic clk,
    output logic led,

    output logic tx
);
    logic rst_n;
    logic cpu_clk;
    logic clk_locked;
    logic cpu_reset_ready;
    (* ASYNC_REG = "TRUE" *) logic [1:0] cpu_reset_sync = 2'b00;
    logic cpu_rst_n;

    assign cpu_reset_ready = rst_n & clk_locked;
    assign cpu_rst_n = cpu_reset_sync[1];

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
    logic [31:0] pc;
    soc_top #(
        .ROM_FILE(ROM_FILE)
    ) u_soc_top (
        .cpu_clk(cpu_clk),
        .cpu_rst_n(cpu_rst_n),
        .tx(tx),
        .pc(pc)
    );
    // Assert reset immediately on reset/lock loss; release on CPU clock edges.
    always_ff @(posedge cpu_clk or negedge cpu_reset_ready) begin
        if (!cpu_reset_ready)
            cpu_reset_sync <= 2'b00;
        else
            cpu_reset_sync <= {cpu_reset_sync[0], 1'b1};
    end

    // Generated park addresses match the current CoreMark firmware.
    logic failure_latched;

    always_ff @(posedge cpu_clk or negedge cpu_rst_n) begin
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

