module password_tb();

    reg clk;
    reg rst;
    reg next;
    reg [3:0] switch;

    wire [6:0] HEX0;
    wire [6:0] HEX1;
    wire [6:0] HEX2;
    wire [6:0] HEX3;

    password dut(
        .clk(clk),
        .rst(rst),
        .next(next),
        .switch(switch),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3)
    );

    initial 
        begin
            clk = 0;
            forever #10 clk = ~clk;
        end

    initial 
        begin
            rst = 1; 
            next = 0; 
            switch = 0; 
            #20;

            rst = 0;

            switch = 4'h1; #20;
            next = 1; #20;
            next = 0; #20;

            switch = 4'h2; #20;
            next = 1; #20;
            next = 0; #20;

            switch = 4'h3; #20;
            next = 1; #20;
            next = 0; #20;

            switch = 4'h4; #20;
            next = 1; #20;
            next = 0; #40;

            rst = 1; #20;
            rst = 0; #20;

            switch = 4'h5; #20;
            next = 1; #20;
            next = 0; #40;

            $stop;
            $finish;
        end

    initial 
        begin
            $monitor("rst = %b, next = %b, switch = %h, HEX3 = %b, HEX2 = %b, HEX1 = %b, HEX0 = %b", rst, next, switch, HEX3, HEX2, HEX1, HEX0);
        end

    initial 
        begin
            $dumpfile("password_tb.vcd");
            $dumpvars(0, password_tb);
        end

endmodule
