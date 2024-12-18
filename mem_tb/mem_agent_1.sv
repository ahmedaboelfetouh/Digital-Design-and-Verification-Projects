class agent_1;
    agent_1_sequencer seq;
    agent_1_driver drv;
    agent_1_monitor mon;

    function new();
        seq = new;
        drv = new;
        mon = new;
    endfunction: new

    task start_test(virtual agent_1_intf k);
      seq.generate_trans_1();
      drv.trans_d = seq.trans_s;
      drv.connect_send_trans(k);
      @(posedge k.clk);
      #1step;
      mon.connect_recieve_trans(k);  
    endtask: start_test

endclass : agent_1