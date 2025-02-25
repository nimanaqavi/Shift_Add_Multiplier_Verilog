# Verilog Implementation of Shift-and-Add Multiplier  

This project implements a Shift-and-Add Multiplier using the Hardware Description Language (HDL) Verilog. The Shift-and-Add algorithm is a widely used technique for multiplying binary numbers and is particularly useful in digital hardware implementations.  

## Features  

- Efficient multiplication of binary numbers using the Shift-and-Add method  
- 8-bit or configurable bit-width implementation  
- Testbench provided for validating functionality  
- Detailed simulation results to verify correctness  

## Project Contents  

- `Shift_Add_Multiplier_DP.v`: Verilog code for the shift-and-add multiplier combinitial part 
- `Shift_Add_Multiplier_CO.v`: Verilog code for the shift-and-add multiplier sequential part 
- `Shift_Add_Multiplier_TOP.v`: Verilog code for the shift-and-add multiplier to connect DP and Controler  
- `Shift_Add_Multiplier_Test_Bench.v`: Testbench code for verifying the implementation  
- `Makefile`: Simplifies the build and simulation process  
- `README.md`: Project documentation  

## Installation Guide  

To run this project, ensure you have a Verilog simulation tool (such as Icarus Verilog or ModelSim) installed on your system. You can install Icarus Verilog using the following command:  

```bash  
sudo apt-get install iverilog