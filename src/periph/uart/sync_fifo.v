module sync_fifo #(
    parameter DATA_WIDTH = 8,   // 8位宽
    parameter FIFO_DEPTH = 1024  // FIFO 深度
)(
    input                    clk    ,
    input                    rst_n  ,
    
    // 写端口
    input                    wr_en  ,
    input   [DATA_WIDTH-1:0] wr_data,
    
    // 读端口
    input                    rd_en  ,
    output  [DATA_WIDTH-1:0] rd_data,
    
    // 状态标志
    output                   full   ,
    output                   empty
);

    localparam PTR_WIDTH = $clog2(FIFO_DEPTH) + 1;
    reg [DATA_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];
    reg [PTR_WIDTH-1:0] wr_ptr;
    reg [PTR_WIDTH-1:0] rd_ptr;

    assign full = wr_ptr[PTR_WIDTH-1] != rd_ptr[PTR_WIDTH-1] && wr_ptr[PTR_WIDTH-2:0] == rd_ptr[PTR_WIDTH-2:0];
    assign empty =(wr_ptr == rd_ptr);
    //写模块
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)begin
            wr_ptr <= 0;
        end else begin
            if (wr_en && !full)begin
                fifo_mem[wr_ptr[PTR_WIDTH-2:0]] <= wr_data;
                wr_ptr <= wr_ptr + 1'b1;
            end
        end
    end

    //读模块
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)begin
            rd_ptr <= 0;
        end else begin
            if (rd_en && !empty)begin
                rd_ptr <= rd_ptr + 1'b1;
            end
        end
    end
    assign rd_data = fifo_mem[rd_ptr[PTR_WIDTH-2:0]];
    
endmodule