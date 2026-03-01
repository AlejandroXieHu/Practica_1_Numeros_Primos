module password_wr (

    input MAX10_CLK1_50,
    input [9:0] SW,
    input [1:0] KEY,

    output [0:6] HEX0,
    output [0:6] HEX1,
    output [0:6] HEX2,
    output [0:6] HEX3

);

    password dut (

        .clk(MAX10_CLK1_50),
        .rst(~KEY[0]),
        .load(~KEY[1]),
        .SW(SW[3:0]),

        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3)

    );

endmodule
