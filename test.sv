module test();

logic new_clk;
logic Clock = 0;

always
  begin
    #10 Clock = 1;
    #10 Clock = 0;
  end
 clk_div dut(Clock,new_clk);
 endmodule
 