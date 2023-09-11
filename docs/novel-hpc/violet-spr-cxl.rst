========================
Violet - Sapphire Rapids
========================

What's Interesting About This Hardware?
=======================================
The Violet servers use Intel Sapphire Rapids along with PCI Express 5.0 to support high-bandwidth accelerators as well as the new Compute Xpress Link (CXL) technology. Violet1 also hosts CRNCH's H100 PCIe GPU in partnership with `Dr. Bryngelson's lab <https://comp-physics.group/>`__.

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
      - 2x `Intel 6454S (Sapphire Rapids) <https://www.intel.com/content/www/us/en/products/sku/231733/intel-xeon-gold-6454s-processor-60m-cache-2-20-ghz/specifications.html>`__
      - 512 GB DDR5, 4800 MHz, 32 GB DIMMs
      - Connect-X 6 (MT28908), 10 GE
      - 1x `NVIDIA H100 GPU <https://www.nvidia.com/en-us/data-center/h100/>`__
      -       

Instinct is a single node server with two AMD 210 GPUs, which are very similar to the
MI250x GPUs deployed in `ORNL's Frontier <https://www.olcf.ornl.gov/frontier/>`__. This
server has two Milan CPUs, 512 GB of DDR4 memory, and a Connect-X 6 networking card.

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
    * - RHEL8
      - 4.18.0
      - GCC 8.5
      - Intel OneAPI 2023.0; NVIDIA HPC SDK 23.5; CUDA 12.0/11.0
      - 
      - 

How do I get to Violet?
=======================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on Violet using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-hpc, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-hpc -w violet1
   
To request an entire node (and all the memory) you can run:


.. code::

    //Request an allocation of with 2 sockets, all cores in each socket, and 2 threads per core, partition rg-hpc, 
    //specify the node name for the server with -w, and request unlimited memory (otherwise cgroups limits to 1 GB per core)
    salloc --sockets-per-node=2 --cores-per-socket=64 --threads-per-core=2 -p rg-hpc -w violet1 --mem=0 

Compiling for the Violet SPR CPUs
---------------------------------

TBD

Vendor-provided Documents and Resources
---------------------------------------

- `Intel Xeon CPU Max Series Configuration and Tuning Guide  <https://www.intel.com/content/www/us/en/content-details/769060/intel-xeon-cpu-max-series-configuration-and-tuning-guide.html>`__ - Intel's tuning guide for this CPU architecture
