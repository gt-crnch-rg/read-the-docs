=======================
Rogues Gallery Hardware
=======================

The Rogues Gallery testbed is composed of both "virtual" resources and
"physical" servers and test platforms. The figure below shows the Rogues
Gallery resources at a high level with suggested paths from development
VMs to the actual hardware. Discussion of the filesystems you have
access to can be found `here <RG-Filesystems>`__.

For instance, if you're able to test your compilation and do debugging
on the rg-fpga-dev VMs, you can then use the same code on the physical
"flubber" boxes to test your code with a PCI Express-based FPGA. We
currently have three pairs of development VMs that map to physical
hardware, as described more in the tables below.

.. figure:: ../figures/general/rg-machine-overview.png
   :alt: Rogues Gallery Hardware

RG Virtual Machines
===================

Note that VMs are meant as development resources since we may need to
reboot physical hardware often to apply new drivers or reconfigure for
specific experiments. These VMs have limited CPU cores and memory, but
we can reconfigure them as needed or provide additional resources for
long-running simulations. Local storage refers to space hosted within
the VM for /localscratch. Except where noted, all machines are running
Ubuntu 18.04 LTS.

+----------------+-------------+-------------+-------------+-------------+
| Resource       | CPU         | Memory(GB)  | Local       | Software    |
|                |             |             | Storage     | and         |
|                |             |             | (GB)        | Features    |
+================+=============+=============+=============+=============+
| octavius-login | 4 core,     | 32          | 340         | Login for   |
|                | Broadwell   |             |             | the A64FX   |
|                |             |             |             | cluster     |
+----------------+-------------+-------------+-------------+-------------+
| rg-login       | 4 core,     | 8           | 650         | Login node  |
|                | E312xx      |             |             |             |
+----------------+-------------+-------------+-------------+-------------+
| rg-emu-dev     | 4 core,     | 4           | 33          | Emu         |
|                | E312xx      |             |             | simulator   |
|                |             |             |             | and tools   |
+----------------+-------------+-------------+-------------+-------------+
| rg-fpga-dev    | 4 core,     | 8           | 250         | Ubuntu 18,  |
| -<1-6>         | E312xx      |             |             | use for     |
|                |             |             |             | FPGA tools  |
+----------------+-------------+-------------+-------------+-------------+
| rg-neuro-dev   | 4 core,     | 8           | 450         | ROS, FPAA   |
|                | Broadwell   |             |             | tools       |
+----------------+-------------+-------------+-------------+-------------+
| rg-quantum-dev | 4 core,     | 8           | 130         | XACC,       |
|                | Broadwell   |             |             | Qiskit      |
+----------------+-------------+-------------+-------------+-------------+

RG Physical Machines
====================

Arm HPC
--------------------
.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - CPU
      - Memory (GB)
      - Network
      - Cards
      - Notes
    * - octavius<1-16>
      - A64FX
      - 32 GB HBM2e
      - EDR IB
      - 
      - 

Near-Memory
--------------------

Neuromorphic
--------------------
.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - CPU
      - Memory (GB)
      - Network
      - Cards
      - Notes
    * - quorra1-2
      - 
      - 
      - 10 GE
      - 
      - 
    * - rg-fpaa-host
      - 
      - 
      - 
      - 
      - 
    
Reconfigurable and Novel Networking
--------------------
	
.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - CPU
      - Memory (GB)
      - Network
      - Cards
      - Notes
    * - flubber1
      - 2x `Intel E5-2630 <https://ark.intel.com/content/www/us/en/ark/products/92981/intel-xeon-processor-e5-2630-v4-25m-cache-2-20-ghz.html>`__
      - 256 DDR4, 2133GHz, 32 GB DIMMs
      - 10 GE, Innova-2 Flex
      - 2x Alveo U280, Coral TPU
      - NA
    * - flubber2
      - 2x `Intel Gold 6226R <https://ark.intel.com/content/www/us/en/ark/products/199347/intel-xeon-gold-6226r-processor-22m-cache-2-90-ghz.html>`__
      - 384 DDR4, 2666GHz, 32 GB DIMMs
      - 10 GE, Innova-2 Flex, `Bluefield-1 NIC <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BNetworking%5D-Mellanox-BlueField-Resources>`__
      - Arria 10 PAC, Bittware 385A-SoC, Bittware 520N, Bittware 520MX 
      - NA
    * - flubber3
      - 2x `Intel Gold 6226R <https://ark.intel.com/content/www/us/en/ark/products/199347/intel-xeon-gold-6226r-processor-22m-cache-2-90-ghz.html>`__
      - 384 DDR4, 2666GHz, 32 GB DIMMs
      - 10 GE, EDR IB, `Bluefield-1 NIC <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BNetworking%5D-Mellanox-BlueField-Resources>`__ 
      - Stratix 10 PAC 
      - NA
 
 
Techfee Systems
===============
.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - CPU
      - Memory (GB)
      - Network
      - Cards
      - Notes
    * - frozone-<1-4>
      - 2x `Ice Lake 8352Y <https://www.intel.com/content/www/us/en/products/sku/212284/intel-xeon-platinum-8352y-processor-48m-cache-2-20-ghz/specifications.html>`__
      - 256 DDR4, 3200GHz, 16 GB DIMMs
      - `Omni-Path 100 GB, 100HFA16LS <https://ark.intel.com/content/www/us/en/ark/products/92007/intel-omni-path-host-fabric-interface-adapter-100-series-1-port-pcie-x16.html>`__
      - `1.6TB P5800X SSD <https://www.intel.com/content/www/us/en/products/sku/201859/intel-optane-ssd-dc-p5800x-series-1-6tb-2-5in-pcie-x4-3d-xpoint/specifications.html>`__ 
      - FY 2021 TechFee Acquisition
