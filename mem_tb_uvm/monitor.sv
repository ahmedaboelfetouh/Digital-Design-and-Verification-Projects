class my_monitor extends uvm_monitor;

    `uvm_component_utils(my_monitor);

    virtual intf config_virtual;
    virtual intf local_virtual;

    my_sequence_item seq_item;

    uvm_analysis_port #(my_sequence_item) m_analysis_port;

    function new (string name = "my_monitor", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(virtual intf)::get(this,"","my_vif",config_virtual))
            `uvm_fatal(get_full_name(),"EROOOOOOOOR!!")
        local_virtual = config_virtual;
        m_analysis_port = new("m_analysis_port",this);
        seq_item = my_sequence_item::type_id::create("seq_item");
    endfunction

    task run_phase (uvm_phase phase);
        forever
        begin
            @(posedge local_virtual.clk);
            seq_item.var_d_in_t  <= local_virtual.d_in ;
            seq_item.var_addr_t  <= local_virtual.addr ;
            seq_item.var_en_wr_t <=  local_virtual.en_wr;
            seq_item.var_rst_t   <=  local_virtual.rst;
            seq_item.var_en_rd_t <=  local_virtual.en_rd;
            @(negedge local_virtual.clk);
            seq_item.var_d_out_t <= local_virtual.d_out;

            #1 
            //$display("recieved @ %0t xxxxxxxxxxxxxxxxx monitor :: %h",$time,seq_item.var_d_in_t);
            //$display("recieved @ %0t xxxxxxxxxxxxxxxxx monitor :: %h",$time,seq_item.var_d_out_t);
            m_analysis_port.write(seq_item);
        end
    endtask  

endclass: my_monitor