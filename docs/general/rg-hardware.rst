=======================
Rogues Gallery Hardware
=======================

The Rogues Gallery testbed is composed of both "virtual" resources and
"physical" servers and test platforms. The figure below shows the Rogues
Gallery resources at a high level with suggested paths from development
VMs to the actual hardware. Discussion of the filesystems you have
access to can be found `here <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-filesystems.html>`__.

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
RHEL8 or Ubuntu 22.04.

RG Virtual Machines
--------------------
.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - CPU
      - Memory (GB)
      - Local Storage (GB)
      - Software and Features
    * - rg-emu-dev
      - 4 core, E312xx
      - 4
      - 33
      - Emu simulator and tools
      


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

The Pathfinder system consists of 4 chassis while the Emu Chick is a one chassis system. We recommend that you use the newer Pathfinder system for your work.

.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - Nodes
      - Memory (GB)
      - LCEs
      - Network
      - Notes
    * - pathfinder (4 chassis)
      - 32  
      - 2048
      - 784
      - RapidIO 2.0, 10 GE
      - 
    * - karrawingi (Emu Chick, 1 chassis)
      - 8
      - 512
      - 64
      - RapidIO, 1 GE
      - karrawingi-login

Neuromorphic/AI
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
    * - quorra1
      - 2x `AMD EPYC 7502 (Rome) <https://www.amd.com/en/products/cpu/amd-epyc-7502>`__
      - 256 DDR4, 3200 MHz, 16 GB DIMMs
      - Bluefield-2 NIC, 10 GE
      - 4x A30
      -       
    * - quorra2
      - 2x `AMD EPYC 7502 (Rome) <https://www.amd.com/en/products/cpu/amd-epyc-7502>`__
      - 256 DDR4, 3200 MHz, 16 GB DIMMs
      - Bluefield-2 NIC, 10 GE
      - 4x A30, 1x A100
      -
    * - rg-fpaa-host
      - Raspberry Pi Model 3B
      - 2 GB
      - 
      - 
      - Hosts FPAA via USB UART connection
    * - rudi1
      - 
      -
      -
      -
      - `Jetson Xavier NX Developer Kit <https://developer.nvidia.com/embedded/jetson-xavier-nx-devkit>`__
    * - rudi2
      - 
      -
      -
      -
      - `Jetson Orin AGX Developer Kit (see page here `<https://gt-crnch-rg.readthedocs.io/en/main/neuromorphic/rudi-jetson-dev-boards.html>`__)
      
Reconfigurable and Novel Networking
-----------------------------------
	
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
      - 256 DDR4, 2133 MHz, 32 GB DIMMs
      - 10 GE
      - 2x Alveo U50, Coral TPU
      - NA
    * - flubber2
      - 2x `Intel Gold 6226R <https://ark.intel.com/content/www/us/en/ark/products/199347/intel-xeon-gold-6226r-processor-22m-cache-2-90-ghz.html>`__
      - 384 DDR4, 2666 MHz, 32 GB DIMMs
      - 10 GE
      - Arria 10 PAC, Bittware 520N
      - NA
    * - flubber3
      - 2x `Intel Gold 6226R <https://ark.intel.com/content/www/us/en/ark/products/199347/intel-xeon-gold-6226r-processor-22m-cache-2-90-ghz.html>`__
      - 384 DDR4, 2666 MHz, 32 GB DIMMs
      - 10 GE, EDR IB 
      - Stratix 10 PAC, Bittware 520MX, Bittware 385A-SoC 
      - NA
    * - flubber4
      - 2x `AMD EPYC 7513 (Milan) <https://www.amd.com/en/products/cpu/amd-epyc-7513>`__
      - 256 DDR4, 3200 MHz, 16 GB DIMMs
      - NVIDIA ConnectX-6 
      - NA
      - NA
    * - flubber5
      - 2x `AMD EPYC 7513 (Milan) <https://www.amd.com/en/products/cpu/amd-epyc-7513>`__
      - 256 DDR4, 3200 MHz, 16 GB DIMMs
      - NVIDIA ConnectX-6 
      - Xilinx Alveo U280
      - NA
    * - flubber6
      - 2x `AMD EPYC 7513 (Milan) <https://www.amd.com/en/products/cpu/amd-epyc-7513>`__
      - 256 DDR4, 3200 MHz, 16 GB DIMMs
      - NVIDIA ConnectX-6, Innova-2 Flex, `Bluefield-1 NIC <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BNetworking%5D-Mellanox-BlueField-Resources>`__, Bluefield-2 NIC, Intel N6000 
      - NA 
      - Smart Networking Node
    * - flubber7
      - 2x `AMD EPYC 7513 (Milan) <https://www.amd.com/en/products/cpu/amd-epyc-7513>`__
      - 256 DDR4, 3200 MHz, 16 GB DIMMs
      - NVIDIA ConnectX-6, Innova-2 Flex, `Bluefield-1 NIC <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BNetworking%5D-Mellanox-BlueField-Resources>`__, Bluefield-2 NIC, Intel N6000 
      - NA
      - Smart Networking Node
    * - flubber8
      - 2x `Intel Gold 6338 <https://www.intel.com/content/www/us/en/products/sku/212285/intel-xeon-gold-6338-processor-48m-cache-2-00-ghz/specifications.html>`__
      - 512 DDR4, 3200 MHz, 32 GB DIMMs
      - NVIDIA ConnectX-6
      - NA 
      - NA
    * - flubber9
      - 2x `Intel Gold 6338 <https://www.intel.com/content/www/us/en/products/sku/212285/intel-xeon-gold-6338-processor-48m-cache-2-00-ghz/specifications.html>`__
      - 512 DDR4, 3200 MHz, 32 GB DIMMs
      - NVIDIA ConnectX-6
      - NA 
      - NA
    * - flubber10
      - 2x `Intel Gold 6338 <https://www.intel.com/content/www/us/en/products/sku/212285/intel-xeon-gold-6338-processor-48m-cache-2-00-ghz/specifications.html>`__
      - 512 DDR4, 3200 MHz, 32 GB DIMMs
      - NVIDIA ConnectX-6
      - NA 
      - NA
      
Devboard Hosts
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
    * - brainard2
      - i5-10210U
      - 32 GB DDR4, 2666 MHz, 16 GB DIMMs
      - 1 GE
      - 
      - Connection to RISC-V board and FPGA, `Intel NUC10i5FNK <https://www.intel.com/content/www/us/en/products/sku/195507/intel-nuc-10-performance-kit-nuc10i5fnk/specifications.html>`__
      
RISC-V
--------------------   
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
    * - johnny-rv5-4
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

Simulation and Tutorial Machines
--------------------------------
	
.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - CPU
      - Memory (GB)
      - Network
      - Notes
    * - hawksbill
      - 4x `Intel E7-4820 <https://ark.intel.com/content/www/us/en/ark/products/53675/intel-xeon-processor-e74820-18m-cache-2-00-ghz-5-86-gts-intel-qpi.html>`__
      - 1024 DDR3
      - 1 GE
      - Used for Jupyter notebooks

Rogues Gallery Networking
=========================

File servers typically connect to the network via paired 40 Gigabit Ethernet links while most SSH logins to nodes use either 1 or 10 Gigabit Ethernet. Specific node paages and tables should list their attached network hardware, all of which connect to the following switches:

.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Switch Type
      - Ports
      - Max Speed
      - Attached Nodes
      - Notes
    * - `Cisco 93138 <https://www.cisco.com/c/en/us/support/switches/nexus-93108tc-fx-switch/model.html>`__
      - 48x 10GBase-T, 6x 40/100 Gigabit QSFP28
      - 40/100 Gigabit
      - Flubbers, Quorras, Frozones
      - Used for connecting most nodes with a 10GE interface to the wider network
    * - `Cisco 9336 <https://www.cisco.com/c/en/us/support/switches/nexus-9336c-fx2-switch/model.html>`__
      - 36x 40/100 Gigabit QSFP28
      - 40/100 Gigabit
      - BlueField DPUs, Mellanox NICs, SmartNICs, 
      - Used for higher-speed network accelerators not used for standard SSH login
    * - `Mellanox 7970 <https://support.mellanox.com/s/productdetails/a2v50000000XoRXAA0/sb7790>`__
      - 36x EDR InfiniBand
      - 100 Gigabit
      - Octavius, Mellanox NICs 
      - Used to connect the Octavius nodes together as well as for requested InfiniBand network accelerators
    * - Cisco 1 GE Switch__
      - 48x 1 Gigabit Ethernet
      - 1 Gigabit
      - pynq-z2-*, johnny-rv5-*, brainard2
      - Used primarily for management logins and to connect nodes in our devboard cluster

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
    * - frozone<1-4>
      - 2x `Ice Lake 8352Y <https://www.intel.com/content/www/us/en/products/sku/212284/intel-xeon-platinum-8352y-processor-48m-cache-2-20-ghz/specifications.html>`__
      - 256 DDR4, 3200GHz, 16 GB DIMMs
      - `Omni-Path 100 GB, 100HFA16LS <https://ark.intel.com/content/www/us/en/ark/products/92007/intel-omni-path-host-fabric-interface-adapter-100-series-1-port-pcie-x16.html>`__
      - `1.6TB P5800X SSD <https://www.intel.com/content/www/us/en/products/sku/201859/intel-optane-ssd-dc-p5800x-series-1-6tb-2-5in-pcie-x4-3d-xpoint/specifications.html>`__ 
      - FY 2021 TechFee Acquisition
    * - dash<1-4>
      - 2x `Intel 9468 (Sapphire Rapids Max) <https://www.intel.com/content/www/us/en/products/sku/232596/intel-xeon-cpu-max-9468-processor-105m-cache-2-10-ghz/specifications.html>`__
      - 512 GB DDR5, 4800 MHz, 32 GB DIMMs; 64 GB HBM memory
      - BlueField 3 DPU, 10 GE
      - Dash 1-2 have an Alveo U280; Dash 3-4 have Napa:Tech SmartNICs
      - FY 2023 TechFee Acquisition
