=======================
Rudi - Jetson Dev Boards
=======================

What's Interesting About This Hardware?
=======================================

Current Status
==============

BUGS / Feature Requests
-----------------------

- N/A

System Specifications
=====================

.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Queues
      - Node Name
      - Board Type
      - CPU
      - GPU
      - Memory (GB)
      - Network
      - Notes
    * - rg-neuro
      - rudi1
      - `Xavier NX 8 GB <https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-xavier-series/>`__
      - 6-core NVIDIA Carmel Armv8.2, 1.9 GHz 
      - Volta, 384 cores, 48 Tensor Cores
      - 8 GB DRAM
      - 1 Gigabit Ethernet
      -
    * - rg-neuro
      - rudi2
      - `AGX Orin Devkit <https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/>`__
      - 
      - Ampere, 1792 cores, 56 Tensor Cores 
      - 32 GB DRAM
      - 1 Gigabit Ethernet
      -

Software and Tools
==================

.. list-table::
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Node name
      - Distro
      - Kernel
      - Standard Compilers
      - Other Compilers
      - Miscellaneous
    * - rudi1
      - Ubuntu 22.04
      - 4.9.201
      - GCC 11.4
      - 
      - 
    * - rudi2
      - Ubuntu 22.04
      - 5.10.65
      - GCC 9.4.0
      - 
      - 

How do I get to rudi devkits?
=============================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

.. note:: 
    
    We are reworking Slurm for these boards. For the moment, you can ssh directly to each board from rg-login.

To request an allocation on rudi2 using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-neuro, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-neuro -w rudi2
   
What's the equivalent of nvidia-smi on Jetson boards?
=====================================================

Jetson boards don't support nvidia-smi commands, so you need to use the `tegrastats` command to get a running list of statistics. Note that with `tegrastats --help` you can see how to change the interval and configuration used.
    
.. code::

    rudi2$> tegrastats
    10-16-2023 10:59:22 RAM 1205/30623MB (lfb 6429x4MB) SWAP 0/15311MB (cached 0MB) CPU [0%@729,0%@729,1%@729,0%@729,0%@729,0%@730,0%@730,0%@729,0%@729,0%@729,0%@729,0%@729] EMC_FREQ 0%@204 GR3D_FREQ 0%@114 GR3D2_FREQ 0%@114 NVJPG1 729 VIC_FREQ 729 APE 233 CV0@-256C CPU@43.5C Tdiode@32.5C SOC2@40.062C SOC0@40.5C CV1@-256C GPU@38.156C SOC1@39.125C CV2@-256C VDD_GPU_SOC 4788mW/4788mW VDD_CPU_CV 798mW/798mW VIN_SYS_5V0 3842mW/3842mW NC 0mW/0mW VDDQ_VDD2_1V8AO 707mW/707mW NC 0mW/0mW
    10-16-2023 10:59:23 RAM 1206/30623MB (lfb 6429x4MB) SWAP 0/15311MB (cached 0MB) CPU [1%@732,0%@729,0%@729,0%@729,0%@729,0%@729,0%@729,0%@728,0%@728,0%@729,0%@730,0%@729] EMC_FREQ 0%@204 GR3D_FREQ 0%@114 GR3D2_FREQ 0%@114 NVJPG1 729 VIC_FREQ 729 APE 233 CV0@-256C CPU@43.906C Tdiode@32.75C SOC2@40.093C SOC0@40.593C CV1@-256C GPU@38C SOC1@39.031C CV2@-256C VDD_GPU_SOC 4788mW/4788mW VDD_CPU_CV 798mW/798mW VIN_SYS_5V0 3842mW/3842mW NC 0mW/0mW VDDQ_VDD2_1V8AO 707mW/707mW NC 0mW/0mW
    #Ctrl-C to stop

Using NVIDIA Jetson Developer Kit Modules
-----------------------------------------
- `NVIDIA Jetson Developer Kit User Guide <https://docs.nvidia.com/jetson/archives/r35.1/DeveloperGuide/index.html>`__

Vendor-provided Documents and Resources
---------------------------------------
- `Power optimization with Jetson boards - NVIDIA blog <https://developer.nvidia.com/blog/power-optimization-with-nvidia-jetson/>`__
