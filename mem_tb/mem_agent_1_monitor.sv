class agent_1_monitor;
    mem_sequence trans_m;
    function new();
        trans_m = new;
    endfunction:new

    task connect_recieve_trans(virtual agent_1_intf k1);
        trans_m.var_d_in_t = k1.d_in;
        trans_m.var_addr_t = k1.addr;
        trans_m.var_en_wr_t = k1.en_wr;
        trans_m.var_rst_t = k1.rst;
        trans_m.var_en_rd_t = k1.en_rd;
        trans_m.var_d_out_t = k1.d_out;
        
        
        $display("recieved ......... Monitor %h",trans_m.var_d_out_t);
    endtask
endclass: agent_1_monitor