class driver;
  virtual intf vif;
  mailbox gen2dri;
  function new( virtual intf vif,mailbox gen2dri);
        this.vif=vif;
        this.gen2dri=gen2dri;
      endfunction
      
  task main();
    repeat(5)
        begin
         transaction trans;
          trans=new();
        gen2dri.get(trans);
        vif.a<=trans.a;
        vif.b<=trans.b;
        vif.c<=trans.c;
          #5;
          trans.display("DRIVER") ;
        end
      endtask
endclass
  