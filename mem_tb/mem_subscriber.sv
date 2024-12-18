class mem_subscriber;
    mem_sequence trans_subscr;

    covergroup group_1;
        data_in  : coverpoint trans_subscr.var_d_in_t {bins bin_1[]=default;} 
        addr     : coverpoint trans_subscr.var_addr_t;
        en_wr    : coverpoint trans_subscr.var_en_wr_t; 
        rst      : coverpoint trans_subscr.var_rst_t; 
        en_rd    : coverpoint trans_subscr.var_en_rd_t;
        data_out : coverpoint trans_subscr.var_d_out_t {bins bin_1[]=default;} 
    endgroup 
    
    function new();
        group_1 = new;
    endfunction

endclass