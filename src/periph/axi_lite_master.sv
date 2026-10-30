//todo : 后续检查是否fwd逻辑覆盖外设读

module axi_lite_master(
    input  logic        clk,
    input  logic        rst_n,
    output logic        axi_stall,
    output logic        axi_error,
    input  logic        axi_error_is_handled,

    input  logic        cpu_req,
    input  logic        cpu_we,                //0:load,1:store
    input  logic [31:0] cpu_addr,
    input  logic [31:0] cpu_wdata,
    input  logic [3:0]  cpu_wstrb,
    output logic [31:0] cpu_rdata,

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
    assign axi_stall = cpu_req && (state != IDLE) && !resp_done;
    assign axi_error = ((state == RRESP && r_fire && r_resp != 2'b00) ||
                        (state == WRESP && b_fire && b_resp != 2'b00));

    wire resp_done = ((state == WRESP) && b_fire) || ((state == RRESP) && r_fire);

    wire ar_fire = ar_valid && ar_ready;
    wire r_fire = r_valid && r_ready;
    wire aw_fire = aw_valid && aw_ready;
    wire w_fire = w_valid && w_ready;
    wire b_fire = b_valid && b_ready;
    
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
    
    assign cpu_rdata = (state == RRESP && r_fire) ? r_data : rdata_buf;
    logic [31:0] rdata_buf;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) rdata_buf <= '0;
        else if (r_fire) rdata_buf <= r_data;
    end

    assign aw_prot = 3'b000;
    assign ar_prot = 3'b000;
    logic w_done;
    logic aw_done;
    always_ff @(posedge clk or negedge rst_n)begin
        if (!rst_n)begin
            state <= IDLE;
            ar_valid <= 0;
            r_ready <= 0;
            aw_valid <= 0;
            w_valid <= 0;
            b_ready <= 0;
            aw_done <= 1'b0;
            w_done <= 1'b0;
        end else begin
            case (state)
                IDLE:begin
                    aw_done <= 1'b0;
                    w_done <= 1'b0;
                    if(cpu_req)begin
                        if(cpu_we)begin
                            aw_addr <= cpu_addr;
                            w_data <= cpu_wdata;
                            w_strb <= cpu_wstrb;
                            aw_valid <= 1'b1;
                            w_valid <= 1'b1;
                            state <= WADDR;
                        end else begin
                            ar_addr <= cpu_addr;
                            ar_valid <= 1'b1;
                            state <= RADDR;
                        end
                    end
                end
                WADDR: begin
                    if(aw_fire)begin
                        aw_valid <= 1'b0;
                        aw_done <= 1'b1;
                    end
                    if(w_fire)begin
                        w_valid <= 1'b0;
                        w_done <= 1'b1;
                    end
                    if ((aw_done || aw_fire) && (w_done || w_fire)) state <= WRESP;
                end
                WRESP: begin
                    b_ready <= 1'b1;
                    if (b_fire) begin
                        b_ready <= 1'b0;
                        state <= IDLE;
                    end
                end
                RADDR:begin
                    if (ar_fire)begin
                        ar_valid <= 1'b0;
                        state <= RRESP;
                    end
                end
                RRESP:begin
                    r_ready <= 1'b1;
                    if (r_fire)begin
                        r_ready <= 1'b0;
                        state <= IDLE;
                    end
                end
                default: ;
            endcase
        end
    end

endmodule 

