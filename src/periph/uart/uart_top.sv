module uart_top(
    input  logic       clk,
    input  logic       rst_n,
    
    input  logic [7:0] w_data,
    input  logic       wr_en,

    output logic       tx
);

    logic full;
    logic empty;
    logic tx_accept;
    logic [7:0] rd_data;
    sync_fifo #(
        .DATA_WIDTH(8),
        .FIFO_DEPTH(128)
    ) u_sync_fifo (
        .clk    (clk),
        .rst_n  (rst_n),
        .wr_en  (wr_en),
        .wr_data(w_data),
        .rd_en  (tx_accept),
        .rd_data(rd_data),
        .full   (full),
        .empty  (empty)
    );

    uart_tx #(
        .CLK_FREQ(100_000_000),
        .BAUD_RATE(115200)
    ) u_uart_tx (
        .clk      (clk),
        .rst_n    (rst_n),
        .tx_valid (!empty),
        .tx_data  (rd_data),
        .tx       (tx),
        .tx_busy  (),
        .tx_accept(tx_accept)
    );

endmodule
