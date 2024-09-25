module TP5 
    (
        input i_Clock,
        output o_LED_1,
        output o_LED_2,
        output o_LED_3,
        output o_LED_4,
    );
    localparam COUNT_LIMIT = 12500000;

    reg [24:0] r_Count = 25'd0;

    reg r_LED_1 = 1'b0;
    reg r_LED_2 = 1'b0;
    reg r_LED_3 = 1'b0;
    reg r_LED_4 = 1'b0;

    assign o_LED_1 = r_LED_1;
    assign o_LED_2 = r_LED_2;
    assign o_LED_3 = r_LED_3;
    assign o_LED_4 = r_LED_4;

    always @(posedge i_Clock)
    begin
        if (r_Count == COUNT_LIMIT)
        begin
            r_Count <= 0;
            r_LED_1 <= ~r_LED_1;
        end
        else
        begin
            r_Count <= r_Count + 1;
        end

        if (r_Count == COUNT_LIMIT/2)
        begin
            r_LED_2 <= ~r_LED_2;
        end

        if (r_Count == COUNT_LIMIT/4)
        begin
            r_LED_3 <= ~r_LED_3;
        end

        if (r_Count == COUNT_LIMIT/8)
        begin
            r_LED_4 <= ~r_LED_4;
        end
    end


endmodule