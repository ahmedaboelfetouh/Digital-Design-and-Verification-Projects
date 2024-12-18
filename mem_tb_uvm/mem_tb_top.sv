`include "mem_DUT.sv"

`include "pack.sv"
import test_pack::*;
import uvm_pkg ::*;

module tbench_top ();

bit clk;
always #5 clk = ~clk;

intf i1 (clk);
mem_16x32 mem1(i1.d_in,i1.addr,i1.en_wr,i1.clk,i1.rst,i1.en_rd,i1.d_out);


initial 
begin
    uvm_config_db #(virtual intf)::set(null,"uvm_test_top","my_vif",i1);
    run_test("my_test");
end

endmodule: tbench_top

