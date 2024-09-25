module project_latch
 (input i_Clk,
  input i_Switch_1,
  input i_Switch_2,
  output o_LED_1,
  output o_LED_2,
  output o_LED_3,
  output o_LED_4);

  wire [1:0] w_Select;
  reg [3:0] r_Latch;

always @ (posedge i_Clk)
  begin
    if (w_Select == 2'b00)
      r_Latch <= 4'b0001;
    else if (w_Select == 2'b01)
      r_Latch <= 4'b0011;
    else if (w_Select == 2'b10)
      r_Latch <= 4'b0111;
    else if (w_Select == 2'b11)
      r_Latch <= 4'b1111;
  end

  assign w_Select = {i_Switch_2, i_Switch_1}; // concatenation

  assign o_LED_1 = r_Latch[0];
  assign o_LED_2 = r_Latch[1];
  assign o_LED_3 = r_Latch[2];
  assign o_LED_4 = r_Latch[3];

endmodule
