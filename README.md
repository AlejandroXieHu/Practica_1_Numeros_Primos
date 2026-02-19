# Práctica 1: Detector de Números Primos

## Num_Primos.v

```verilog
module Num_Primos (

	input [3:0] SW,
	output reg LED
	
);
	
	always @(*)
		begin
			case (SW)	
		    	4'b0010:LED = 1'b1;
				4'b0011:LED = 1'b1;
				4'b0101:LED = 1'b1;
				4'b0111:LED = 1'b1;
				4'b1011:LED = 1'b1;
				4'b1101:LED = 1'b1;
				default:LED = 1'b0;
			endcase
		end

endmodule
```

---

## Código del testbench: Num_Primos_tb.v

```verilog
module Num_Primos_tb();

    reg [3:0] SW;
    wire LED;

    Num_Primos dut(.SW(SW),.LED(LED));

    initial 
        begin
            $display("Simulacion iniciada");

            SW = 4'b0000; #10;
            SW = 4'b0001; #10;
            SW = 4'b0010; #10;
            SW = 4'b0011; #10;
            SW = 4'b0100; #10;
            SW = 4'b0101; #10;
            SW = 4'b0110; #10;
            SW = 4'b0111; #10;
            SW = 4'b1000; #10;
            SW = 4'b1001; #10;
            SW = 4'b1010; #10;
            SW = 4'b1011; #10;
            SW = 4'b1100; #10;
            SW = 4'b1101; #10;
            SW = 4'b1110; #10;
            SW = 4'b1111; #10;

            $display("Simulacion finalizada");
            $finish;
        end

    initial 
        begin
            $monitor("SW = %b, LED = %b", SW, LED);
        end

    initial 
        begin
            $dumpfile("Num_Primos_tb.vcd");
            $dumpvars(0, Num_Primos_tb);
        end

endmodule
```

---

## Simulación del testbench

![Simulación](Practica_1_Numeros_Primos/Num_Primos_SIM.png)

---

## RTL

![RTL](Practica_1_Numeros_Primos/Num_Primos_RTL.png)

---

## Pruebas con la tarjeta FPGA DE10-Lite

### Pruebas con números primos (LED encendido)

#### Entrada = 2 (0010)
![Prueba 2](Practica_1_Numeros_Primos/Num_Primos(2).jpeg)

#### Entrada = 3 (0011)
![Prueba 3](Practica_1_Numeros_Primos/Num_Primos(3).jpeg)

En ambos casos el LED se enciende porque los valores de entrada son números primos.

---

### Pruebas con números no primos (LED apagado)

#### Entrada = 6 (0110)
![Prueba 6](Practica_1_Numeros_Primos/Num_Primos(6).jpeg)

#### Entrada = 15 (1111)
![Prueba 15](Practica_1_Numeros_Primos/Num_Primos(15).jpeg)

En estos casos el LED no se enciende porque los valores de entrada no son números primos.
