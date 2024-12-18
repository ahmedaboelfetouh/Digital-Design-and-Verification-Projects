interface intf(input bit clk);
    logic [31:0]d_in;
    logic [3:0]addr;
    logic en_wr;
    logic rst;
    logic en_rd;
    logic [31:0]d_out;
endinterface: intf

package test_pack;
    
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "sequence_item.sv"
    `include "sequence.sv"
    `include "sequencer.sv"
    `include "driver.sv"
    `include "monitor.sv"  
    `include "agent.sv"
    `include "scoreboard.sv"
    `include "subscriber.sv"
    `include "env.sv"
    `include "test.sv"

endpackage: test_pack

