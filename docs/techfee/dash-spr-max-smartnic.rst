==========================
Dash - Sapphire Rapids Max
==========================

What's Interesting About This Hardware?
=======================================
The Dash servers use Intel Sapphire Rapids Max along with PCI Express 5.0 to support SmartNIC accelerators. CRNCH RG has four dash nodes, `dash<1-4>`.

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
    * - rg-hpc
      - 2x `Intel 9468 (Sapphire Rapids Max) <https://www.intel.com/content/www/us/en/products/sku/232596/intel-xeon-cpu-max-9468-processor-105m-cache-2-10-ghz/specifications.html>`__
      - 512 GB DDR5, 4800 MHz, 32 GB DIMMs; 64 GB HBM memory
      - BlueField 3 DPU, 10 GE
      - Dash 1-2 have an Alveo U280; Dash 3-4 have Silicom DPUs
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
      - 5.15.0
      - GCC 11.4
      - 
      - 
      - 

How do I get to Dash?
=======================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on dash using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-hpc, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-hpc -w dash3
   
To request an entire node (and all the memory) you can run:

.. code::

    //Request an allocation of with 2 sockets, all cores in each socket, and 2 threads per core, partition rg-hpc, 
    //specify the node name for the server with -w, and request unlimited memory (otherwise cgroups limits to 1 GB per core)
    salloc --sockets-per-node=2 --cores-per-socket=64 --threads-per-core=2 -p rg-hpc -w dash3 --mem=0 

Vendor-provided Documents and Resources
---------------------------------------

- `Intel Xeon CPU Max Series Configuration and Tuning Guide  <https://www.intel.com/content/www/us/en/content-details/769060/intel-xeon-cpu-max-series-configuration-and-tuning-guide.html>`__ - Intel's tuning guide for this CPU architecture
