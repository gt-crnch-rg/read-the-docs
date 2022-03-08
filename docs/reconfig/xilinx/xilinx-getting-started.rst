.. code:: 

   _Last updated: 3/21/2021_ 
   
   ## Xilinx FPGA hardware
   Please see the master list for the most up-to-date list. RG currently has:
   * A Pico Computing SC6 desktop machine, rg-fpga-cubed.crnch.gatech.edu
       * Contains one EX-700 PCIe backplane and four AC-510 Xilinx and HMC modules. Each AC-510 has a 4GB HMC and a Xilinx Ultrascale XCVU060 FPGA (package FFVA1156).
   * Xilinx [Pynq](http://www.pynq.io/) Z1 and Z2 boards
   * An Ultrascale devkit board (ZCU102) - this is currently locally accessible since it is a USB device but can be put online on request.
   * Xilinx Alveo U280 boards in flubber1.crnch.gatech.edu
   
   ## Accessing the Rogues Gallery Xilinx FPGAs
   From either the login node (rg-login), from a campus network machine, or VPN if off GT's campus network you can ssh to the FPGA boxes or ideally to development VMs, rg-fpga-dev-1, and rg-fpga-dev-2.
   
   * **rg-fpga-cubed.crnch.gatech.edu** - The Pico Computing SC6 system - contains HMC memory and Xilinx Ultrascale chips.
   * **flubber1.crnch.gatech.edu** - Hosts 3x Alveo U280 boards.
   * pynq-z2-<1-10>.cc.gatech.edu - Pynq Z2 FPGAs
   
   ## What are my tool options?
   
   Xilinx currently supports: 
   * [Xilinx Vitis](https://www.xilinx.com/products/design-tools/vitis/vitis-platform.html) - Starting with Xilinx 19.2, Vitis is the preferred high-level tool for targeting boards like Alveo and Versal. Vitis includes Vivado and what used to be called SDAccel and SDSoC Designer.
   * [Vivado HLx](https://www.xilinx.com/products/design-tools/vivado.html), which is the base tool for compiling Verilog/VHDL and which provides some HLS support for C and C++ codes. 
   * [Xilinx SDAccel](https://www.xilinx.com/products/design-tools/software-zone/sdaccel.html) - SDx has been deprecated by the introduction of Vitis and licenses are no longer supported by Xilinx. See here for info on using [2019 tools]([Reconfig]-Xilinx-SDAccel-(Deprecated))
   
   * How to quickly start Vitis/Vivado 20.2:
     ```
     export XILINXTOOLSHARE=/tools/reconfig/xilinx
     #Source the different Vivado/Vitis settings files
     . $XILINXTOOLSHARE/Vivado/2020.2/settings64.sh
     . $XILINXTOOLSHARE/Vitis/2020.2/settings64.sh
     . $XILINXTOOLSHARE/Vitis_HLS/2020.2/settings64.sh
     ```
   * To use the tools with the GUI interface we recommend using x2go and connecting to either rg-fpga-dev-<1-2> or synestia VMs. [See here for more information](https://github.gatech.edu/crnch-rg/rogues-docs-wiki/blob/master/%5BMisc%5D-Using-GUI-applications-with-X2Go.md).
     
   ## How do I check the licenses that are available?
   
   You can either use the licensing center from the GUI version of a tool like Vivado or Vitis, or you can run the following:
   
   ```
   lmutil lmstat -a -c 2100@toolbox.crnch.gatech.edu
   
   mutil - Copyright (c) 1989-2016 Flexera Software LLC. All Rights Reserved.
   Flexible License Manager status on Mon 4/5/2021 21:37
   
   License server status: 2100@toolbox
       License file(s) on toolbox: /tools/reconfig/licenses/xilinx_vivado_july2020.lic:
   
      toolbox: license server UP (MASTER) v11.14.1
   
   Vendor daemon status (on toolbox):
   
      xilinxd: UP v11.14.1
   Feature usage info:
   
   Users of Vivado_System_Edition:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of SDK:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of ChipScopePro_SIOTK:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of ChipscopePro:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of ISE:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of SysGen:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of XPS:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of PartialReconfiguration:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of Simulation:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of Implementation:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of Analyzer:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of HLS:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of Synthesis:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of ISIM:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   
   Users of PlanAhead:  (Total of 15 licenses issued;  Total of 0 licenses in use)
   ```
   
   ## Getting started with AWS for development
   Amazon supports F1 instances that have between 1 and 8 Xilinx FPGAs. Currently they support the VCU1525 with an Ultrascale+ part. As of October, they do not seem to support Alveo or Versal boards. Xilinx and Amazon both have good references on getting started with these instances.
   
   * [Xilinx Getting Started with AWS](https://www.xilinx.com/products/design-tools/acceleration-zone/aws.html#gettingstarted)
   * [SDAccel AWS examples from Accelerator Program](https://github.com/Xilinx/SDAccel_Examples/wiki/Getting-Started-on-AWS-F1-with-SDAccel-and-RTL-Kernels)
   * [SDAccel AWS Labs](https://github.com/Xilinx/SDAccel-AWS-F1-Developer-Labs)
   
   ## Xilinx Accelerator Program ##
   Xilinx has a program for faculty and staff that seems to provide discounts on Alveo board (~$1500 discount for up to two board) and links to existing resources for SDAccel, AWS, and Alveo products. These are normally behind a login wall, but please see the links below:
   
   * [Alveo Getting Started](https://www.xilinx.com/video/fpga/getting-started-with-alveo-u200-u250.html)
   * [Alveo FPGA Tutorial geared towards Nimbix (another cloud provider)](https://www.nimbix.net/alveo-fpga-tutorial)
   * [General Xilinx Forums](https://forums.xilinx.com/t5/Forums/ct-p/XlnxProd) 
   
   ## Xilinx Machine Learning Options
   * [Xilinx ML page]([Reconfig]-Xilinx-ML-Tools)
