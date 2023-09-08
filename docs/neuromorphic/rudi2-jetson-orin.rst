============
Rudi2 - Jetson AGX Orin
============

What's Interesting About This Hardware?
==============

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
    * - rg-neuro
      - 
      - 
      - 
      - 
      -       

Software and Tools
=====================

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
    * - Ubuntu 20.04
      - 4.18.0
      - GCC 8.5
      - Intel OneAPI 2023.0; NVIDIA HPC SDK 23.5; CUDA 12.0/11.0
      - 
      - 

How do I get to rudi2?
=========================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on rudi2 using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-neuro, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-neuro -w rudi2
   

Using NVIDIA Jetson Developer Kit Modules
---------------------------------------
- `NVIDIA Jetson Developer Kit User Guide <https://docs.nvidia.com/jetson/archives/r35.1/DeveloperGuide/index.html>`__

Vendor-provided Documents and Resources
---------------------------------------

