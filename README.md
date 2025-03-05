# Digital VLSI
--------


## Verilog Assignment
-----

#### Q-1
![problem statement](https://github.com/user-attachments/assets/679d5b17-c215-41d5-9c7a-4f1ed98a1ca0)
select is a 2-bit input to choose the operation.  
x and y are 8-bit inputs.  
z is an 8-bit output.  
A combinational always block is used with a case statement to handle different values of select:  
00: z = 0  
01: z = x + y  
10: z = x ^ y  
11: z = 0 if both x and y are odd (i.e., their least significant bits are 1), otherwise z = 1.  



#### Q-2
![problem statement](https://github.com/user-attachments/assets/7e5760f6-1ac9-4ba5-88e9-86345c532f30)
b and c are delayed versions of a. b is delayed by one cycle and c is delayed by 2 cycles with respect to a.  
The circuit works on the positive edge of the clock. Outputs go to 0 when rstn =0. The reset (rstn) is an asynchronous, active low one.




#### Q-3
![problem statment](https://github.com/user-attachments/assets/7ca1a81c-5f2f-4010-8f17-5bac49f1cd61)
Ths is a positive edge detector.  
The reset is async, active low.  
The input signal A is synchronous to the clock. Whenever A goes high, the output signal B should go high for 1 clock cycle. When reset is asserted, output B remains at 0.  

