`include "pack.sv"
import mem_env_pack ::*;


class env;
  agent_1 agent_1;
  mem_subscriber subscriber;
  mem_scoreboard scoreboard;
  
  function new();
    agent_1 = new;
    subscriber = new;
    scoreboard = new;
  endfunction

  task start_testing(virtual agent_1_intf i2);
    @(negedge i2.clk);
    agent_1.start_test(i2);
    subscriber.trans_subscr = agent_1.mon.trans_m;
    subscriber.group_1.sample();
    scoreboard.trans_sc_br = agent_1.mon.trans_m; 
  endtask

endclass: env