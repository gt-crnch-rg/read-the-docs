============
Intel OneAPI for Reconfigurable Computing
============

Intel has recently released their oneAPI framework for programming CPUs, GPUs, and FPGAs. oneAPI or Data-parallel C++ (DPC++) is a variant of the SYCL language with added features to better support Intel platforms. Note that much of the DPC++ ecosystem is built on LLVM, so related tools like HipSYCL and Xilinx's SYCL support *may* be compatible with DPC++ code (see `Xilinx's triSYCL for an example <https://github.com/triSYCL/sycl/blob/sycl/unified/next/sycl/doc/GettingStartedXilinxFPGA.md>`__).

How can I test out oneAPI for FPGAs?
----------------------------

There are several resources for using oneAPI both online and at Georgia Tech mentioned below. In general we suggest the following steps:

1) Get an account for the Rogues Gallery testbed or Intel's DevCloud.
2) Learn the basics of SYCL/One API via a tutorial or video series (see resources below).
3) Work through Tier 1 and 2 of the `OneAPI FPGA code samples tutorial <https://www.intel.com/content/www/us/en/developer/articles/code-sample/explore-dpcpp-through-intel-fpga-code-samples.html>`__. Learning about the basics up to loop unrolling is highly recommended.
4) Test out your own code, using the `Intel FPGA optimization guide <https://www.intel.com/content/www/us/en/docs/oneapi-fpga-add-on/optimization-guide/2023-1/overview.html>`__ as a reference!

Acknowledgments
---------------
We appreciate the donation of software licenses from Intel's University Program.

Intel FPGA Hardware
--------------------

Currently, the Rogues Gallery hosts the following Intel FPGA hardware.

.. list-table:: **Server-based Hardware**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - FPGA Board
      - FPGA Chip
      - Memory
      - Hosting Machine
      - Notes
    * - `Bittware IA-840F <https://www.bittware.com/fpga/ia-840f/>`__
      - AGF027
      - 128 GB DDR4
      - flubber10
      - Currently being set up!
    * - `Stratix 10 PAC <https://www.intel.com/content/www/us/en/products/sku/193921/intel-fpga-pac-d5005/specifications.html>`__
      - GX2800
      - 32 GB DDR4
      - flubber3
      - 
      
    * -  `Bittware 520N <https://www.bittware.com/fpga/520n/>`__
      - GX2800
      - 16 GB DDR4
      - flubber2
      -
    * -  `Bittware 520N-MX <https://www.bittware.com/fpga/520n-mx/>`__
      - MX2100
      - 16 GB HBM
      - flubber3
      -
    * - `Intel Arria10 PAC <https://www.intel.com/content/www/us/en/programmable/products/boards_and_kits/dev-kits/altera/acceleration-card-arria-10-gx/overview.html>`__
      - GX1150
      - 8GB DDR4
      - flubber2
      -
    * - `Bittware 385-A <https://www.bittware.com/fpga/385a/>`__
      - GX1150
      - 8 GB DDR3
      - flubber2
      - Shared via the GTRI Cipher lab
    * - `Bittware 385-SoC <https://www.bittware.com/fpga/385a-soc/>`__
      - SX660 (Arm+GX1150)
      - 6 GB DDR4
      - flubber3
      - Shared via the GTRI CIPHER lab


.. list-table:: **Development Board Hardware**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - FPGA Board
      - FPGA Chip
      - Memory
      - Hosting Machine
      - Notes
    * - `Intel Arria10 DevKit <https://www.intel.com/content/www/us/en/programmable/products/boards_and_kits/dev-kits/altera/kit-a10-gx-fpga.html>`__
      - GX1150
      - 4 GB DDR3 
      - NA
      - Available upon request

What tools are available on RG?
~~~~~~~~~~~~~~~~~~~~~~~~~~~

OneAPI is available as a `base toolkit <https://software.intel.com/en-us/oneapi/base-kit>`_, which includes tools like vTune and the `Application Performance Snapshot Tool <https://software.intel.com/en-us/node/836966>`_, Intel Advisor, and a `DCPP Compatibility tool <https://software.intel.com/en-us/articles/release-notes-for-intel-dpcpp-compatibility-tool>`_ for migrating CUDA codes to DPC++.

There are also toolkits for `HPC <https://software.intel.com/en-us/oneapi/hpc-kit>`_, `Deep Learning Framework <https://software.intel.com/en-us/oneapi/dlfd-kit>`_, `FPGA <https://software.intel.com/en-us/oneapi/fpga>`_, and `OpenVino  <https://software.intel.com/en-us/openvino-toolkit>`_ that build on the base oneAPI toolkit.

`Intel's Open Fabric Stack <https://www.intel.com/content/www/us/en/products/details/fpga/platforms/open-fpga-stack.html>`__ is supported for specific Intel-branded boards like the Arria 10 and Stratix 10 PAC cards in the Flubber nodes. 

Useful Documents
~~~~~~~~~~~~~~~~~~~~~~~~~~~
* `oneAPI Programming Guide <https://software.intel.com/en-us/oneapi-programming-guide>`_
* `Intel FPGA Optimization Guide <https://www.intel.com/content/www/us/en/docs/oneapi-fpga-add-on/optimization-guide/2023-1/overview.html>`__
* `DPC++ book <https://jamesreinders.com/dpcpp/>`_
* `Intel Github Basekit oneAPI code samples <https://github.com/intel/basekit-code-samples>`_
* `Tech.Decoded webinars <https://techdecoded.intel.io>`_

OneAPI Related Videos and Webinars
~~~~~~~~~~~~~~~~~~~~~~~~~~~
* `OneAPI Basics Training Series <https://www.youtube.com/watch?v=vMZNYP4e2xo&list=PLg-UKERBljNxsCltpcXU_Haz9xQSCN_SB>`__ - a General OneAPI series
* `Introduction to Intel's Open FPGA Stack <https://www.youtube.com/watch?v=2_8BWg0V3ic>`__ - an introduction to the Intel OFS. 
* `Using FPGAs with the Intel oneAPI Toolkits <https://www.youtube.com/watch?v=SU9S-PG_W9A>`__
* `Introduction to Optimizing FPGAs with the Intel OneAPI Toolkit <https://www.youtube.com/watch?v=mvvmKsAKhqg>`__

Other Online OneAPI Resources
~~~~~~~~~~~~~~~~~~~~~~
* `Docker containers <https://github.com/intel/oneapi-containers>`_ with the "base" toolkit
* `Intel DevCloud <https://intelsoftwaresites.secure.force.com/devcloud/oneapi>`_ - you can easily get a 3 month pass that can be extended by registering a project on the "Intel DevMesh". Once you sign up, you can `connect <https://devcloud.intel.com/oneapi/connect/>`_ either via an SSH terminal (using a provided SSH config script) or using a JupyterHub notebook interface. There are workshop files that can be copied to your home directory using the following command: `/data/oneapi_workshop/get_oneapi_workshop.sh`
