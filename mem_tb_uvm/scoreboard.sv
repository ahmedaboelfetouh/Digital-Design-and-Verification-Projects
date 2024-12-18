class my_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(my_scoreboard);

    my_sequence_item seq_item;

    uvm_tlm_analysis_fifo #(my_sequence_item) m_tlm_fifo;
    uvm_get_port #(my_sequence_item) m_get_port;
    //uvm_analysis_export #(packet) m_analysis_export;

    function new (string name = "my_scoreboard", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        
        //m_analysis_export = new("m_analysis_export",this);
        m_tlm_fifo = new("m_tlm_fifo",this);
        m_get_port = new("m_get_port",this);
        seq_item = my_sequence_item::type_id::create("seq_item");
    endfunction 

    

    task run_phase (uvm_phase phase);
        forever 
        begin
            m_get_port.get(seq_item);
            //$display("recieved xxxxxxxxxxxxxxxxx scoreboard");
        end 
    endtask

endclass: my_scoreboard