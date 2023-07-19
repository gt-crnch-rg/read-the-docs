============
Intel vTune
============

VTune is Intel's profiling suite that used to be called VTune Amplifier but is now just called VTune Profiler. The VTune User Guide can be found `here <https://www.intel.com/content/www/us/en/docs/vtune-profiler/user-guide/2023-1/overview.html>`__.

Using VTune on CRNCH RG
-----------------------
VTune is available with the OneAPI tool installations, which can be loaded using modulefiles on most Intel systems within the testbed. 

.. code:: shell
  
  frozone1 ~]# module avail vtune
  -------------- /projects/tools/x86_64/rhel-8/intel-oneapi/2023.0/modulefiles ----------
  vtune/2023.0.0  vtune/latest
  frozone1 ~]# module load vtune/latest
  Loading vtune version 2023.0.0

While VTune is a GUI-based tool that can be run from a `Virtual Desktop session using Open OnDemand <https://gt-crnch-rg.readthedocs.io/en/main/general/open-on-demand.html>`__, it also has a command-line interface that can be used to perform detailed analysis of applications.

.. code:: shell
  


Support for FPGA Profiling
--------------------------

TBD

Support for iGPU Profiling
--------------------------
NEO is the graphics compute runtime for oneAPI Level Zero and for Intel graphics hardware architectures (HD Graphics, Xe). This open-source effort supports OpenCL computation on Intel CPUs with integrated GPU (iGPU) going back to Broadwell CPUs.

As part of the NEO runtime, a metrics discovery API (MDAPI) and user-mode library have been developed to allow user-level access to iGPU performance counters. Metrics that can be tracked are similar to ones reported by a standard VTune profiling run. A good comparison might be with VTune as the high-level tool like NVProf or Nsight and MDAPI as the lower-level API similar to NVIDIA's NVML.

- `Available GPU metrics with VTune or MDAPI <https://software.intel.com/content/www/us/en/develop/documentation/vtune-help/top/reference/gpu-metrics-reference.html>`__
- `Metrics Discovery API for iGPUs <https://github.com/intel/metrics-discovery>`__
- `Metrics Discovery library <https://github.com/intel/metrics-library>`__ - user mode helper library for MDAPI


Advanced Topics
---------------


To test that VTune is set up correctly, you can run the self checker to run a variety of profiling tests. This script will print out warnings for missing debug symbols, kernel drivers, and other limitations.

.. code:: shell

  $> module load vtune/latest
  $> vtune-self-checker.sh
  vtune-self-checker.sh           
  
  Intel(R) VTune(TM) Profiler Self Check Utility  
  Copyright (C) 2009 Intel Corporation. All rights reserved.
  Build Number: 624757           
  
  HW event-based analysis (counting mode) (Perf) 
  Example of analysis types: Performance Snapshot
      Collection: Ok               
      Finalization: Ok...           
      Report: Ok
    
  ...
      
  The system is ready for the following analyses:
  * Performance Snapshot
  * Hotspots and Threading with user-mode sampling
  * Hotspots with HW event-based sampling, HPC Performance Characterization, etc.
  * Microarchitecture Exploration
  * Memory Access
  * Hotspots with HW event-based sampling and call stacks

VTune Sampler Drivers for Linux Targets
~~~~~~~~~~~~~~~~~~~~                                                                                               
The `Sampling Drivers <https://software.intel.com/content/www/us/en/develop/documentation/vtune-help/top/installation/sep-driver.html>`__ are not strictly required as VTune will use the Linux Perf tools to query counters. However, if the sampling drivers are installed they provide driver-based access to Intel performance counters and they can be limited to specific user groups.
