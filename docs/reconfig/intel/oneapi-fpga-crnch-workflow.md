# Using Intel OneAPI with CRNCH Rogues Gallery

Here we will detail how to run one of the Intel OneAPI samples as a guide for how to use the Intel FPGAs on the CRNCH Rogues Gallery.

We recommend selecting one of the official OneAPI DirectProgramming examples from [this repo](https://www.intel.com/content/www/us/en/developer/articles/code-sample/explore-dpcpp-through-intel-fpga-code-samples.html). This workflow roughly follows the [`fpga_compile` example](https://github.com/oneapi-src/oneAPI-samples/tree/master/DirectProgramming/C%2B%2BSYCL_FPGA/Tutorials/GettingStarted/fpga_compile) from the code samples.

## General Workflow

1) Evaluate for functional correctness: Build your design for CPU and then for FPGA emulation
2) Check mapping to your target board: Look at the optimization report to see if your design fits.
3) Build a bitstream
4) Run the bitstream on your target board.
5) Profile your bitstream. 

### Which machines can support this flow?

| Server Name | Devices              | Specific Boards |
| ----------- | -------------------- | --------------- |
| flubber2    | Arria 10, Stratix 10 (S10) |  Bittware 385, Bittware 520N |
| flubber3    | Stratix 10 HBM, S10       |  Bittware 520N-MX, Intel S10 PAC               |
| flubber9    | Agilex               |   Bittware IA-840F              |
--------------------------------------------------------

## FPGA Emulation

First we request a "development" node to run CPU-based execution and simulation. Note that we can use OneAPI tools across different VMs and servers, so we do some basic testing and debugging using a VM with the appropriate tools. 

```
//Request a node from the rg-fpga-dev partition which has all the VMs
salloc -p rg-fpga-dev --nodes=1 --ntasks-per-node=2 --time=01:00:00
salloc: Pending job allocation 67109553
...
salloc: Granted job allocation 67109553
salloc: Waiting for resource configuration
salloc: Nodes rg-fpga-dev1 are ready for job
gburdell@rg-fpga-dev1:~$
```

Then source the Intel OneAPI tools to compile your code:
```
. /tools/intel/oneapi/2023.0/setvars.sh
 
:: initializing oneAPI environment ...
   bash: BASH_VERSION = 4.4.20(1)-release
   args: Using "$@" for setvars.sh arguments: 
:: advisor -- latest
....
:: vtune -- latest
:: oneAPI environment initialized ::

```

Checkout the sample codes and jump to the loop unrolling example. We suggest using your `USERSCRATCH` directory since it is faster NVMe storage. 
```
$> cd USERSCRATCH
USERSCRATCH$> git clone https://github.com/oneapi-src/oneAPI-samples.git
//Go to the top-level of the FPGA tutorial codes
$> cd oneAPI-samples/DirectProgramming/C++SYCL_FPGA/
$> cd Tutorials/Features/loop_unroll/
```

**NOTE:** Right now you have to edit the main source file to change how selectors are defined. This seems to be a bug with newer toolchains.

```
//Replace the _v selector constructors as follows.
#if FPGA_SIMULATOR
  //auto selector = sycl::ext::intel::fpga_simulator_selector_v;
  auto selector = sycl::ext::intel::fpga_simulator_selector();
#elif FPGA_HARDWARE
  //auto selector = sycl::ext::intel::fpga_selector_v;
  auto selector = sycl::ext::intel::fpga_selector();
#else  // #if FPGA_EMULATOR
  //auto selector = sycl::ext::intel::fpga_emulator_selectorv_;
  auto selector = sycl::ext::intel::fpga_emulator_selector();
#endif
```

Then use cmake and make to run the FPGA simulation step. 

You can check the available board support packages using the aoc command: 
```
aoc -list-boards
Board list:
  pac_a10 (default)
     Board Package: /net/projects/tools/x86_64/rhel-8/intel-oneapi/2023.0/compiler/2023.0.0/linux/lib/oclfpga/board/intel_a10gx_pac

  pac_s10
     Board Package: /net/projects/tools/x86_64/rhel-8/intel-oneapi/2023.0/compiler/2023.0.0/linux/lib/oclfpga/board/intel_s10sx_pac

  pac_s10_usm
     Board Package: /net/projects/tools/x86_64/rhel-8/intel-oneapi/2023.0/compiler/2023.0.0/linux/lib/oclfpga/board/intel_s10sx_pac
     Memories:      device, host
```

Then target the Intel PAC Stratix 10 board
```
@rg-fpga-dev1:loop_unroll/build$ cmake .. -DFPGA_DEVICE=pac_s10
-- Configuring the design with the following target: pac_s10
-- Configuring done
-- Generating done
-- Build files have been written to: ... /oneAPI-samples/DirectProgramming/C++SYCL_FPGA/Tutorial...
```

And compile the emulation target with make
```
$> make fpga_emu
[ 50%] Building CXX object src/CMakeFiles/loop_unroll.fpga_emu.dir/loop_unroll.cpp.o
[100%] Linking CXX executable ../loop_unroll.fpga_emu
[100%] Built target loop_unroll.fpga_emu
[100%] Built target fpga_emu
```

You can then run this emulated application and check its output.

```
Input Array Size:  67108864
Running on device: Intel(R) FPGA Emulation Device
unroll_factor 1 kernel time : 122.209 ms
Throughput for kernel with unroll_factor 1: 0.549 GFlops
Running on device: Intel(R) FPGA Emulation Device
unroll_factor 2 kernel time : 91.457 ms
Throughput for kernel with unroll_factor 2: 0.734 GFlops
Running on device: Intel(R) FPGA Emulation Device
unroll_factor 4 kernel time : 97.858 ms
Throughput for kernel with unroll_factor 4: 0.686 GFlops
Running on device: Intel(R) FPGA Emulation Device
unroll_factor 8 kernel time : 115.720 ms
Throughput for kernel with unroll_factor 8: 0.580 GFlops
Running on device: Intel(R) FPGA Emulation Device
unroll_factor 16 kernel time : 101.993 ms
Throughput for kernel with unroll_factor 16: 0.658 GFlops
PASSED: The results are correc
```

## Simulation with ModelSim and Questa
Right now we don't support this.

## Investigating the Optimization Report

## Building an FPGA Bitstream

Request an allocation on a larger server node with an appropriate amount of memory

```
salloc -p rg-intel-fpga-hw --nodes=1 --ntasks-per-node=1 --nodelist flubber3 --time=01:00:00
```

## Profiling on FPGA with vTune 
This is a more advanced topic that we will add at a later date.
