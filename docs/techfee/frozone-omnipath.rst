########
Frozone
########

Acknowledgments
===============
The Frozone systems funded via GT's Techfee program, so usage for this server is reserved for coursework (when requested by instructors or students). Please read more about Techfee hardware `on this page <https://crnch-rg.cc.gatech.edu/tech-fee-hosted-equipment/>`__ We also acknowledge NVIDIA's kind support of GPUs for the GT student cluster competition group, `Team Phoenix <https://gt-chipc.github.io/gt-student-cluster-competition/>`__.

What's Interesting About This Hardware?
=======================================
The Frozone servers use Intel Ice Lake CPUs and also are connected by one of the few OmniPath switches on Georgia Tech's campus. Each CPU in this platform supports Intel "SpeedStep" technology. Additionally, all of CRNCH's Optane memory is currently installed in these nodes.

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
    * - rg-nextgen-hpc
      - 2x `Intel 8352Y (Ice Lake) <https://www.intel.com/content/www/us/en/products/sku/212284/intel-xeon-platinum-8352y-processor-48m-cache-2-20-ghz/specifications.html>`__
      - 256 GB DDR4, 3200 MHz, 16 GB DIMMs
      - OmniPath
      - 2x `NVIDIA A100 GPUs <https://www.nvidia.com/en-us/data-center/h100/>`__
      - Optane memory      


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
      - Intel OneAPI 2023.0; NVIDIA HPC SDK 23.9; CUDA 12.3/11.0
      - 
      - 

How do I get to Frozone nodes?
=======================

As with most CRNCH resources, you need to either log in via the gateway
node, `rg-login`, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on Frozone using slurm:

.. code::

    // Request an allocation of 1 hr, partition rg-nextgen-hpc, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-nextgen-hpc -w frozone1
    // Request one GPU
    salloc -t 1:00:00 -p rg-nextgen-hpc -w frozone1 -G 1

To request an entire node (and all the memory) you can run:


.. code::

    //Request an allocation of with 2 sockets, all cores in each socket, and 2 threads per core, partition rg-nextgen-hpc, 
    //specify the node name for the server with -w, and request unlimited memory (otherwise cgroups limits to 1 GB per core)
    salloc --sockets-per-node=2 --cores-per-socket=64 --threads-per-core=2 -p rg-nextgen-hpc -w frozone --mem=0 


Vendor-provided Documents and Resources
---------------------------------------
