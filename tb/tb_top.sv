`include "interface"
`include "test"

module top;
  intf i_intf();
  test t1(i_intf); full_adder f2(.a(i_intf.a),.b(i_intf.b),.c(i_intf.c),.sum(i_intf.sum),.carry(i_intf.carry));
endmodule