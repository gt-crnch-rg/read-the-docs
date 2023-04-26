============
Quorra - NVIDIA Ampere GPUs
============

Acknowledgments
==============
Quorra1 is also funded via GT's Techfee program, so usage for this server is reserved for coursework (when requested by instructors or students). Please read more about Techfee hardware `on this page <https://crnch-rg.cc.gatech.edu/tech-fee-hosted-equipment/>`__

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
    * - rg-gpu
      - quorra1
      - 2x `AMD EPYC 7502 (Rome) <https://www.amd.com/en/products/cpu/amd-epyc-7502>`__
      - 256 GB DDR4, 3200 MHz, 16 GB DIMMs
      - Connect-X 5 (MT27800), 100 GE; Bluefield-2 DPU (MT42822)
      - 4x `A30 <https://www.nvidia.com/en-us/data-center/products/a30-gpu/>`__; 1x `A100 <https://www.nvidia.com/en-us/data-center/a100/>`__ 
      -      
    * - rg-gpu
      - quorra2
      - 2x `AMD EPYC 7502 (Rome) <https://www.amd.com/en/products/cpu/amd-epyc-7502>`__
      - 256 GB DDR4, 3200 MHz, 16 GB DIMMs
      - Connect-X 5 (MT27800), 100 GE; Bluefield-2 DPU (MT42822)
      - 4x `A30 <https://www.nvidia.com/en-us/data-center/products/a30-gpu/>`__
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
      - 5.4.0
      - GCC 7.5
      - NVIDIA HPC SDK 23.3, CUDA 12.0
      - 
      - DOCA 1.5.1

How do I get to Quorra?
=========================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on Quorra using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-gpu, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-gpu -w quorra2
    //SSH to the resource
    ssh quorra2
    
    
The local modules for NVIDIA HPC SDK should load automatically. However if they do not you can run ". /etc/profile.d/y02_rg_local_modules.sh" to pull in all the local modulepaths.

Using NVIDIA SDK
=========================

.. code::

    module load nvhpc/23.3

MIG
---
`See our internal docs for more instructions on using MIG with these GPUs here <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/[HPC]-MIG>`__.


Useful training material
------------------------

TBD

Vendor-provided Documents and Resources
---------------------------------------
