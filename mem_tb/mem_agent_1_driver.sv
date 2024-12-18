class agent_1_driver;
    mem_sequence trans_d;
    
    task connect_send_trans(virtual agent_1_intf k1);
        k1.d_in = trans_d.var_d_in_t;
        k1.addr = trans_d.var_addr_t;
        k1.en_wr = trans_d.var_en_wr_t;
        k1.rst = trans_d.var_rst_t;
        k1.en_rd = trans_d.var_en_rd_t;
    endtask
endclass: agent_1_driver