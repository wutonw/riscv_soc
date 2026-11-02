module uart_top#(
    parameter CLK_FREQ = 100_000_000,
    parameter BAUD_RATE = 115200
)(
    input  logic       clk,
    input  logic       rst_n,
    
    input  logic [7:0] tx_w_data,
    input  logic       tx_wr_en,

    output logic       uart_tx,
    input  logic       uart_rx,

    output logic      tx_full
);

    logic tx_full;
    logic tx_empty;
    logic tx_accept;
    logic [7:0] tx_rd_data;

    //tx2
    sync_fifo #(
        .DATA_WIDTH(8),
        .FIFO_DEPTH(128)
    ) u_sync_fifo_tx (
        .clk    (clk),
        .rst_n  (rst_n),
        .wr_en  (tx_wr_en),
        .wr_data(tx_w_data),
        .rd_en  (tx_accept),
        .rd_data(tx_rd_data),
        .full   (tx_full),
        .empty  (tx_empty)
    );
    uart_tx #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) u_uart_tx (
        .clk      (clk),
        .rst_n    (rst_n),
        .tx_valid (!tx_empty),
        .tx_data  (tx_rd_data),
        .tx       (uart_tx),
        .tx_busy  (),
        .tx_accept(tx_accept)
    );

    //rx
    logic [7:0] rx_data;
    logic rx_done;
    uart_rx #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) u_uart_rx(
        .clk    (clk),
        .rst_n  (rst_n),
        .rx     (uart_rx),
        .rx_busy(),
        .rx_data(rx_data),
        .rx_done(rx_done)
    );
    sync_fifo #(
        .DATA_WIDTH(8),
        .FIFO_DEPTH(256)
    ) u_sync_fifo_rx (
        .clk    (clk),
        .rst_n  (rst_n),
        .wr_en  (rx_done),
        .wr_data(rx_data),
        .rd_en  (),
        .rd_data(),
        .full   (),
        .empty  ()
    );

endmodule
