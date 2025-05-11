# Digital VLSI
--------


## Verilog Assignment
-----

### Q-1
![problem statement](https://github.com/user-attachments/assets/679d5b17-c215-41d5-9c7a-4f1ed98a1ca0)
select is a 2-bit input to choose the operation.  
x and y are 8-bit inputs.  
z is an 8-bit output.  
A combinational always block is used with a case statement to handle different values of select:  
00: z = 0  
01: z = x + y  
10: z = x ^ y  
11: z = 0 if both x and y are odd (i.e., their least significant bits are 1), otherwise z = 1.  



### Q-2
![problem statement](https://github.com/user-attachments/assets/7e5760f6-1ac9-4ba5-88e9-86345c532f30)
b and c are delayed versions of a. b is delayed by one cycle and c is delayed by 2 cycles with respect to a.  
The circuit works on the positive edge of the clock. Outputs go to 0 when rstn =0. The reset (rstn) is an asynchronous, active low one.




### Q-3
![problem statment](https://github.com/user-attachments/assets/7ca1a81c-5f2f-4010-8f17-5bac49f1cd61)
This is a positive edge detector.  
The reset is async, active low.  
The input signal A is synchronous to the clock. Whenever A goes high, the output signal B should go high for 1 clock cycle. When reset is asserted, output B remains at 0.  




### Q-4
![problem statement](https://github.com/user-attachments/assets/446abecf-2189-482a-b6fb-41f42ace956a)
The reset is async active low.  
The counter remains at 0  while under reset. When out of reset, it counts only if en signal is high, else it remains at 0.  
The counter upcounts if the signal up_down is high, else it downcounts.  
If the hold signal is high, the counter pauses at whatever count it is. It continues counting whennhold is low.









### Q-5
![WhatsApp Image 2025-03-20 at 10 45 21_90a41097](https://github.com/user-attachments/assets/0abc6097-64aa-457c-9d79-a281750a8ccd)
![WhatsApp Image 2025-03-25 at 07 41 56_b42e6b40](https://github.com/user-attachments/assets/af56664a-afef-4565-8d89-9abcb48aa229)
 - Design an arbiter that takes in multiple requests and services them one by one in the priority order $r1 > r2 > r3$
    - Acknowledgement will be asserted for one cycle for a request. If the request remains high even after that, it will be considered a new request. If multiple requests are asserted at the same time, they will be services in order of priority.
    - Design a modification to the above problem for _Round-Robin_ priority. At reset you start with the priority $r1 > r2 > r3$, if you service say $r1$ then move it to the end ie. $r2 > r3 > r1$ and so on.
    - Alongwith the code, please **upload a testplan** too. It may be in the form of a table (xls is good) with the following columns.
        1. Feature
        2. Description
        3. Testcase description
    - Lets say we identify 4 features to be tested...
    - 1. Reset
      2. Single req asserted
      3. Multiple req asserted
      4. Consecutive requests on the same line
    - In the description column mention in your words waht it means and what are the sub-scenarios you want to test in that.
    - In the testcase description column mention the sequence of operation you would want to do in a testcase.
    - Doing this will help you understand the fallacies of your design and will help you think of all scenarios while designing itself.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

## ACKNOWLEDGEMENT

1. Dr. Saroj Rout (SILICON UNIVERSITY)
2. Mr. Sujit Panda (SYNOPSYS)
