Using Intel OneAPI with CRNCH Rogues Gallery
============================================

Here we will detail how to run one of the Intel OneAPI samples as a
guide for how to use the Intel FPGAs on the CRNCH Rogues Gallery.

We recommend selecting one of the official OneAPI DirectProgramming
examples from `this
repo <https://www.intel.com/content/www/us/en/developer/articles/code-sample/explore-dpcpp-through-intel-fpga-code-samples.html>`__.
This workflow roughly follows the ```fpga_compile``
example <https://github.com/oneapi-src/oneAPI-samples/tree/master/DirectProgramming/C%2B%2BSYCL_FPGA/Tutorials/GettingStarted/fpga_compile>`__
from the code samples.

General Workflow
----------------

1) Evaluate for functional correctness: Build your design for CPU and
   then for FPGA emulation
2) Check mapping to your target board: Look at the optimization report
   to see if your design fits.
3) Build a bitstream
4) Run the bitstream on your target board.
5) Profile your bitstream.

Which machines can support this flow?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+----------------+------------------------------+----------------------+
| Server Name    | Intel FPGA model             | FPGA Accelerator     |
|                |                              | Platform Name        |
+================+==============================+======================+
| flubber2       | Arria 10, Stratix 10 (S10)   | Bittware 385,        |
|                |                              | Bittware 520N        |
+----------------+------------------------------+----------------------+
| flubber3       | Stratix 10 HBM, S10          | Bittware 520N-MX,    |
|                |                              | Intel S10 PAC        |
+----------------+------------------------------+----------------------+
| flubber9       | Agilex                       | Bittware IA-840F     |
+----------------+------------------------------+----------------------+

--------------

FPGA Emulation
--------------

First we request a “development” node to run CPU-based execution and
simulation. Note that we can use OneAPI tools across different VMs and
servers, so we do some basic testing and debugging using a VM with the
appropriate tools.

::

   //Request a node from the rg-fpga-dev partition which has all the VMs
   salloc -p rg-fpga-dev --nodes=1 --ntasks-per-node=2 --time=01:00:00
   salloc: Pending job allocation 67109553
   ...
   salloc: Granted job allocation 67109553
   salloc: Waiting for resource configuration
   salloc: Nodes rg-fpga-dev1 are ready for job
   gburdell@rg-fpga-dev1:~$

Then source the Intel OneAPI tools to compile your code. Here we are
using the latest tools, but you should also be able to use the 2022.2
toolset.

::

   . /tools/intel/oneapi/2023.0/setvars.sh
    
   :: initializing oneAPI environment ...
      bash: BASH_VERSION = 4.4.20(1)-release
      args: Using "$@" for setvars.sh arguments: 
   :: advisor -- latest
   ....
   :: vtune -- latest
   :: oneAPI environment initialized ::

Checkout the sample codes and jump to the loop unrolling example. We
suggest using your ``USERSCRATCH`` directory since it is faster NVMe
storage.

::

   $> cd USERSCRATCH
   USERSCRATCH$> git clone https://github.com/oneapi-src/oneAPI-samples.git
   //Go to the top-level of the FPGA tutorial codes
   $> cd oneAPI-samples/DirectProgramming/C++SYCL_FPGA/
   //Go to the directory for the loop unrolling tutorial
   $> cd Tutorials/Features/loop_unroll/

**NOTE:** Right now you have to manually edit the main source file to
change how selector constructors are defined. This seems to be a bug
with newer toolchains.

//Replace the ``selector_v;`` constructors as follows with
``selector();``

::

   loop_unroll$ vim src/loop_unroll.cpp
   ...
   #if FPGA_SIMULATOR
     //auto selector = sycl::ext::intel::fpga_simulator_selector_v;
     auto selector = sycl::ext::intel::fpga_simulator_selector();
   #elif FPGA_HARDWARE
     //auto selector = sycl::ext::intel::fpga_selector_v;
     auto selector = sycl::ext::intel::fpga_selector();
   #else  // #if FPGA_EMULATOR
     //auto selector = sycl::ext::intel::fpga_emulator_selector_v;
     auto selector = sycl::ext::intel::fpga_emulator_selector();
   #endif

You can check the available board support packages using the aoc
command. Before doing that, we will want to set the environment to add
the Bittware 520N-MX board.

::

   #Add the environment for the newer Bittware board
   $> . /tools/reconfig/intel/init_env_bittware_pcie.sh

   $> aoc -list-boards
   Board list:
     p520_hpc_m210h_g3x16 (default)
        Board Package: /projects/tools/x86_64/rhel-8/intel-quartus/2020.4/hld/board/bittware_pcie/s10mx
        Memories:      HBM0, HBM1, HBM2, HBM3, HBM4, HBM5, HBM6, HBM7, HBM8, HBM9, HBM10, HBM11, HBM12, HBM13, HBM14, HBM15, HBM16, HBM17, HBM18, HBM19, HBM20, HBM21, HBM22, HBM23, HBM24, HBM25, HBM26, HBM27, HBM28, HBM29, HBM30, HBM31

     p520_max_m210h_g3x16
        Board Package: /projects/tools/x86_64/rhel-8/intel-quartus/2020.4/hld/board/bittware_pcie/s10mx
        Memories:      HBM0, HBM1, HBM2, HBM3, HBM4, HBM5, HBM6, HBM7, HBM8, HBM9, HBM10, HBM11, HBM12, HBM13, HBM14, HBM15, HBM16, HBM17, HBM18, HBM19, HBM20, HBM21, HBM22, HBM23, HBM24, HBM25, HBM26, HBM27, HBM28, HBM29, HBM30, HBM31
        Channels:      kernel_input_ch0, kernel_output_ch0, kernel_input_ch1, kernel_output_ch1, kernel_input_ch2, kernel_output_ch2, kernel_input_ch3, kernel_output_ch3

     pac_a10
        Board Package: /net/projects/tools/x86_64/rhel-8/intel-oneapi/2023.0/compiler/2023.0.0/linux/lib/oclfpga/board/intel_a10gx_pac

     pac_s10
        Board Package: /net/projects/tools/x86_64/rhel-8/intel-oneapi/2023.0/compiler/2023.0.0/linux/lib/oclfpga/board/intel_s10sx_pac

     pac_s10_usm
        Board Package: /net/projects/tools/x86_64/rhel-8/intel-oneapi/2023.0/compiler/2023.0.0/linux/lib/oclfpga/board/intel_s10sx_pac

Then use cmake and make to run the FPGA simulation step targeting the
S10 board

::

   @rg-fpga-dev1:loop_unroll$ mkdir build && cd build
   #You can change the device here to another board to investigate different designs
   loop_unroll/build$ cmake .. -DFPGA_DEVICE=p520_hpc_m210h_g3x16
   -- The CXX compiler identification is IntelLLVM 2023.0.0
   ...
   -- Configuring the design with the following target: p520_hpc_m210h_g3x16
   -- Configuring done
   -- Generating done
   -- Build files have been written to: .../oneAPI-samples/DirectProgramming/C++SYCL_FPGA/Tutorials/Features/loop_unroll/build

And compile the emulation target with make

::

   loop_unroll/build$ make fpga_emu
   [ 50%] Building CXX object src/CMakeFiles/loop_unroll.fpga_emu.dir/loop_unroll.cpp.o
   ... Lots of SYCL deprecation warnings you can ignore...
   [100%] Linking CXX executable ../loop_unroll.fpga_emu
   [100%] Built target loop_unroll.fpga_emu
   [100%] Built target fpga_emu

You can then run this emulated application and check its output.

::

   $> ./loop_unroll.fpga_emu
   Input Array Size:  67108864
   Running on device: Intel(R) FPGA Emulation Device
   unroll_factor 1 kernel time : 321.431 ms
   Throughput for kernel with unroll_factor 1: 0.209 GFlops
   Running on device: Intel(R) FPGA Emulation Device
   unroll_factor 2 kernel time : 313.827 ms
   Throughput for kernel with unroll_factor 2: 0.214 GFlops
   Running on device: Intel(R) FPGA Emulation Device
   unroll_factor 4 kernel time : 87.778 ms
   Throughput for kernel with unroll_factor 4: 0.765 GFlops
   Running on device: Intel(R) FPGA Emulation Device
   unroll_factor 8 kernel time : 80.566 ms
   Throughput for kernel with unroll_factor 8: 0.833 GFlops
   Running on device: Intel(R) FPGA Emulation Device
   unroll_factor 16 kernel time : 85.225 ms
   Throughput for kernel with unroll_factor 16: 0.787 GFlops
   PASSED: The results are correct

Simulation with ModelSim and Questa
-----------------------------------

Right now we don’t support this step.

Investigating the Optimization Report
-------------------------------------

As with the emulation step, you can generate an optimization report
which provides useful statistics about your design for a particular
board. This is run as follows:

::

   loop_unroll/build$ make report
   [ 50%] Building CXX object src/CMakeFiles/loop_unroll_report.a.dir/loop_unroll.cpp.o
   [100%] Linking CXX executable ../loop_unroll_report.a
   [100%] Built target loop_unroll_report.a
   [100%] Built target report

To look at your report on the CRNCH servers, it is probably easiest to
use the Open OnDemand session. To do this, you can:

1) Log into the Open OnDemand instance at rg-ood.crnch.gatech.edu using
   the instructions `shared
   here <https://gt-crnch-rg.readthedocs.io/en/main/general/open-on-demand.html>`__.
2) Click on the Reconfig tab and select “Virtual Desktop”.
3) Hit “Launch” on the next page and wait for your VNC session to start.
4) Then use the GUI to navigate to your report (it will be located at
   ``loop_unroll/build/loop_unroll_report.prj/reports/report.html``).

Building an FPGA Bitstream
--------------------------

Request an allocation on a larger server node with an appropriate amount
of memory.

Here we are requesting 12 cores on flubber 3, 64 GB of RAM, and a time
limit of 8 hours.

::

   salloc -p rg-intel-fpga-hw --nodes=1 --ntasks-per-node=12 --mem=64G --nodelist flubber3 --time=08:00:00
   salloc: Pending job allocation 67109590
   salloc: job 67109590 queued and waiting for resources
   salloc: job 67109590 has been allocated resources
   salloc: Granted job allocation 67109590
   salloc: Nodes flubber3 are ready for job
   flubber3:~$

Switch to your working directory and make sure you’ve sourced the Intel
OneAPI tools and the Bittware environment variables:

::

   flubber3$> . /tools/intel/oneapi/2023.0/setvars.sh# Source environment for the Bittware 520N-MX board
   flubber3$> . /tools/reconfig/intel/init_env_bittware_pcie.sh

Then run ``make fpga``. Note this step will likely take a long time to
complete - up to 1-2 hours for smaller designs.

::

   flubber3$> make fpga
   [100%] Linking CXX executable ../loop_unroll.fpga
   warning: -reuse-exe file '../oneAPI-samples/DirectProgramming/C++SYCL_FPGA/Tutorials/Features/loop_unroll/build/loop_unroll.fpga' not found; ignored
   aoc: Compiling for FPGA. This process may take several hours to complete.  Prior to performing this compile, be sure to check the reports to ensure the design will meet your performance targets.  If the reports indicate performance targets are not being met, code edits may be required.  Please refer to the oneAPI FPGA Optimization Guide for information on performance tuning applications for FPGAs.
   [100%] Built target loop_unroll.fpga
   [100%] Built target fpga

You then should be able to run your code on the FPGA itself:

::

   ./loop_unroll.fpga
   Input Array Size:  67108864

Profiling on FPGA with vTune
----------------------------

This is a more advanced topic that we will add at a later date.
