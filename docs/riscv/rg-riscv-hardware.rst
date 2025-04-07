===============
RISC-V Hardware
===============

Current RISC-V development boards provide an early place to run RISC-V applications and evaluations with standard operating systems. While most of these systems are not yet "high-performance", we have made several RISC-V platforms available for testing and benchmarking as prototypes. 

You also have the option to test RISC-V platforms with `QEMU <https://www.qemu.org/docs/master/system/target-riscv.html>`__, an open-source emulation and VM tool that can run RISC-V operating systems with RISC-V CPU emulation. 


Current Status
==============

We are working to bring online the following hardware as part of our futurama cluster:

- Milk-V Jupiter boards
- P550 boards
- Esperanto ETSOC-1

BUGS / Feature Requests
=======================
- Physical devices are currently being set up with our standard load-out.  

System Specifications
=====================

.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Node Name
      - CPU
      - Memory (GB)
      - Network
      - Platform Name
      - Notes
    * - johnny-rv5-1
      - 4xU74 cores and 1xS7 core, 1.4 GHz
      - 16 GB DDR4	
      - 1 GB Ethernet
      - SiFive Unmatched board
      -
    * - johnny-rv5-2
      - 1 core `Allwinner D1 <https://linux-sunxi.org/D1>`__
      - 1 GB DDR3
      - 1 GB Ethernet
      - `MangoPi MQ-Pro; MPi-MQ1PH <https://linux-sunxi.org/MangoPi_MQ-Pro>`__
      - 
    * - johnny-rv5-3
      - 2xU74 cores 
      - 8 GB LPDDR4
      - 1 GB Ethernet
      - `StarFive VisionFive (V1) <https://www.starfivetech.com/en/site/boards>`__
      -
    * - johnny-rv5-5
      - `SOPHON SG2042 SoC <https://en.sophgo.com/product/introduce/sg2042.html>`__, (64-core C920, RVV 0.71) 
      - 128 GB DDR4
      - 1 GB Ethernet
      - `Milk-V Pioneer system <https://milkv.io/pioneer>`__
      - Contains AMD R5 230 GPU (2014 era GPU)




Software and Tools
==================
RISC-V images can currently be run with QEMU - we recommend using `standard Ubuntu RISC-V images <https://ubuntu.com/download/risc-v>`__ or `SiFive's Freedom Unleashed SDK <https://github.com/sifive/freedom-u-sdk/releases>`__.

Software and Tools
===================

.. list-table::
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - node Name
      - Distro
      - Kernel
      - Standard Compilers
      - MPI
      - Miscellaneous
    * - johnny-rv5-1
      - Ubuntu 22.04
      - 5.4.0
      - GCC 9.0
      - 
      - 
    * - johnny-rv5-2
      - Armbian 22.08.0
      - 5.19.0
      - GCC 11.3
      - 
      - 
    * - johnny-rv5-3
      - Ubuntu 22.04
      - 6.2.0
      - GCC 11.4
      - 
      - 
    * - johnny-rv5-5
      - Fedora 38
      - 6.1.22
      - GCC 13.2.1
      - 
      - 

Requesting RISC-V resources
===========================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on johnny-rv5-1 using Slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-nextgen-hpc, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-nextgen-hpc -w johnny-rv5-1
    //SSH to the resource
    ssh johnny-rv5-1



Guides and Resources
====================
- `SiFive Unmatched Getting Started Guide <https://starfivetech.com/uploads/hifive-unmatched-getting-started-guide-v1p2.pdf>`__
- `Milk-V Pioneer Getting Started Guide <https://milkv.io/docs/pioneer/getting-started>`__

Advanced Guides
===============
- `SiFive Unmatched Debugging and Installation (Requires GT login) <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BRISC-V%5D-SiFive-Unmatched-Debugging-and-Install>`__

Other Tools
-----------
- `Spike <https://github.com/riscv-software-src/riscv-isa-sim>`__
- `Dromajo <https://github.com/chipsalliance/dromajo>`__
