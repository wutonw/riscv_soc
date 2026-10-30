module mmio_decode(
    input  logic        clk,
    input  logic        rst_n,
    input  logic        ex_mem_valid,

    input  logic [3:0]  mem_ram_s_we,
    input  logic [31:0] ex_addr_result,
    input  logic [31:0] ex_mem_alu_result,
    input  logic [31:0] mem_ram_w_data,
    output logic [31:0] mem_raw_ram_r_data,

    output logic        tx,
    output logic        axi_stall,
    output logic        axi_error,
    input  logic        axi_error_is_handled,
    //Read Address
    output logic [31:0] ar_addr,
    output logic        ar_valid,
    input  logic        ar_ready,
    output logic [2:0]  ar_prot,

    //Read Data
    input  logic [31:0] r_data,
    input  logic [1:0]  r_resp,
    input  logic        r_valid,
    output logic        r_ready,

    //Write Address
    output logic [31:0] aw_addr,
    output logic        aw_valid,
    input  logic        aw_ready,
    output logic [2:0]  aw_prot,

    //Write Data
    output logic [31:0] w_data,
    output logic [3:0]  w_strb,
    output logic        w_valid,
    input  logic        w_ready,

    //Write Response
    input  logic [1:0]  b_resp,
    input  logic        b_valid,
    output logic        b_ready
);

    wire is_rd_ram = (ex_addr_result < 32'h00008000);
    wire [31:0] ram_rd_addr = is_rd_ram ? ex_addr_result : 32'h0;
    wire [31:0] ram_raw_r_data;

    wire is_ram = (ex_mem_alu_result < 32'h00008000);
    wire is_uart = (ex_mem_alu_result == 32'h0001_0000) && (mem_ram_s_we[0]);
    wire is_axi = !is_ram && !is_uart;

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
    logic cpu_req;
    logic cpu_we; //0:load,1:store
    logic [31:0] cpu_addr;
    logic [31:0] cpu_wdata;
    logic [3:0] cpu_wstrb;
    logic [31:0] cpu_rdata;

    assign cpu_req = is_axi && ex_mem_valid;
    assign cpu_we = (mem_ram_s_we != 4'b0);
    assign cpu_wdata = mem_ram_w_data;
    assign cpu_wstrb = mem_ram_s_we;
    axi_lite_master u_axi_lite_master(
        .*
    );

    // uart_top u_uart_top(
    //     .clk   (clk),
    //     .rst_n (rst_n),
    //     .w_data(mem_ram_w_data[7:0]),
    //     .wr_en (is_uart),
    //     .tx    (tx)
    // );
endmodule
