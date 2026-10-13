module m_ext #(
    parameter int unsigned PIPELINE_STAGE = 2
)(
    input logic clk,
    input logic rst_n,
    input logic id_ex_valid,
    input logic id_ex_is_m_ext,

    input logic [2:0] m_op,
    input logic [31:0] op1,
    input logic [31:0] op2,
    output logic [31:0] m_ext_result,

    output logic m_ext_stall
);
    logic dsp_stall;
    logic div_stall;
    logic [31:0] mul_result;
    logic div_en;
    logic remainder_sel_reg;
    wire [31:0] final_quotient;
    wire [31:0] final_remainder;
    always_comb begin
        if(div_en)begin
            m_ext_result = remainder_sel_reg ? final_remainder : final_quotient;
        end else begin
            m_ext_result = mul_result;
        end
    end
    assign m_ext_stall = dsp_stall || div_stall;

    logic signed [65:0] full_product;
    logic signed [32:0] signed_op1;
    logic signed [32:0] signed_op2;

    localparam integer WIDTH = (PIPELINE_STAGE > 0) ? $clog2(PIPELINE_STAGE + 1) : 1;
    logic [WIDTH-1:0] stage_reg;
    
    always_ff @(posedge clk)begin
        if (!rst_n) begin
            stage_reg <= 0;
        end else if (id_ex_valid && id_ex_is_m_ext && !m_op[2] && stage_reg < PIPELINE_STAGE) begin
            stage_reg <= stage_reg + 1;
        end else begin
            stage_reg <= 0;
        end
    end
    assign dsp_stall = id_ex_valid && id_ex_is_m_ext && !m_op[2] && (stage_reg < PIPELINE_STAGE);

    always_comb begin
        if (m_op == 3'b001 || m_op == 3'b010) begin
            signed_op1 = {op1[31], op1};
        end else begin
            signed_op1 = {1'b0, op1}; 
        end

        if (m_op == 3'b001) begin
            signed_op2 = {op2[31], op2}; 
        end else begin
            signed_op2 = {1'b0, op2}; 
        end

        //full_product = signed_op1 * signed_op2;
        case (m_op)
            3'b000: mul_result = full_product[31:0]; // MUL
            3'b001,3'b010,3'b011: mul_result = full_product[63:32]; // MULH,MULHSU,MULHU
            default: mul_result = 32'b0;
        endcase
    end

    mult_gen_0 u_mult_gen_0 (
        .CLK(clk),
        .A(signed_op1),
        .B(signed_op2),
        .P(full_product)
    );

    logic div_ready;
    logic [31:0] quotient;
    logic [31:0] remainder;
    always_comb begin
        if (id_ex_valid && id_ex_is_m_ext && m_op[2]) begin
            div_en = 1'b1;
        end else begin
            div_en = 1'b0;
        end
    end
    wire is_signed = !m_op[0];
    wire is_reminder = m_op[1];
    wire [31:0] op1_abs = (is_signed && op1[31]) ? (-op1) : op1;
    wire [31:0] op2_abs = (is_signed && op2[31]) ? (-op2) : op2;

    wire op1_sign = is_signed & op1[31];
    wire op2_sign = is_signed & op2[31];
    logic quotient_sign_reg;
    logic remainder_sign_reg;
    logic divisor_zero_reg;
    // Forwarding operands can change while EX is held. Save the signs at start.
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            quotient_sign_reg <= 1'b0;
            remainder_sign_reg <= 1'b0;
            remainder_sel_reg <= 1'b0;
            divisor_zero_reg <= 1'b0;
        end else if (div_en && div_ready) begin
            quotient_sign_reg <= op1_sign ^ op2_sign;
            remainder_sign_reg <= op1_sign;
            remainder_sel_reg <= is_reminder;
            divisor_zero_reg <= (op2 == 32'b0);
        end
    end
    div u_div(
        .clk(clk),
        .rst_n(rst_n),
        .dividend(op1_abs),
        .divisor(op2_abs),
        .quotient(quotient),
        .remainder(remainder),
        .div_en(div_en),
        .div_ready(div_ready),
        .div_stall(div_stall)
    );
    assign final_quotient = divisor_zero_reg ? 32'hFFFF_FFFF :
                            quotient_sign_reg ? (-quotient) : quotient;
    assign final_remainder = remainder_sign_reg ? (-remainder) : remainder;
endmodule

module div(
    input  logic        clk,
    input  logic        rst_n,
    input  logic [31:0] dividend,
    input  logic [31:0] divisor,

    output logic [31:0] quotient,
    output logic [31:0] remainder,

    input  logic        div_en,
    output logic        div_ready,
    output logic        div_stall
);
    typedef enum logic [1:0] {IDLE, PREPARE, CALCULATE, DONE} div_state_t;
    div_state_t state;
    logic [31:0] divisor_reg;
    logic [31:0] dividend_reg;

    logic [5:0]  leading_one_pos;
    logic        found;

    logic [5:0]  counter;
    logic [31:0] rem_reg;
    logic [31:0] quo_reg;

    logic [32:0] rem_shifted;
    logic [32:0] rem_sub;
    logic        sub_valid;

    assign leading_one_pos = 6'd32;

    // Stall on the request cycle too; DONE releases the current EX instruction.
    assign div_ready = (state == IDLE);
    assign div_stall = div_en && (state != DONE);

    assign rem_shifted = {rem_reg, dividend_reg[counter]};
    assign rem_sub     = rem_shifted - {1'b0, divisor_reg};
    assign sub_valid   = (rem_shifted >= {1'b0, divisor_reg});

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state       <= IDLE;
            divisor_reg <= 32'b0;
            dividend_reg <= 32'b0;
            counter     <= 6'd0;
            quo_reg     <= 32'b0;
            rem_reg     <= 32'b0;
        end else if (!div_en) begin
            // A flushed/invalid EX instruction cancels its outstanding division.
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    divisor_reg <= divisor;
                    dividend_reg <= dividend;
                    quo_reg <= 32'b0;
                    rem_reg <= 32'b0;
                    state <= PREPARE;
                end
                PREPARE: begin
                    // leading_one_pos now describes the newly latched dividend.
                    if (divisor_reg == 32'b0) begin
                        quo_reg <= 32'hFFFF_FFFF;
                        rem_reg <= dividend_reg;
                        state <= DONE;
                    end else if (leading_one_pos == 6'd0) begin
                        state <= DONE;
                    end else begin
                        counter <= leading_one_pos - 6'd1;
                        state <= CALCULATE;
                    end
                end
                CALCULATE: begin
                    if (sub_valid) begin
                        rem_reg          <= rem_sub[31:0];
                        quo_reg[counter] <= 1'b1;
                    end else begin
                        rem_reg          <= rem_shifted[31:0];
                        quo_reg[counter] <= 1'b0;
                    end

                    if (counter == 6'd0) begin
                        state <= DONE;
                    end else begin
                        counter     <= counter - 1'b1;
                    end
                end
                // The core advances EX on this edge: division is its only stall.
                DONE: state <= IDLE;
                default: state <= IDLE;
            endcase
        end
    end

    assign quotient  = quo_reg;
    assign remainder = rem_reg;

endmodule

    //大坑
    //当表达式中同时出现 signed 和 unsigned 操作数时，整个表达式会被强制按 unsigned（无符号）计算。
    // always_comb begin
    //     product = 64'b0;
    //     mul_result  = 32'b0;

    //     case (m_op)
    //         3'b000: begin // MUL
    //             product = op1 * op2;
    //             mul_result  = product[31:0];
    //         end

    //         3'b001: begin // MULH
    //             product = $signed(op1) * $signed(op2);
    //             mul_result  = product[63:32];
    //         end

    //         3'b010: begin // MULHSU
    //             product = $signed(op1) * $unsigned(op2);
    //             mul_result  = product[63:32];
    //         end

    //         3'b011: begin // MULHU
    //             product = $unsigned(op1) * $unsigned(op2);
    //             mul_result = product[63:32];
    //         end

    //         default: begin
    //             mul_result = 32'b0;
    //         end
    //     endcase
    // end
