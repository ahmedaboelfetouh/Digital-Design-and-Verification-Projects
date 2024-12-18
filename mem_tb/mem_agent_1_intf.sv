interface agent_1_intf(input bit clk);
    logic [31:0]d_in;
    logic [3:0]addr;
    logic en_wr;
    logic rst;
    logic en_rd;
    logic [31:0]d_out;
endinterface: agent_1_intf