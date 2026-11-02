module uart_axi_slave#(
    parameter UART_BASE = 32'h0001_0000
)(
    axi_lite_if.slave axi,
    output logic uart_tx,
    input  logic uart_rx
);
    logic [7:0] tx_w_data;
    logic tx_wr_en;
    logic tx_full;
    localparam UART_TX_DATA = UART_BASE;
    localparam UART_RX_DATA = UART_BASE + 4;

    // write channel 必须保证aw有效才能写，不能单独w先到但是aw未到
    logic aw_done;
    wire aw_fire = axi.aw_ready && axi.aw_valid ;
    assign axi.aw_ready = !axi.b_valid && !aw_done;
    assign axi.w_ready = !tx_full && !axi.b_valid && aw_done;
    wire w_fire = axi.w_ready && axi.w_valid;
    wire b_fire = axi.b_ready && axi.b_valid;
    logic [31:0] axi_aw_addr;
    wire is_tx_addr = (axi_aw_addr == UART_TX_DATA);
    always_ff @(posedge axi.aclk or negedge axi.aresetn)begin
        if (!axi.aresetn)begin
            tx_wr_en <= 1'b0;
            axi.b_valid <= 1'b0;
            aw_done <= 1'b0;
            axi_aw_addr <= 'b0;
        end else begin
            tx_wr_en <= 1'b0;
            if (aw_fire) begin 
                aw_done <= 1'b1;
                axi_aw_addr <= axi.aw_addr;
            end
            if (w_fire) begin
                if(is_tx_addr && axi.w_strb[0])begin
                    tx_w_data <= axi.w_data[7:0];
                    tx_wr_en <= 1'b1;
                end
                axi.b_resp <= is_tx_addr ? 2'b00 : 2'b10;
                axi.b_valid <= 1'b1;
                aw_done <= 1'b0;
            end
            if (b_fire) axi.b_valid <= 1'b0;
        end
    end

    //read channeel

    uart_top#(
        .CLK_FREQ(100_000_000),
        .BAUD_RATE(115200)
    ) u_uart_top(
        .clk      (axi.aclk),
        .rst_n    (axi.aresetn),
        .tx_w_data(tx_w_data),
        .tx_wr_en (tx_wr_en),
        .uart_tx  (uart_tx),
        .uart_rx  (uart_rx),
        .tx_full  (tx_full)
    );

endmodule