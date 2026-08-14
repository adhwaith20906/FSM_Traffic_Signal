# Traffic Signal FSM

A parameterized traffic signal controller designed in Verilog HDL using
a four-state finite state machine (FSM). The design controls two traffic
directions, A and B, with configurable green and yellow durations and
was functionally verified using ModelSim.

## FSM States

-   `A_Green` --- Road A green, Road B red
-   `A_Yellow` --- Road A yellow, Road B red
-   `B_Green` --- Road A red, Road B green
-   `B_Yellow` --- Road A red, Road B yellow

Sequence:

``` text
A_Green → A_Yellow → B_Green → B_Yellow → A_Green
```

A counter tracks clock cycles and controls the state transitions.

## Features

-   Verilog HDL
-   Four-state FSM
-   Parameterized green and yellow timings
-   Synchronous reset
-   Counter-based state timing
-   2-bit light outputs
-   ModelSim functional simulation
-   Quartus Prime synthesis

## Light Encoding

  Value     Light
  --------- --------
  `2'b00`   Red
  `2'b01`   Yellow
  `2'b11`   Green

## Parameters

``` verilog
parameter Green_time = 40;
parameter Yellow_time = 20;
```

The parameters specify the duration of the green and yellow phases in
clock cycles.

## Module Interface

``` text
Inputs:
    clk
    rst

Outputs:
    A_light [1:0]
    B_light [1:0]
```

## Simulation

The testbench generates a 2 ns clock period, applies reset, runs the FSM
through its cycle, applies reset again, and runs another cycle.

With the default parameters, the expected state sequence is:

``` text
A_Green
   ↓
A_Yellow
   ↓
B_Green
   ↓
B_Yellow
   ↓
A_Green
```

A VCD waveform is generated for signal inspection.

## Tools

-   Verilog HDL
-   Intel Quartus Prime
-   ModelSim Intel FPGA Starter Edition

## Project Structure

``` text
TrafficSignal/
├── RTL/
│   └── TrafficFSM.v
├── Testbench/
│   └── traffic_testbench.v
├── Simulation/
├── Quartus/
├── README.md
└── .gitignore
```
