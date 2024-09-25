module project_gates
    (input i_Switch_1,
    input i_Switch_2,
    input i_Switch_3,
    input i_Switch_4,
    output o_LED_1,
    output o_LED_2,);

    assign o_LED_1 = i_Switch_1 & i_Switch_2;
    assign o_LED_2 = i_Switch_4 ^ i_Switch_3;

endmodule