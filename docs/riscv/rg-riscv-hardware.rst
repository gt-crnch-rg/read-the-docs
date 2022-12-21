===============
RISC-V Hardware
===============

Current RISC-V development boards provide an early place to run RISC-V applications and evaluations with standard operating systems. While most of these systems are not yet "high-performance", we have made several RISC-V platforms available for testing and benchmarking as prototypes. 

You also have the option to test RISC-V platforms with `QEMU <https://www.qemu.org/docs/master/system/target-riscv.html>`__, an open-source emulation and VM tool that can run RISC-V operating systems with RISC-V CPU emulation. 


Current Status
==============

BUGS / Feature Requests
=======================
- Physical devices are currently being set up with our standard load-out. 
- The MangoPi device currently does not support shared home due to its networking setup. 

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
      - Wifi
      - `MangoPi MQ-Pro; MPi-MQ1PH <https://linux-sunxi.org/MangoPi_MQ-Pro>`__
      - No shared nethome/scratch
    * - johnny-rv5-3
      - 2xU74 cores 
      - 8 GB LPDDR4
      - 1 GB Ethernet
      - `StarFive VisionFive (V1) <https://www.starfivetech.com/en/site/boards>`__
      - Currently being deployed


Software and Tools
==================
RISC-V images can currently be run with QEMU - we recommend using `standard Ubuntu RISC-V images <https://ubuntu.com/download/risc-v>`__ or `SiFive's Freedom Unleashed SDK <https://github.com/sifive/freedom-u-sdk/releases>`__.

ISA Simulators
--------------

- `Spike <>`__
- `Dromajo <https://github.com/chipsalliance/dromajo>`__

