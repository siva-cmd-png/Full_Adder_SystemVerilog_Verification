class score_board;
  mailbox mon2sco;
  function new(mailbox mon2sco);
    this.mon2sco = mon2sco;
  endfunction
  task main();
    transaction trans;
    repeat (5) begin
      trans = new();
      mon2sco.get(trans);
 trans.display("SCOREBOARD");
      if ( ((trans.a ^ trans.b ^ trans.c) == trans.sum) &&
           (((trans.a & trans.b) | (trans.b & trans.c) | (trans.c & trans.a)) == trans.carry) )
        $display("VERIFICATION PASSED");
      else
        $display("VERIFICATION FAILED");
    end
  endtask

endclass
