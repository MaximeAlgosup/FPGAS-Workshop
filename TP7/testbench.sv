module Debounce_Filter_tb;

  localparam DEBOUNCE_LIMIT = 5;

  reg i_Clk = 0;
  reg i_Bouncy = 0;
  wire o_Debounced;

  Debounce_Filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) uut (
    .i_Clk(i_Clk),
    .i_Bouncy(i_Bouncy),
    .o_Debounced(o_Debounced)
  );

  always #5 i_Clk = ~i_Clk;

  initial begin
    $display("Starting Debounce_Filter Testbench...");
    $dumpfile("Debounce_Filter_tb.vcd");
    $dumpvars(0, Debounce_Filter_tb);
    
    i_Bouncy = 0;
    
    #100;
    i_Bouncy = 1;
    repeat (10) begin
      #10 i_Bouncy = ~i_Bouncy;
    end
    #100 i_Bouncy = 0;
    #100;

    #100;
    i_Bouncy = 0;
    repeat (10) begin
      #10 i_Bouncy = ~i_Bouncy;
    end
    #100 i_Bouncy = 1;
    #100;

    #200;
    $display("End of Debounce_Filter Testbench.");
    $finish;
  end

endmodule
