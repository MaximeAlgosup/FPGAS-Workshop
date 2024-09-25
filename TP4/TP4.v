module TP4
    (
        input i_Switch_1,
        input i_Switch_2,
        input i_Switch_3,
        input i_Switch_4,
        output o_LED_1,
        output o_LED_2,
        output o_LED_3,
    );

    wire xor1, xor2;

    assign xor1 = i_Switch_1 ^ i_Switch_2;
    assign o_LED_1 = xor1 ^ i_Switch_3;
    assign o_LED_2 = (xor1 & i_Switch_3) | (i_Switch_1 & i_Switch_2);


endmodule