`include "mem_env_class.sv"
`include "mem_DUT.sv"
`include "mem_agent_1_intf.sv"



module tbench_top ();
env env1;

bit clk;
always #5 clk = ~clk;

agent_1_intf i1 (clk);
mem_16x32 mem1(i1.d_in,i1.addr,i1.en_wr,i1.clk,i1.rst,i1.en_rd,i1.d_out);
virtual agent_1_intf vif;


initial 
begin
env1 = new;
vif = i1;

//env1.subscriber.group_1.start();
repeat(10)
begin
env1.start_testing(vif);
end
//env1.subscriber.group_1.stop();

end
endmodule: tbench_top

