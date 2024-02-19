# Xilinx FPGA Workflow

Here we will detail how to run one of the Xilinx Vitis samples as a guide for how to use the Xilinx FPGAs on the CRNCH Rogues Gallery.

We recommend selecting one of the official Xilinx Vitis 2022.1 tutorial examples from [this repo](https://github.com/Xilinx/Vitis-Tutorials/tree/2022.1). 

## General Workflow

1) Evaluate for functional correctness: Build your design for CPU and then for FPGA emulation
2) Check mapping to your target board: Look at the optimization report to see if your design fits.
3) Build a bitstream
4) Run the bitstream on your target board.
5) Profile your bitstream. 

### Which machines can support this flow?

| Server Name | Intel FPGA model     | FPGA Accelerator Platform Name |
| ----------- | -------------------- | --------------- |
| flubber1    | Xilinx Alveo U50 |   |
| flubber5    | Xilinx Alveo U280       |               |
| flubber9    | Xilinx Alveo U250             |                |
--------------------------------------------------------

## FPGA Emulation

First we request a "development" node to run CPU-based execution and simulation. Note that we can use Xilinx tools across different VMs and servers, so we do some basic testing and debugging using a VM with the appropriate tools. 

```
//Request a node from the rg-dev partition which has all the VMs
salloc -p rg-dev --nodes=1 --ntasks-per-node=2 --time=01:00:00
salloc: Pending job allocation 67109553
...
salloc: Granted job allocation 67109553
salloc: Waiting for resource configuration
salloc: Nodes rg-fpga-dev1 are ready for job
gburdell@rg-fpga-dev1:~$
```


## Investigating the Optimization Report

TBD

## Building an FPGA Bitstream

Request an allocation on a larger server node with an appropriate amount of memory

Here we are requesting 12 cores on flubber 3, 64 GB of RAM, and a time limit of 8 hours.
```
salloc -p rg-fpga --nodes=1 --ntasks-per-node=12 --mem=64G --nodelist flubber4 --time=08:00:00
salloc: Pending job allocation 67109590
salloc: job 67109590 queued and waiting for resources
salloc: job 67109590 has been allocated resources
salloc: Granted job allocation 67109590
salloc: Nodes flubber3 are ready for job
flubber3:~$
```

Switch to your working directory, make sure you've sourced the Xilinx Vitis tools, and then run the commands to compile a bitstream. Note this step will likely take a long time to complete - up to 1-2 hours for smaller designs.
