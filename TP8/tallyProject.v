module tallyProject
    (
        input i_Clk,
        input i_Switch_1,
        input i_Switch_2,
        input i_Switch_3,
        output o_Segment1_A,
        output o_Segment1_B,
        output o_Segment1_C,
        output o_Segment1_D,
        output o_Segment1_E,
        output o_Segment1_F,
        output o_Segment1_G,
        output o_Segment2_A,
        output o_Segment2_B,
        output o_Segment2_C,
        output o_Segment2_D,
        output o_Segment2_E,
        output o_Segment2_F,
        output o_Segment2_G,
    );

    localparam DEBOUNCE_LIMIT = 25000;
    
    reg [7:0] r_Score = 8'b00000000;
    reg pressed = 1'b0;

    wire w_Switch_1, w_Switch_2, w_Switch_3;
    wire w_S1_A, w_S1_B, w_S1_C, w_S1_D, w_S1_E, w_S1_F, w_S1_G;
    wire w_S2_A, w_S2_B, w_S2_C, w_S2_D, w_S2_E, w_S2_F, w_S2_G;
    wire [7:0] w_Score;

    Debounce_Filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_i_Switch_1
    (.i_Clk(i_Clk), 
     .i_Bouncy(i_Switch_1),
     .o_Debounced(w_Switch_1));

    Debounce_Filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_i_Switch_2
    (.i_Clk(i_Clk), 
     .i_Bouncy(i_Switch_2),
     .o_Debounced(w_Switch_2));

    Debounce_Filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) Debounce_i_Switch_3
    (.i_Clk(i_Clk), 
     .i_Bouncy(i_Switch_3),
     .o_Debounced(w_Switch_3));

    Binary_To_7Segment Binary_To_7Segment_i_Score1(
        .i_Clk(i_Clk),
        .i_Binary_Num(w_Score[7:4]),
        .o_Segment_A(w_S1_A),
        .o_Segment_B(w_S1_B),
        .o_Segment_C(w_S1_C),
        .o_Segment_D(w_S1_D),
        .o_Segment_E(w_S1_E),
        .o_Segment_F(w_S1_F),
        .o_Segment_G(w_S1_G)
    );
    
    Binary_To_7Segment Binary_To_7Segment_i_Score2(
        .i_Clk(i_Clk),
        .i_Binary_Num(w_Score[3:0]),
        .o_Segment_A(w_S2_A),
        .o_Segment_B(w_S2_B),
        .o_Segment_C(w_S2_C),
        .o_Segment_D(w_S2_D),
        .o_Segment_E(w_S2_E),
        .o_Segment_F(w_S2_F),
        .o_Segment_G(w_S2_G)
    );

    always @(posedge i_Clk)
    begin
        if (w_Switch_1 && ~pressed && r_Score < 8'b11111111)
        begin
            r_Score <= r_Score + 1'b1;
            pressed <= 1;
        end
        else if (w_Switch_2 && r_Score > 0 && ~pressed)
        begin
            r_Score <= r_Score - 1'b1;
            pressed <= 1;
        end
        else if (w_Switch_3 && ~pressed)
        begin
            r_Score <= 0;
            pressed <= 1;
        end
        else
            pressed <= 0;
        
    end

    assign w_Score = r_Score;
    assign o_Segment1_A = ~w_S1_A;
    assign o_Segment1_B = ~w_S1_B;
    assign o_Segment1_C = ~w_S1_C;
    assign o_Segment1_D = ~w_S1_D;
    assign o_Segment1_E = ~w_S1_E;
    assign o_Segment1_F = ~w_S1_F;
    assign o_Segment1_G = ~w_S1_G;

    assign o_Segment2_A = ~w_S2_A;
    assign o_Segment2_B = ~w_S2_B;
    assign o_Segment2_C = ~w_S2_C;
    assign o_Segment2_D = ~w_S2_D;
    assign o_Segment2_E = ~w_S2_E;
    assign o_Segment2_F = ~w_S2_F;
    assign o_Segment2_G = ~w_S2_G;


endmodule

