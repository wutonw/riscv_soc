interface axi_lite_if #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input logic aclk,
    input logic aresetn
);

    // Read Address
    logic [ADDR_WIDTH-1:0] ar_addr;
    logic                  ar_valid;
    logic                  ar_ready;
    logic [2:0]            ar_prot;

    // Read Data
    logic [DATA_WIDTH-1:0] r_data;
    logic [1:0]            r_resp;
    logic                  r_valid;
    logic                  r_ready;

    // Write Address
    logic [ADDR_WIDTH-1:0] aw_addr;
    logic                  aw_valid;
    logic                  aw_ready;
    logic [2:0]            aw_prot;

    // Write Data
    logic [DATA_WIDTH-1:0] w_data;
    logic [DATA_WIDTH/8-1:0] w_strb;
    logic                  w_valid;
    logic                  w_ready;

    // Write Response
    logic [1:0]            b_resp;
    logic                  b_valid;
    logic                  b_ready;


    // Master Modport
    modport master (
        input  aclk,
        input  aresetn,

        output ar_addr,
        output ar_valid,
        input  ar_ready,
        output ar_prot,

        input  r_data,
        input  r_resp,
        input  r_valid,
        output r_ready,

        output aw_addr,
        output aw_valid,
        input  aw_ready,
        output aw_prot,

        output w_data,
        output w_strb,
        output w_valid,
        input  w_ready,

        input  b_resp,
        input  b_valid,
        output b_ready
    );


    // Slave Modport
    modport slave (
        input  aclk,
        input  aresetn,

        input  ar_addr,
        input  ar_valid,
        output ar_ready,
        input  ar_prot,

        output r_data,
        output r_resp,
        output r_valid,
        input  r_ready,

        input  aw_addr,
        input  aw_valid,
        output aw_ready,
        input  aw_prot,

        input  w_data,
        input  w_strb,
        input  w_valid,
        output w_ready,

        output b_resp,
        output b_valid,
        input  b_ready
    );

endinterface

