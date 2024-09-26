module LED_Toggle_Project
 (input  i_Clk,
  input  i_Switch_1,
  output o_LED_1);

  localparam DEBOUNCE_LIMIT = 20;

  reg r_LED_1    = 1'b0;
  reg r_Switch_1 = 1'b0;

  wire switch_1_debounced;
  
  Debounce_Filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) uut (
    .i_Clk(i_Clk),
    .i_Bouncy(i_Switch_1),
    .o_Debounced(switch_1_debounced)
  );

  // Purpose: Toggle LED output when i_Switch_1 is released.
  always @(posedge i_Clk)
  begin

    r_Switch_1 <= switch_1_debounced;

    // This conditional expression looks for a falling edge on i_Switch_1.
    // Here, the current value (i_Switch_1) is low, but the previous value
    // (r_Switch_1) is high.  This means that we found a falling edge.
    if (r_Switch_1 == 1'b0 && switch_1_debounced == 1'b1)
    begin
      r_LED_1 <= ~r_LED_1;  // Toggle the LED
    end
  end
 
  assign o_LED_1 = r_LED_1;
 
endmodule
