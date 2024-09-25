module TP2
    (input i_Switch_1,
    input i_Switch_2,
    input i_Switch_3,
    input i_Switch_4,
    output o_LED_1,
    output o_LED_2);

    wire w_z1, w_z2;

    and_gate u_and_gate_1(
        .w_a(i_Switch_1),
        .w_b(i_Switch_2),
        .y(w_z1)
    );


    assign o_LED_1 = w_z1;

    and_gate u_and_gate_2(
        .w_a(i_Switch_4),
        .w_b(i_Switch_3),
        .y(w_z2)
    );

    assign o_LED_2 = w_z2;
endmodule