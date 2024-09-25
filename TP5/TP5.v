module TP5 
    (
        input i_Clock,
        output o_LED_1,
    );

    reg [24:0] r_Count = 25'd0;

    reg r_LED = 1'b0;

    assign o_LED_1 = r_LED;

    always @(posedge i_Clock)
    begin
        if (r_Count == 25'd12500000)
        begin
            r_Count <= 25'd0;
            r_LED <= ~r_LED;
        end
        else
        begin
            r_Count <= r_Count + 1;
        end
    end


endmodule