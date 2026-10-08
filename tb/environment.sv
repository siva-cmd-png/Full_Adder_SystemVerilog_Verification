`include "transaction.sv"
`include "generator.sv"
`include "driver"
`include "monitor"
`include "scoreboard"

class environment;
  generator  gen;
  driver     drv;
  monitor    mon;
  score_board sco;
  mailbox m1;
  mailbox m2;
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    m1 = new();
    m2 = new();
    gen = new(m1);
    drv = new(vif, m1);
    mon = new(vif, m2);
    sco = new(m2);
  endfunction
  
  task test();
    fork
      gen.main();
      drv.main();
      mon.main();
      sco.main();
    join
  endtask
  
  task run();
    test();
  endtask
endclass
