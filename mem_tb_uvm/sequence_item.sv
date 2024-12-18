class my_sequence_item extends uvm_sequence_item;

    `uvm_object_utils(my_sequence_item);

    function new (string name = "my_sequence_item");
        super.new(name);
    endfunction

    rand logic [31:0]var_d_in_t;
    rand logic [3:0]var_addr_t;
    rand logic var_en_wr_t;
    rand logic var_rst_t;
    rand logic var_en_rd_t;
    
         logic [31:0]var_d_out_t;


    //constraint constr1 {var_d_in_t inside {[1:5]};}
    //constraint constr2 {unique {var_en_wr_t,var_en_rd_t};}
    //constraint constr3 {(var_rst_t == 0) -> (var_en_wr_t == 0) && (var_en_rd_t == 0);}
    //constraint constr4 {(var_en_rd_t == 1) -> (var_d_in_t == 32'hxxxxxxxx);}

endclass: my_sequence_item
