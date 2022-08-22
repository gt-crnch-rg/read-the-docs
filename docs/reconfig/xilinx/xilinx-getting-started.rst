Xilinx FPGAs - Getting Started
--------------------

Acknowledgments
====================
We appreciate the donation of 2x Alveo U280 boards and licenses from Xilinx's University Program as well as the donation of an AC-510 and AC-511 HMC chip from Micron.

Xilinx FPGA Hardware
====================
This master list specifies the available Rogues Gallery FPGA hardware:

.. list-table:: **Server-based hardware**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - FPGA Board
      - FPGA Chip
      - Memory
      - Hosting Machine
      - Notes
    * - Xilinx Alveo U50
      - 
      - 8 GB HBM
      - flubber1
      - 2 boards
    * - Xilinx Alveo U250
      - 
      - 
      - TBD
      -
    * - Xilinx Alveo U280
      - 
      - 
      - flubber5
      - 3 boards (1 currently)
    * - Xilinx SmartSSD
      - 
      - 
      - flubber4
      -
    * - AC-510
      - XCVU060 (Pkg FFVA1156)
      - 4 GB HMC 1.0
      - rg-fpga-cubed
      -

.. list-table:: **Development Board hardware**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - FPGA Board
      - FPGA Chip
      - Memory
      - Hosting Machine
      - Notes
    * - ZCU102
      - 
      - 
      - 
      - 
    * - Versal VCK190
      - 
      - 
      - TBD
      -
    * - Pynq Z2
      - 
      - 
      - synestia2
      - 50+ boards available for classes
      

Accessing the Rogues Gallery Xilinx FPGAs
=========================================

See the Reconfigurable Computing Workflow page for more details on the process to use this hardware.

The short version is: 
* For emulation and development, please use the FPGA development VMs, `rg-fpga-dev-<1-6>`.
* For final bitstream compilation, request a hardware node using Slurm and run the tools on that node. 


Xilinx Software 
===============

Please see the specifc pages on using Vitis (standard flow), Vivado flow (advanced), or frameworks for SmartNics like OpenNIC

.. list-table:: **Supported Software**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1
    
    * - Software
      - Versions
      - OS Supported
      - Notes
    * - Vitis
      - 
      -
      - 
    * - Vivado
      - 
      -
      -
    * - Vitis-AI
      -
      -
      - 
    * - SDAccel
      -
      -
      - Deprecated
      

* How to quickly start Vitis/Vivado 20.2:

  .. code-block::

     export XILINXTOOLSHARE=/tools/reconfig/xilinx
     #Source the different Vivado/Vitis settings files
     . $XILINXTOOLSHARE/Vivado/2020.2/settings64.sh
     . $XILINXTOOLSHARE/Vitis/2020.2/settings64.sh
     . $XILINXTOOLSHARE/Vitis_HLS/2020.2/settings64.sh


How do I check the licenses that are available?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
You can either use the licensing center from the GUI version of a tool like Vivado or Vitis, or you can run the following:

.. code-block::

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

Getting started with AWS for development
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Amazon supports F1 instances that have between 1 and 8 Xilinx FPGAs. Currently they support the VCU1525 with an Ultrascale+ part. Xilinx and Amazon both have good references on getting started with these instances.


* `Xilinx Getting Started with AWS <https://www.xilinx.com/products/design-tools/acceleration-zone/aws.html#gettingstarted>`_
* `SDAccel AWS examples from Accelerator Program <https://github.com/Xilinx/SDAccel_Examples/wiki/Getting-Started-on-AWS-F1-with-SDAccel-and-RTL-Kernels>`_
* `SDAccel AWS Labs <https://github.com/Xilinx/SDAccel-AWS-F1-Developer-Labs>`_

Xilinx Accelerator Program
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Xilinx has a program for faculty and staff that seems to provide discounts on Alveo board (~$1500 discount for up to two board) and links to existing resources for SDAccel, AWS, and Alveo products. These are normally behind a login wall, but please see the links below:


* `Alveo Getting Started <https://www.xilinx.com/video/fpga/getting-started-with-alveo-u200-u250.html>`_
* `Alveo FPGA Tutorial geared towards Nimbix (another cloud provider) <https://www.nimbix.net/alveo-fpga-tutorial>`_
* `General Xilinx Forums <https://forums.xilinx.com/t5/Forums/ct-p/XlnxProd>`_ 

Xilinx Machine Learning Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* `Xilinx ML page <[Reconfig]-Xilinx-ML-Tools>`_
