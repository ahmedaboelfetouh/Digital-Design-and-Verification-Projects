class my_env extends uvm_env;

    `uvm_component_utils(my_env);

    my_agent agent;
    my_scoreboard scoreboard;
    my_subscriber subscriber;
    
    virtual intf config_virtual;
    virtual intf local_virtual;

    function new (string name = "my_env", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        agent = my_agent::type_id::create("agent",this);
        scoreboard = my_scoreboard::type_id::create("scoreboard",this);
        subscriber = my_subscriber::type_id::create("subscriber",this);
        
        
        
        if(!uvm_config_db #(virtual intf)::get(this,"","my_vif",config_virtual))
            `uvm_fatal(get_full_name(),"EROOOOOOOOR!!")
        local_virtual = config_virtual;
        uvm_config_db #(virtual intf)::set(this,"agent","my_vif",local_virtual);

        
        
    endfunction 

endclass: my_env