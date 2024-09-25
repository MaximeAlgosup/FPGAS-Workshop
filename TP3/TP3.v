module TP3
    (
        input i_Clock,
        input i_Switch_1,
        output o_LED_1,
    );

    reg r_LED_1, r_SW_1;

    always @(posedge i_Clock)
    begin
        pressed <= i_Switch_1;

        if (i_Switch_1 == 0 && pressed == 1 && r_LED_1 == 0)
        begin
            r_LED_1 <= 1;
        end
        else if (i_Switch_1 == 0 && pressed == 1 && r_LED_1 == 1)
        begin
            r_LED_1 <= 0;
        end

    end

    assign o_LED_1 = r_LED_1;
    

endmodule