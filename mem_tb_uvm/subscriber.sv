class my_subscriber extends uvm_subscriber #(my_sequence_item);

    `uvm_component_utils(my_subscriber);

    my_sequence_item seq_item;
    uvm_tlm_analysis_fifo #(my_sequence_item) m_tlm_fifo;
    uvm_get_port #(my_sequence_item) m_get_port;

    covergroup group_1;
        data_in  : coverpoint seq_item.var_d_in_t {bins bin_1[]=default;} 
        addr     : coverpoint seq_item.var_addr_t;
        en_wr    : coverpoint seq_item.var_en_wr_t; 
        rst      : coverpoint seq_item.var_rst_t; 
        en_rd    : coverpoint seq_item.var_en_rd_t;
        data_out : coverpoint seq_item.var_d_out_t {bins bin_1[]=default;} 
    endgroup 

    function new (string name = "my_subscriber", uvm_component parent = null);
        super.new(name,parent);
        group_1 = new();
    endfunction
    
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);

        m_tlm_fifo = new("m_tlm_fifo",this);
        m_get_port = new("m_get_port",this);
        seq_item = my_sequence_item::type_id::create("seq_item");
    endfunction 

    task run_phase (uvm_phase phase);
        forever
        begin   
            m_get_port.get(seq_item);
            $display("recieved @ %0t xxxxxxxxxxxxxxxxx subscriber :: %h",$time,seq_item.var_d_in_t);
            group_1.sample();
        end
    endtask

    function void write (my_sequence_item t);    
    endfunction

endclass: my_subscriber