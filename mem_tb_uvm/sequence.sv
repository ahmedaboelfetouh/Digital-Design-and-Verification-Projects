class my_sequence extends uvm_sequence;

    `uvm_object_utils(my_sequence);

    my_sequence_item seq_item;
      
    function new (string name = "my_sequence");
        super.new(name);
    endfunction

    task pre_body;
        seq_item = my_sequence_item::type_id::create("seq_item");    
    endtask

    task body;
        for(int i=0;i<5;i++)
        begin
            start_item(seq_item);
            seq_item.randomize();
            //seq_item.var_d_in_t = 32'hxxxxxxxx;
            //seq_item.var_addr_t = 4'hx;
            seq_item.var_en_wr_t = 1'bx;
            seq_item.var_rst_t = 1'b0;
            seq_item.var_en_rd_t = 1'bx;
            finish_item(seq_item);
            start_item(seq_item);
            seq_item.randomize();
            //seq_item.var_d_in_t = 32'h00001111;
            //seq_item.var_addr_t = 4'h0;
            seq_item.var_en_wr_t = 1'b1;
            seq_item.var_rst_t = 1'b1;
            seq_item.var_en_rd_t = 1'b0;
            finish_item(seq_item);
            start_item(seq_item);
            seq_item.randomize();
            //seq_item.var_d_in_t = 32'hxxxxxxxx;
            //seq_item.var_addr_t = 4'h0;
            seq_item.var_en_wr_t = 1'b0;
            seq_item.var_rst_t = 1'b1;
            seq_item.var_en_rd_t = 1'b1;
            finish_item(seq_item);
            //#10;
        end
    endtask

endclass: my_sequence