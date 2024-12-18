class packet extends uvm_object;

    `uvm_object_utils(packet);
    function new(string name="packet");
        super.new(name);
    endfunction
    function print(string s);
        $display("%s",s);
    endfunction
    
endclass