module uart_rx #(
    parameter CLK_FREQ = 27_000_000, // 系统时钟频率
    parameter BAUD_RATE = 115_200     // 默认波特率
)(
    input clk,
    input rx,
    input rst_n,
    output reg rx_busy,
    output reg [7:0] rx_data,
    output reg rx_done
);
    parameter BUSY = 1'b1;
    parameter IDLE = 1'b0;

    reg rx_0;
    reg rx_1;
    reg [31:0] phase_acc;
    reg [7:0] rx_shift;
    wire rx_fall; //下降沿检测

    reg [3:0] bit_count; // 起始位、第0~7位、停止位，总共10个位

    always @(posedge clk) begin
        if(!rst_n)begin
            rx_0 <= 1'b1;
            rx_1 <= 1'b1;
        end else begin
            rx_0 <= rx;
            rx_1 <= rx_0;
        end
    end
    assign rx_fall = (~rx_0) & rx_1; //下降沿检测

    always @(posedge clk)begin
        if(!rst_n)begin
            rx_data <= 8'd0;//数据默认0
            bit_count <= 4'd0;
            rx_busy <= IDLE;//默认空闲
            phase_acc <= CLK_FREQ/2;
            rx_done   <= 1'b0;
        end else begin
            rx_done   <= 1'b0;
            case(rx_busy)
                IDLE:begin
                    bit_count <= {4{1'b0}};
                    phase_acc <= CLK_FREQ/2;
                    if(rx_fall)begin
                        rx_busy <= BUSY;
                        phase_acc <= phase_acc + BAUD_RATE;
                    end
                end
                BUSY:begin
                    if (phase_acc + BAUD_RATE >= CLK_FREQ) begin
                        phase_acc <= phase_acc + BAUD_RATE - CLK_FREQ;
                        if (bit_count == 0)begin
                            if(rx_1 == 1'b0)begin
                                bit_count <= bit_count + 1'b1;
                            end else begin
                                rx_busy <= IDLE;//毛刺
                            end
                        end else if (bit_count <= 4'd8)begin
                            rx_shift[bit_count - 1] <= rx_1;
                            bit_count <= bit_count + 1'b1;
                        end else begin
                            if(rx_1 == 1'b1)begin
                                rx_data <= rx_shift;
                                rx_done <= 1'b1;
                            end
                            rx_busy <= IDLE;
                        end
                    end else begin
                        phase_acc <= phase_acc + BAUD_RATE;
                    end
                end
            endcase
        end
    end
endmodule