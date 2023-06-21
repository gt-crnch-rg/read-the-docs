# Using Intel OneAPI with CRNCH Rogues Gallery

Here we will detail how to run one of the Intel OneAPI samples as a guide for how to use the Intel FPGAs on the CRNCH Rogues Gallery.

We will use the public [sycl-fpga-vector repo](https://github.com/gt-crnch-rg/sycl-fpga-vector-add) as an example, but we also recommend selecting one of the official OneAPI DirectProgramming examples from [this repo](https://www.intel.com/content/www/us/en/developer/articles/code-sample/explore-dpcpp-through-intel-fpga-code-samples.html).

## General Workflow

1) Evaluate for functional correctness: Build your design for CPU and then for FPGA emulation
2) Check mapping to your target board: Look at the optimization report to see if your design fits.
3) Build a bitstream
4) Run the bitstream on your target board.
5) Profile your bitstream. 

### Which machines can support this flow?

| Server Name | Devices              | Specific Boards |
| ----------- | -------------------- | --------------- |
| flubber2    | Arria 10, Stratix 10 |                 |
| flubber3    | Stratix 10 HBM       |                 |
| Flubber9    | Agilex               |                 |


## FPGA Emulation



## Simulation with ModelSim and Questa
Right now we don't support this.

## Investigating the Optimization Report

## Building an FPGA Bitstream

## Profiling on FPGA with vTune 
This may be a more advanced topic that we will add at a later date.
