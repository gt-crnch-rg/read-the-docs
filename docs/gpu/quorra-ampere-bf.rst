============
Instinct - NVIDIA Ampere GPUs
============

Acknowledgments
==============
We greatly appreciate the donation of this test platform from AMD to `Dr. Spencer Bryngelson <https://comp-physics.group/>`__, a CRNCH faculty member working on computational fluid dynamics (CFD) codes including `MFC <https://mflowcode.github.io/>`__.

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
    * - rg-gpu
      - 2x `AMD EPYC 7713 (Milan) <https://www.amd.com/en/products/cpu/amd-epyc-7713>`__
      - 512 GB DDR4, 3200 MHz, 32 GB DIMMs
      - Connect-X 6 (MT28908), 10 GE
      - 2x `MI210 <https://www.amd.com/en/products/server-accelerators/amd-instinct-mi210>`__
      -       

Instinct is a single node server with two AMD 210 GPUs, which are very similar to the
MI250x GPUs deployed in `ORNL's Frontier <https://www.olcf.ornl.gov/frontier/>`__. This
server has two Milan CPUs, 512 GB of DDR4 memory, and a Connect-X 6 networking card.

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
    * - RHEL8
      - 4.18.0
      - GCC 8.5
      - ROCm 5.2.0, `AOCC 3.2.0 <https://developer.amd.com/wp-content/resources/57222_AOCC_UG_Rev_3.2.pdf>`__
      - 
      - AOCL 3.2.0, `ROCm libraries 5.2.0 <https://rocblas.readthedocs.io/en/rocm-5.2.1/>`__, `uProf 3.6 <https://developer.amd.com/amd-uprof/>`__

How do I get to Quorra?
=========================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. 

To request an allocation on Instinct using slurm:

.. code::

    //Request an allocation of 1 hr, partition rg-gpu, and specify the node name for the server with -w
    salloc -t 1:00:00 -p rg-gpu -w instinct

MIG
---

Running jobs
------------

Once you have compiled your code, you can request a longer job to do
testing.

Useful training material
------------------------

TBD

Vendor-provided Documents and Resources
---------------------------------------
