module mem_16x32(
    input logic [31:0]d_in,
    input logic [3:0]addr,
    input logic en_wr,
    input logic clk,
    input logic rst,
    input logic en_rd,
    output logic [31:0]d_out
);
logic [31:0]mem[16];

always @(posedge clk or negedge rst)
begin
    if(!rst)
    begin
      foreach(mem[i])
      begin
        mem[i] = 32'b0;
      end   
    end
    else if(en_wr)
    begin
        mem[addr] = d_in;
    end
    else if(en_rd)
    begin
        d_out = mem[addr];
    end
    else 
    begin
        d_out = 32'bx;
    end
end
endmodule