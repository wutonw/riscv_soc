module axi_lite_master(
    input  logic        clk,
    input  logic        rst_n,
    output logic        axi_stall,
    output logic        axi_error,
    input  logic        axi_error_is_handled,

    input  logic        cpu_req,
    input  logic        cpu_we,  //0:load,1:store
    input  logic [31:0] cpu_addr,
    input  logic [31:0] cpu_wdata,
    input  logic [3:0]  cpu_wstrb,
    output logic [31:0] cpu_rdata,

    axi_lite_if.master axi
);  
    assign axi_stall = cpu_req && !resp_done;
    assign axi_error = ((state == RRESP && r_fire && axi.r_resp != 2'b00) ||
                        (state == WRESP && b_fire && axi.b_resp != 2'b00));

    wire resp_done = ((state == WRESP) && b_fire) || ((state == RRESP) && r_fire);

    wire ar_fire = axi.ar_valid && axi.ar_ready;
    wire r_fire = axi.r_valid && axi.r_ready;
    wire aw_fire = axi.aw_valid && axi.aw_ready;
    wire w_fire = axi.w_valid && axi.w_ready;
    wire b_fire = axi.b_valid && axi.b_ready;
    
    typedef enum logic [2:0] {IDLE,WADDR,WRESP,RADDR,RRESP} axi_state_t;
    axi_state_t state;
    // Avoid 3-stage FSM, becaude it introduces an extra bubble per resp.
    // axi_state_t next_state;
    // always_ff @(posedge clk or negedge rst_n)begin
    //     if(!rst_n)begin
    //         state <= IDLE;
    //     end else begin
    //         state <= next_state;
    //     end
    // end
    
    assign cpu_rdata = (state == RRESP && r_fire) ? axi.r_data : rdata_buf;
    logic [31:0] rdata_buf;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) rdata_buf <= '0;
        else if (r_fire) rdata_buf <= axi.r_data;
    end

    assign axi.aw_prot = 3'b000;
    assign axi.ar_prot = 3'b000;
    logic w_done;
    logic aw_done;
    always_ff @(posedge clk or negedge rst_n)begin
        if (!rst_n)begin
            state <= IDLE;
            axi.ar_valid <= 0;
            axi.r_ready <= 0;
            axi.aw_valid <= 0;
            axi.w_valid <= 0;
            axi.b_ready <= 0;
            aw_done <= 1'b0;
            w_done <= 1'b0;
        end else begin
            case (state)
                IDLE:begin
                    aw_done <= 1'b0;
                    w_done <= 1'b0;
                    if(cpu_req)begin
                        if(cpu_we)begin
                            axi.aw_addr <= cpu_addr;
                            axi.w_data <= cpu_wdata;
                            axi.w_strb <= cpu_wstrb;
                            axi.aw_valid <= 1'b1;
                            axi.w_valid <= 1'b1;
                            state <= WADDR;
                        end else begin
                            axi.ar_addr <= cpu_addr;
                            axi.ar_valid <= 1'b1;
                            state <= RADDR;
                        end
                    end
                end
                WADDR: begin
                    if(aw_fire)begin
                        axi.aw_valid <= 1'b0;
                        aw_done <= 1'b1;
                    end
                    if(w_fire)begin
                        axi.w_valid <= 1'b0;
                        w_done <= 1'b1;
                    end
                    if ((aw_done || aw_fire) && (w_done || w_fire)) state <= WRESP;
                end
                WRESP: begin
                    axi.b_ready <= 1'b1;
                    if (b_fire) begin
                        axi.b_ready <= 1'b0;
                        state <= IDLE;
                    end
                end
                RADDR:begin
                    if (ar_fire)begin
                        axi.ar_valid <= 1'b0;
                        state <= RRESP;
                    end
                end
                RRESP:begin
                    axi.r_ready <= 1'b1;
                    if (r_fire)begin
                        axi.r_ready <= 1'b0;
                        state <= IDLE;
                    end
                end
                default: ;
            endcase
        end
    end

endmodule 

