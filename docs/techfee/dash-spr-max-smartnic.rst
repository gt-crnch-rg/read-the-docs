==========================
Dash - Sapphire Rapids Max
==========================

CRNCH RG has four dash nodes, `dash<1-4>`.

Acknowledgments
===============

The Dash systems are funded via GT's Techfee program, so usage for these servers are prioritized for coursework (when requested by instructors or students). Please read more about Techfee hardware `on this page <https://crnch-rg.cc.gatech.edu/tech-fee-hosted-equipment/>`__.

What's Interesting About This Hardware?
=======================================
The Dash servers use Intel Sapphire Rapids Max along with PCI Express 5.0 to support SmartNIC accelerators. Each node also has some SmartNIC related accelerators with `dash<1-2>` having AMD Alveo U280 SmartNICs and `dash<3-4>` having Napa:Tech NT200 SmartNICs.

Current Status
==============
We are currently focused on getting the BlueField-3 DPUs fully set up and documented and will update this page with more information on using the Alveo and Napa:Tech cards in the near future. 

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
    * - rg-nextgen-hpc
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

For more information on using DOCA on these nodes, please see our dedicated DOCA SDK page.

Networking Configuration
==================

The management ports on the BlueField-3 DPUs are connected to a 1 Gigabit Ethernet switch, while the network ports are connected to our `Cisco 9336 100 Gigabit Ethernet switch <https://www.cisco.com/c/en/us/support/switches/nexus-9336c-fx2-switch/model.html#~tab-specs>`__.

How do I get to Dash?
=======================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on dash using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-nextgen-hpc, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-nextgen-hpc -w dash3
   
To request an entire node (and all the memory) you can run:

.. code::

    //Request an allocation of with 2 sockets, all cores in each socket, and 2 threads per core, partition rg-nextgen-hpc, 
    //specify the node name for the server with -w, and request unlimited memory (otherwise cgroups limits to 1 GB per core)
    salloc --sockets-per-node=2 --cores-per-socket=64 --threads-per-core=2 -p rg-nextgen-hpc -w dash3 --mem=0 

Vendor-provided Documents and Resources
---------------------------------------
- `Intel Xeon CPU Max Series Configuration and Tuning Guide  <https://www.intel.com/content/www/us/en/content-details/769060/intel-xeon-cpu-max-series-configuration-and-tuning-guide.html>`__ - Intel's tuning guide for this CPU architecture
