
//推荐配合 FWFT的FIFO 使用
//tx_valid = !empty , fifo_rd_en = tx_accept

module uart_tx #(
    parameter CLK_FREQ = 27_000_000,
    parameter BAUD_RATE = 115_200
)(
    input            clk,
    input            tx_valid,
    input      [7:0] tx_data,
    input            rst_n,
    output reg       tx,
    output reg       tx_busy,
    output reg       tx_accept
);
    parameter BUSY = 1'b1;
    parameter IDLE = 1'b0;

    //reg tx0; reg tx1;
    //wire tx_rise; //上升沿检测
    // always @(posedge clk) begin
    //     tx0 <= tx_valid;
    //     tx1 <= tx0;
    // end
    // assign tx_rise = tx0 & (~tx1); //上升沿检测

    reg [3:0] bit_count; // 起始位、第0~7位、停止位，总共10个位
    reg [7:0] tx_data_reg; // 把要发的数据锁死，防止发送中途数据发生变化
    reg [31:0] phase_acc;

    always @(posedge clk)begin
        if(!rst_n)begin
            tx_data_reg <= 8'd0;
            bit_count <= 4'd0;
            tx_busy <= IDLE;
            tx <= 1'b1;
            phase_acc<= 0;
            tx_accept <= 1'b0;
        end else begin
            tx_accept <= 1'b0;
            case(tx_busy)
                IDLE:begin
                    bit_count <= 4'd0;
                    tx <= 1'b1;
                    if(tx_valid)begin
                        tx_busy <= BUSY;
                        tx_data_reg <= tx_data;
                        tx_accept <= 1'b1;
                        phase_acc<= CLK_FREQ - BAUD_RATE;//空闲线稳定后，接受请求下一拍启动发送
                    end
                end
                BUSY:begin
                    if (phase_acc + BAUD_RATE >= CLK_FREQ) begin
                        phase_acc <= phase_acc + BAUD_RATE - CLK_FREQ;
                        if(bit_count == 0)begin
                            tx <= 1'b0; // 起始位
                            bit_count <= bit_count + 1'b1;
                        end else if(bit_count <= 4'd8)begin
                            tx <= tx_data_reg[0];
                            tx_data_reg <= {1'b0,tx_data_reg[7:1]};
                            bit_count <= bit_count + 1'b1;
                        end else if(bit_count==4'd9) begin
                            tx <= 1'b1; // 停止位
                            if (tx_valid) begin
                                tx_data_reg <= tx_data;
                                bit_count <= 4'd0;
                                tx_accept <= 1'b1;
                                // phase_acc 顺着往下溢出
                            end else begin
                                bit_count <= 4'd10;//防半双工换向抽风
                            end
                        end else begin
                            tx_busy <= IDLE;
                        end
                    end else begin
                        phase_acc <= phase_acc + BAUD_RATE;
                    end
                end            
            endcase
        end
    end

endmodule