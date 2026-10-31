module mmio_decode(
    input  logic        clk,
    input  logic        rst_n,
    input  logic        ex_mem_is_load,
    input  logic        ex_mem_is_store,
    input  logic        ex_mem_valid,

    input  logic [3:0]  mem_ram_s_we,
    input  logic [31:0] ex_addr_result,
    input  logic [31:0] ex_mem_alu_result,
    input  logic [31:0] mem_ram_w_data,
    output logic [31:0] mem_raw_ram_r_data,

    input  logic [31:0] cpu_rdata,
    output logic        cpu_req,
    output logic        cpu_we, //0:load,1:store
    output logic [31:0] cpu_addr,
    output logic [31:0] cpu_wdata,
    output logic [3:0]  cpu_wstrb
);

    wire is_rd_ram = (ex_addr_result < 32'h00008000);
    wire [31:0] ram_rd_addr = is_rd_ram ? ex_addr_result : 32'h0;
    wire [31:0] ram_raw_r_data;

    wire is_ram = (ex_mem_alu_result < 32'h00008000);
    wire is_axi = !is_ram && (ex_mem_is_load || ex_mem_is_store);

    ram u_ram(
        .clk       (clk),
        .we        (mem_ram_s_we & {4{is_ram}}),
        .rd_addr   (ram_rd_addr),
        .wr_addr   (ex_mem_alu_result),  //提前吃地址
        .ram_w_data(mem_ram_w_data),
        .ram_r_data(ram_raw_r_data)
    );

    assign mem_raw_ram_r_data = is_ram? ram_raw_r_data :
                                is_axi? cpu_rdata :
                                32'h0;

    assign cpu_req = is_axi && ex_mem_valid;
    assign cpu_we = (mem_ram_s_we != 4'b0);
    assign cpu_addr = ex_mem_alu_result;
    assign cpu_wdata = mem_ram_w_data;
    assign cpu_wstrb = mem_ram_s_we;

    // uart_top u_uart_top(
    //     .clk   (clk),
    //     .rst_n (rst_n),
    //     .w_data(mem_ram_w_data[7:0]),
    //     .wr_en (is_uart),
    //     .tx    (tx)
    // );
endmodule
