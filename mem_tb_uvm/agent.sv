class my_agent extends uvm_agent;

    `uvm_component_utils(my_agent);

    my_sequencer sequencer; 
    my_driver driver;
    my_monitor monitor;
    
    virtual intf config_virtual;
    virtual intf local_virtual;


    function new (string name = "my_agent", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        sequencer = my_sequencer::type_id::create("sequencer",this);
        driver = my_driver::type_id::create("driver",this);
        monitor = my_monitor::type_id::create("monitor",this); 
        if(!uvm_config_db #(virtual intf)::get(this,"","my_vif",config_virtual))
            `uvm_fatal(get_full_name(),"EROOOOOOOOR!!")
        local_virtual = config_virtual;
        uvm_config_db #(virtual intf)::set(this,"driver","my_vif",local_virtual);
        uvm_config_db #(virtual intf)::set(this,"monitor","my_vif",local_virtual);     
    endfunction 

    function void connect_phase (uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction 

endclass: my_agent