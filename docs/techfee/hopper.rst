==========================
Hopper - Grace Hopper Nodes
==========================

CRNCH RG has four Grace Hopper nodes, `hopper<1-4>`. Note that they live under the .cc.gatech.edu subnet but are accessible via Slurm.

Acknowledgments
===============

The Hopper systems are funded via GT's Techfee program, so usage for these servers are prioritized for coursework (when requested by instructors or students). Please read more about Techfee hardware `on this page <https://crnch-rg.cc.gatech.edu/tech-fee-hosted-equipment/>`__. This cluster was funded in FY2024 through the efforts of Will Powell.

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
      - CPU
      - Memory (GB)
      - Network
      - Cards
      - Notes
    * - rg-novel-hpc
      - 
      - 
      - 10 GE
      - 
      -       

Software and Tools
==================

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
      - 6.5.0
      - GCC 11.4.0
      - NVHPC 24.5
      - 
      - 

How do I get to Hopper?
=======================

As with most CRNCH resources, you need to either log in via the gateway node, rg-login, or access the system from the campus network via VPN or an on-campus connection. 

To request an allocation on dash using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-hpc, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-nextgen-hpc -w hopper
  

Vendor-provided Documents and Resources
---------------------------------------
