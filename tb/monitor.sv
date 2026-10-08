class monitor;
  virtual intf vif;
  mailbox mon2sco;
  transaction trans;
  
  function new( virtual intf vif,mailbox mon2sco);
        this.vif=vif;
        this.mon2sco=mon2sco;
      endfunction
     
  task main();
    repeat(5)
        begin
          #5;
          //transaction trans;
          trans=new();
        trans.a=vif.a;
        trans.b=vif.b;
        trans.c=vif.c;
        trans.sum=vif.sum;
        trans.carry=vif.carry;
          mon2sco.put(trans);
          trans.display("MONITOR");
          end
      endtask
endclass
        
        