module TP1
    (input i_Switch_1,
    input i_Switch_2,
    input i_Switch_3,
    input i_Switch_4,
    output o_LED_1,
    output o_LED_2,
    output o_LED_3,);

    wire w_z1, w_z2, w_z3, w_z4;


    assign o_LED_2 = (i_Switch_1 & i_Switch_3) | (i_Switch_2 & i_Switch_4);
    assign o_LED_3 = (i_Switch_1 | !(i_Switch_3)) & (i_Switch_4 | !(i_Switch_2));
    assign o_LED_1 = o_LED_2 | o_LED_3;


endmodule