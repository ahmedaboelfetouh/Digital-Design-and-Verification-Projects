class my_driver extends uvm_driver #(my_sequence_item);

    `uvm_component_utils(my_driver);
    
    my_sequence_item seq_item;

    virtual intf config_virtual;
    virtual intf local_virtual;

    function new (string name = "my_driver", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(virtual intf)::get(this,"","my_vif",config_virtual))
            `uvm_fatal(get_full_name(),"EROOOOOOOOR!!")
        local_virtual = config_virtual;

        seq_item = my_sequence_item::type_id::create("seq_item");
    endfunction

    task run_phase (uvm_phase phase);
        forever
        begin 
            seq_item_port.get_next_item(seq_item);
            
            @(negedge local_virtual.clk);
            //send data on virtual interface
            local_virtual.d_in <= seq_item.var_d_in_t;
            local_virtual.addr <= seq_item.var_addr_t;
            local_virtual.en_wr <= seq_item.var_en_wr_t;
            local_virtual.rst <= seq_item.var_rst_t;
            local_virtual.en_rd <= seq_item.var_en_rd_t;
            $display("%t :: driver sent transaction",$time);
            #1 seq_item_port.item_done(seq_item);
            
        end

    endtask 

endclass: my_driver