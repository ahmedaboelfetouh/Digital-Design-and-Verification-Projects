class agent_1_sequencer;
    mem_sequence trans_s;

    function new();
        trans_s = new;
    endfunction: new

    task generate_trans_1();
        void'(trans_s.randomize());
    endtask: generate_trans_1

endclass: agent_1_sequencer