# Numato ECP-5 template

This repo contains a minimal Veryl project, constraints, OpenOCD config and Makefile for building for, and programming the Numato Labs Mimas ECP5 Mini development board.

We also show how the internal oscillator can be used to generate a clock signal (`./oscillator.sv`). The project top (`./src/counter.veryl`) makes use of this clock signal to store the value of a counter in a register.

## Dependencies

The toolchain consists of:

- [Veryl](https://veryl-lang.org/install/) for transpiling Veryl code to SystemVerilog.
- [Yosys](https://github.com/YosysHQ/yosys?tab=readme-ov-file#building-from-source) for synthesis
- [NextPNR](https://github.com/YosysHQ/nextpnr?tab=readme-ov-file#getting-started) for place and route
- [OpenOCD](https://openocd.org/pages/getting-openocd.html) for programming the device
- [Project Trellis](https://github.com/YosysHQ/prjtrellis) for bitstream generation, and other device specifics

## Building and programming

With the toolchain set up, and the dev board connected, run 
```
make
```
to build the project and reprogram the FPGA. 

## Expected behavior

A simple counter, button 0 increments the counter, button 1 decrements it. LEDs 0-3 are used as a bit display of the counter.