Xilinx FPGAs - Getting Started
--------------------

Acknowledgments
====================
We appreciate the donation of 2x Alveo U280 boards and licenses from Xilinx's University Program as well as the donation of an AC-510 and AC-511 HMC chip from Micron.

Xilinx FPGA Hardware
====================

Currently, the Rogues Gallery hosts the following Xilinx FPGA hardware.

.. list-table:: **Server-based Hardware**
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
      - flubber9
      -
    * - Xilinx Alveo U280
      - 
      - 
      - flubber5
      - 2 boards
    * - Xilinx SmartSSD
      - 
      - 
      - flubber9
      -
    * - AC-510
      - XCVU060 (Pkg FFVA1156)
      - 4 GB HMC 1.0
      - rg-fpga-cubed
      -

.. list-table:: **Development Board Hardware**
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
      
Documentation and Related Repositories
======================================

- All of our manuals for Alveo boards can be found in the `reconfig-docs repo <https://github.gatech.edu/crnch-rg/reconfig-docs>`__ (requires RG login). 

Accessing the Rogues Gallery Xilinx FPGAs
=========================================

See the `Xilinx FPGA Workflow page here <https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/reconfig/xilinx/xilinx-fpga-crnch-workflow.md>`__ for more details on the process to use this hardware.

The short version is: 

* For emulation and development, please use the FPGA development VMs, `rg-fpga-dev-<1-4>`.
* For GUI-based development, use VNC, ideally with either Slurm or our `OOD instance <https://gt-crnch-rg.readthedocs.io/en/main/general/open-on-demand.html>`__.
* For final bitstream compilation, request a hardware node using Slurm and run the tools on that node. 


Xilinx Software 
===============

Please see the specifc pages on using `Vitis (standard flow) <https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/reconfig/xilinx/xilinx-fpga-crnch-workflow.md>`__, `Vivado flow (advanced) <https://gt-crnch-rg.readthedocs.io/en/main/reconfig/xilinx/xilinx-vivado-flow.html>`__, or frameworks for SmartNics like OpenNIC.

Vitis vs. Vivado vs..
~~~~~~~~~~~~~~~~

Xilinx released the Vitis SW and HW focused framework officially in 2020 to complement existing tools like Vivado (for RTL-based designs), and replace existing tools like SDx (for OpenCL-based designs). However, it is still somewhat confusing as to which tool you might want to use for which situation. This `issue on the Vitis Tutorials repo <https://github.com/Xilinx/Vitis-Tutorials/issues/73>`__ includes an insightful table from Víctor Vilches which we have included and modified slightly.

.. list-table:: Xilinx Tool Variations (from `Issue 73 and Víctor Vilches <https://github.com/Xilinx/Vitis-Tutorials/issues/73>`__)
    :widths: auto
    :header-rows: 1
    :stub-columns: 1
    
    * - Tool 
      - Stakeholder
      - Aim of Tool
    * - Vivado
      - Hardware engineer
      - Develops RTL (ie, Verilog) kernels
    * - Vitis
      - Embedded engineer
      - Creates low level firmware, BSPs, boot sequences and integrates software and hardware efforts
    * - Vitis HLS
      - Software engineer
      - Develops C, C++ or OpenCL kernels
    * - Vitis AI
      - Data scientist
      - Uses HLS and frameworks to develop AI constructs/kernels

Supported Versions of Xilinx Tools
~~~~~~~~~~~~~~~~

With that in mind, we support the following versions of Xilinx software on our testbed:

.. list-table:: **Supported Software**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1
    
    * - Software
      - Versions
      - Notes
    * - Vitis
      - 2020.2, 2021.1, 2021.2, 2022.1
      -
    * - Vivado
      - 2020.2, 2021.1, 2021.2, 2022.1
      -
    * - Vitis HLS
      - 2020.2, 2021.1, 2021.2, 2022.1
      -
    * - Vitis-AI
      -
      -
    * - SDAccel
      - 2019.2
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

    lmutil - Copyright (c) 1989-2016 Flexera Software LLC. All Rights Reserved.
    Flexible License Manager status on Mon 4/5/2021 21:37

    License server status: 2100@toolbox
        License file(s) on toolbox: /tools/reconfig/licenses/xilinx_vivado_july2020.lic:

    toolbox: license server UP (MASTER) v11.14.1

    Vendor daemon status (on toolbox):

        xilinxd: UP v11.14.1

    Feature usage info:

    Users of Vivado_System_Edition:  (Total of 15 licenses issued;  Total of 0 licenses in use)
    Users of SDK:  (Total of 15 licenses issued;  Total of 0 licenses in use)
    ...
    Users of HLS:  (Total of 15 licenses issued;  Total of 0 licenses in use)
    ...

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
* `Xilinx ML page (TBD) <tbd.html>`_
