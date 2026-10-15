module mmio_decode(
    input logic clk,
    input logic rst_n,

    input logic [3:0] mem_ram_s_we,
    input logic [31:0] ex_addr_result,
    input logic [31:0] ex_mem_alu_result,
    input logic [31:0] mem_ram_w_data,
    output logic [31:0] mem_raw_ram_r_data,

    output logic tx
);
    wire is_rd_ram = (ex_addr_result < 32'h00008000);
    wire [31:0] ram_rd_addr = is_rd_ram ? ex_addr_result : 32'h0;
    wire [31:0] ram_raw_r_data;

    wire is_ram = (ex_mem_alu_result < 32'h00008000);
    wire is_uart = (ex_mem_alu_result == 32'h0001_0000) && (mem_ram_s_we[0]);

    ram u_ram(
        .clk(clk),
        .we(mem_ram_s_we & {4{is_ram}}),
        .rd_addr(ram_rd_addr),  //提前吃地址
        .wr_addr(ex_mem_alu_result),
        .ram_w_data(mem_ram_w_data),
        .ram_r_data(ram_raw_r_data)
    );

    assign mem_raw_ram_r_data = ram_raw_r_data;

    uart_top u_uart_top(
        .clk(clk),
        .rst_n(rst_n),
        .w_data(mem_ram_w_data[7:0]),
        .wr_en(is_uart),
        .tx(tx)
    );
endmodule
