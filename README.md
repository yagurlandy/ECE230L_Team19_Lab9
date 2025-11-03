# Sequential Circuits: Latches

## Andy Lopez-Martinez & Ibuki Hasegawa

In this lab, we learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Summary
In this lab, we learned how sequential circuits differ from combinational ones. We now understand how latches can store data while enabled, and how flip-flops only update on clock edges.
This helped us see how memory elements form the basis of larger systems like RAM, registers, and processors.

## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
Edge-sensitive circuits respond only at the transition (rising or falling edge) of a clock signal, while level-sensitive circuits respond whenever the enable or clock signal is held high or low.
In other words, a latch is level-sensitive, it keeps changing its output while enable is active. A flip-flop, on the other hand, is edge-sensitive, it only changes its output at the clock’s edge (a single moment in time).

### What is the meaning of always @(*) in a sensitivity block?
Declaring an initial state is important because, without it, the circuit’s outputs are undefined ("X") when the FPGA is powered on. Sequential circuits need a known starting condition so that all registers and latches behave predictably.
Without initializing, the circuit may start in an unexpected or unstable state, leading to incorrect or inconsistent outputs.

### What importance is memory to digital circuits?
Edge-sensitive circuits allow us to build synchronous systems like counters, registers, finite state machines, and CPUs.
Since all components react only at the clock edge, data moves in a coordinated and predictable way—this synchronization is the foundation of modern digital system design.
