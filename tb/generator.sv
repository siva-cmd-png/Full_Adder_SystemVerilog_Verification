class generator;
  mailbox gen2dri;
  
  function new(mailbox gen2dri);
    this.gen2dri = gen2dri;
  endfunction

  task main();
    transaction trans;
    repeat (10) 
      begin
      trans = new();                 
      trans.randomize();      
      gen2dri.put(trans);             
        trans.display("GENERATOR");
    end
  endtask
endclass
