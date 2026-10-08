`include "environment"
program test(intf i_intf);
  environment env;
  initial begin
    env = new(i_intf);
    env.run();
    $finish;
  end
endprogram
