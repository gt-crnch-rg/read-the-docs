============
oneAPI for Reconfigurable Computing
============

Intel has recently released beta versions of their oneAPI framework for programming CPUs, GPUs, and FPGAs. oneAPI or Data-parallel C++ (DPC++) is a variant of the SYCL language with added features to better support Intel platforms. Note that much of the DPC++ ecosystem is built on LLVM, so related tools like HipSYCL and Xilinx's SYCL support *may* be compatible with DPC++ code.

What tools are available?
----------------------------

oneAPI is available as a `base toolkit <https://software.intel.com/en-us/oneapi/base-kit>`_, which includes tools like vTune and the `Application Performance Snapshot Tool <https://software.intel.com/en-us/node/836966>`_, Intel Advisor, and a `DCPP Compatibility tool <https://software.intel.com/en-us/articles/release-notes-for-intel-dpcpp-compatibility-tool>`_ for migrating CUDA codes to DPC++.

There are also toolkits for `HPC <https://software.intel.com/en-us/oneapi/hpc-kit>`_, `Deep Learning Framework <https://software.intel.com/en-us/oneapi/dlfd-kit>`_, `FPGA <https://software.intel.com/en-us/oneapi/fpga>`_, and `OpenVino  <https://software.intel.com/en-us/openvino-toolkit>`_ that build on the base oneAPI toolkit.

What examples and resources are available?
----------------------------

* `DPC++ book <https://jamesreinders.com/dpcpp/>`_
* `oneAPI Programming Guide <https://software.intel.com/en-us/oneapi-programming-guide>`_
* `Intel Github Basekit oneAPI code samples <https://github.com/intel/basekit-code-samples>`_
* `Tech.Decoded webinars <https://techdecoded.intel.io>`_

How can I test out oneAPI?
----------------------------

There are several resources for using oneAPI both online and at Georgia Tech. The `OneAPI FPGA code samples tutorial <https://www.intel.com/content/www/us/en/developer/articles/code-sample/explore-dpcpp-through-intel-fpga-code-samples.html>`__ is a good place to start.



Online oneAPI Resources
~~~~~~~~~~~~~~~~~~~~~~
* `Docker containers <https://github.com/intel/oneapi-containers>`_ with the "base" toolkit
* `Intel DevCloud <https://intelsoftwaresites.secure.force.com/devcloud/oneapi>`_ - you can easily get a 3 month pass that can be extended by registering a project on the "Intel DevMesh". Once you sign up, you can `connect <https://devcloud.intel.com/oneapi/connect/>`_ either via an SSH terminal (using a provided SSH config script) or using a JupyterHub notebook interface. There are workshop files that can be copied to your home directory using the following command: `/data/oneapi_workshop/get_oneapi_workshop.sh`

Georgia Tech Resources
~~~~~~~~~~~~~~~~~~~~~~

We currently have several Cascade Lake servers and an `Arria 10 PAC FPGA <https://www.intel.com/content/www/us/en/programmable/products/boards_and_kits/dev-kits/altera/acceleration-card-arria-10-gx/overview.html>`_ on loan from Intel that can support the oneAPI toolkits. You can also use Docker containers locally and run in FPGA emulation mode (on CPU) to test functionality for an FPGA port.
