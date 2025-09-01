=======================
Rudi - Jetson Dev Boards
=======================

What's Interesting About This Hardware?
=======================================

The Jetson devices combine Arm CPU cores and a small NVIDIA GPU along with AI and edge-focused software stacks. 

Current Status
==============

rudi1 is currently not available and needs to be reimaged.

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
      - 6-core NVIDIA Carmel Arm v8.2, 1.9 GHz 
      - Volta, 384 cores, 48 Tensor Cores
      - 8 GB DRAM
      - 1 Gigabit Ethernet
      -
    * - rg-neuro
      - rudi2
      - `AGX Orin Devkit <https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/>`__
      - 8-core Arm v8.2, Cortex-A78AE, 2.2 MHz
      - Ampere, 1792 cores, 56 Tensor Cores 
      - 32 GB LPDDR5
      - 1 Gigabit Ethernet
      -
    * - rg-neuro
      - rudi3
      - `AGX Orin Devkit <https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/>`__
      - 8-core Arm v8.2, Cortex-A78AE, 2.2 MHz
      - Ampere, 2048 cores, 64 Tensor Cores 
      - 64 GB LPDDR5
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
    * - rudi<2-3>
      - Ubuntu 22.04.5
      - 5.15.148
      - GCC 11.4.0
      - CUDA 12.6
      - 

How do I get to rudi devkits?
=============================

As with most CRNCH resources, you need to either log in via the gateway node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on rudi2 using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-neuro, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-neuro -w rudi2
   
How do I run nvidia-smi on Jetson boards?
=====================================================

Users typically need to use sudo to run nvidia-smi on Jetson devices since they are configured differently than data center GPUs. This can be done through a local rule that allows limited sudo. Note that nvidia-smi on the Jetson platform does not report as much information as for a data center GPU (e.g., an A30 or A100).

.. code::

    rudi2$> sudo /usr/sbin/nvidia-smi

You can alternatively use the `tegrastats` command to get a running list of statistics. Note that with `tegrastats --help` you can see how to change the interval and configuration used.
    
.. code::

    rudi2$> tegrastats
    09-01-2025 10:55:25 RAM 1313/30697MB (lfb 37x4MB) SWAP 0/15348MB (cached 0MB) CPU [0%@729,0%@729,0%@729,0%@729,0%@729,0%@729,0%@729,0%@729,off,off,off,off] GR3D_FREQ 0% cpu@43.343C soc2@39.812C soc0@40.312C tj@43.343C soc1@38.843C VDD_GPU_SOC 1995mW/1995mW VDD_CPU_CV 0mW/0mW VIN_SYS_5V0 2524mW/2524mW
    09-01-2025 10:55:26 RAM 1313/30697MB (lfb 37x4MB) SWAP 0/15348MB (cached 0MB) CPU [0%@729,0%@729,0%@729,0%@729,0%@729,0%@729,0%@729,0%@729,off,off,off,off] GR3D_FREQ 0% cpu@42.875C soc2@39.906C soc0@40.031C tj@42.875C soc1@38.906C VDD_GPU_SOC 1995mW/1995mW VDD_CPU_CV 0mW/0mW VIN_SYS_5V0 2524mW/2524mW
    
    #Ctrl-C to stop

Using NVIDIA Jetson Developer Kit Modules
-----------------------------------------
- `NVIDIA Jetson Developer Kit User Guide <https://docs.nvidia.com/jetson/archives/r35.1/DeveloperGuide/index.html>`__

Vendor-provided Documents and Resources
---------------------------------------
- `Power optimization with Jetson boards - NVIDIA blog <https://developer.nvidia.com/blog/power-optimization-with-nvidia-jetson/>`__
