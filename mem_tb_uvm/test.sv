class my_test extends uvm_test;

    `uvm_component_utils(my_test);

    my_env env;
    my_sequence seq;
    virtual intf config_virtual;
    virtual intf local_virtual;

    function new (string name = "my_test", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        env = my_env::type_id::create("env",this);
        seq = my_sequence::type_id::create("seq",this);

        if(!uvm_config_db #(virtual intf)::get(this,"","my_vif",config_virtual))
            `uvm_fatal(get_full_name(),"EROOOOOOOOR!!")
        local_virtual = config_virtual;
        uvm_config_db #(virtual intf)::set(this,"env","my_vif",local_virtual);
    endfunction 

    function void connect_phase (uvm_phase phase);
        env.agent.monitor.m_analysis_port.connect(env.scoreboard.m_tlm_fifo.analysis_export);
        env.scoreboard.m_get_port.connect(env.scoreboard.m_tlm_fifo.get_export);

        env.agent.monitor.m_analysis_port.connect(env.subscriber.m_tlm_fifo.analysis_export);
        env.subscriber.m_get_port.connect(env.subscriber.m_tlm_fifo.get_export);
       
    endfunction

    task run_phase (uvm_phase phase);
        phase.raise_objection(this);   
        seq.start(env.agent.sequencer);
        //$display("test finish xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        phase.drop_objection(this);
    endtask

endclass: my_test