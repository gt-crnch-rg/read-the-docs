===============================
Kingpin - NVIDIA DevKit Systems
===============================

Acknowledgments
===============
The Kingpin nodes are hoteled hardware sponsored by the `Habanero research group <https://habanero.cc.gatech.edu/>`__ led by Dr. Sarkar. This means this group has priority on this hardware via a separate queue but it can be used when not in use by this group.

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
      - CPU
      - Memory (GB)
      - Network
      - Cards
      - Notes
    * - 
      - kingpin1
      - 
      - 
      -
      -
      -      
    
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
      - 6.8.0 (low latency)
      - GCC 11.4.0
      - NVIDIA HPC SDK 24.9, CUDA 12.8
      - 
      - DOCA 2.10

How do I get to the Kingpin nodes?
==================================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on Kingping using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-nextgen-hpc, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-nextgen-hpc -w kingpin1

Using NVIDIA SDK
================

.. code::

    module use /projects/tools/aarch64/ubuntu-22.04/nvhpc-24.9/modulefiles/
    module load nvhpc/24.9

