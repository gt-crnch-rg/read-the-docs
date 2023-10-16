===============
BlueField DPUs
===============

.. image:: ../figures/images/nvidia_bf2_card.png
   :alt: BlueField 2 card
   :scale: 10

NVIDIA's BlueField Data Processing Unit has both a high-speed InfiniBand/Ethernet interconnect and on-board DRAM and Arm CPU cores. Notably, this is one of the first SmartNIC devices that can run an on-board operating system in "host" mode. 

Acknowledgments
===============
Dr. Young and Dr. Bryngelson have received several BF2 cards which are hosted in the Rogues Gallery via `NVIDIA's Academic Hardware Grant program <https://nvidia.my.site.com/HardwareGrant/s/Application>`.

Current Status
==============

BUGS / Feature Requests
-----------------------
- Some cards are likely to move hosts as we reimage machines to better support running DPUs.

System Specifications
=====================

.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Queues
      - Node Name
      - Hosting Node
      - CPU
      - Memory (GB)
      - Network
      - Notes
    * - rg-smart-nic
      - quorra1-bf2-mgt
      - quorra1
      - 
      - 
      - 
      -      
    * - rg-smart-nic
      - dash3-bf3
      - quorra1
      - Cortex-A78AE, 16 core
      - 32 GB DDR4, dual channel
      - 
      - Temporary home until dash3 comes online



Software and Tools
===================

.. list-table::
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Distro
      - Kernel
      - Standard Compilers
      - Other Compilers
      - MPI
      - Miscellaneous
    * - Ubuntu 22.04
      - 5.15.0
      - GCC 11.4
      - 
      - 
      - DOCA 2.2.0

How to Access BlueField Cards
=============================

As with most CRNCH resources, you need to either log in via the gateway node, rg-login, or access the system from the campus network via VPN or an on-campus connection.

To request an allocation using slurm:

//Request an allocation of 1 hr, partition rg-smart-nice, and specify the node name for the server with -w
salloc -t 1:00:00 -p rg-smart-nic -w dash3-bf3
//SSH to the resource
ssh dash3-bf3


