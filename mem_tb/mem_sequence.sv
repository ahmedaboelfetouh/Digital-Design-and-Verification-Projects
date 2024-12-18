class mem_sequence;
    rand logic [31:0]var_d_in_t;
    rand logic [3:0]var_addr_t;
    rand logic var_en_wr_t;
    rand logic var_rst_t;
    rand logic var_en_rd_t;
         logic [31:0]var_d_out_t;

    constraint constr_1 {var_d_in_t > 0;}
    constraint constr_2 {var_d_in_t inside {[0:100]};}
    constraint constr_3 {var_addr_t > 0;}
    constraint constr_4 {var_addr_t inside {[0:15]};}

endclass: mem_sequence