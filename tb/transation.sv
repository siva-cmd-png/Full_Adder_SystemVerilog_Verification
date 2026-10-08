class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  bit sum;
  bit carry;
  
  function void display(string name);
    $display("--------------------");
    $display("%s",name);
    $display("a=%0d,b=%0d,c=%0d",a,b,c);
    $display("sum=%0d,carry=%0d",sum,carry);
  endfunction
  
 
endclass
