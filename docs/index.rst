
CRNCH Rogues Gallery Documentation
==================================

The Rogues Gallery is a new concept focused on developing our understanding of next-generation hardware with a focus on unorthodox and uncommon technologies.  This project, initiated by Georgia Tech's Center for Research into Novel Computing Hierarchies (CRNCH), will acquire new and unique hardware (ie, the aforementioned "rogues") from vendors, research labs, and startups and make this hardware available to students, faculty, and industry collaborators within a managed data center environment. By exposing students and researchers to this set of unique hardware, we hope to foster cross-cutting discussions about hardware designs that will drive future performance improvements in computing long after the Moore's Law era of "cheap transistors" ends.  

To see what hardware the Rogues Gallery currently includes, please see our `hosted hardware page <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-hardware.html>`__. For more information on the initial Rogues Gallery vision, please see our recent presentation at the 2021 CRNCH Summit [`Slides <https://github.com/gt-crnch/crnch-summit-2021/blob/main/presenter_slides/Thursday_01_28_21/105--Rogues-Gallery-Update-Jeff-Young-CRNCH-Summit-2021.pdf>`__] [`Talk] <https://mediaspace.gatech.edu/media/Jeff%20Young%20-%20Rogues%20Gallery%20-%20CRNCH%20Summit%202021/1_lqlgr0jj>`__. 

For updated status on the testbed please see our Spring 2022 talk [`Slides <https://github.com/gt-crnch-rg/rg-publications/blob/main/presentations/2022/jyoung_crnch_summit_rogues_gallery_updates_03_2022.pdf>`__]

**NSF Acknowledgment**: The Rogues Gallery testbed is primarily supported by the National Science Foundation (NSF) under NSF Award Number #2016701. Any opinions, findings and conclusions, or recommendations expressed in this documentation are those of the author(s), and do not necessarily reflect those of the NSF.


.. toctree::
   :caption: General Topics
   :maxdepth: 1
   :hidden:

   general/rogues-gallery-overview
   general/mailing-list-help-tickets
   general/submit-a-ticket
   general/rg-getting-started
   general/rg-hardware
   general/rg-software
   general/rg-filesystems
   general/contributing
   general/testbed-release-notes
   authors.rst

.. toctree::
   :caption: RG Getting Started Topics
   :maxdepth: 2
   :hidden:
  
   general/using-slurm
   general/open-on-demand
   general/visual-studio-code
   general/python-environments
   general/using-jupyter-notebooks
   containers/containers

.. toctree::
   :caption: RG Advanced Topics
   :maxdepth: 2
   :hidden:
   
   general/using-scrontab-slurm
   general/using-gui-with-vnc
   general/ci-runners

.. toctree::
   :caption: RG Workflows
   :maxdepth: 2
   :hidden:  
   
   general/rg-workflows
   tools/profilers

.. toctree::
   :caption: Novel HPC
   :maxdepth: 2
   :hidden:
   :glob:
   
   gpu/instinct-mi210.rst
   gpu/quorra-ampere-bf
   novel-hpc/violet-spr-cxl.rst
   novel-hpc/p10-denali.rst
   arm/octavius-a64fx-testbed.rst
   arm/kingpin-nvidia-devkit.rst
  
.. toctree::
   :caption: Lucata Pathfinder
   :maxdepth: 2
   :hidden:
   :glob:

   lucata/lucata-getting-started
   lucata/lucata-pathfinder-execution
   lucata/lucata-faq

.. toctree::
   :caption: Neuromorphic Computing
   :maxdepth: 2
   :hidden:
   :glob:

   neuromorphic/rudi-jetson-dev-boards.rst
   neuromorphic/nvidia-jetpack-pytorch.rst
   neuromorphic/tensorflow-getting-started.md

.. toctree::
   :caption: Novel Networking
   :maxdepth: 2
   :hidden:
   :glob:
   
   networking/novel-networking-getting-started.rst
   networking/bluefield-dpu.rst
   networking/heterogeneous-workflow.rst

.. toctree::
   :caption: Quantum Computing
   :maxdepth: 2
   :hidden:
   :glob:
   
   quantum/cuquantum.rst

.. toctree::
   :caption: ModSim and Chip Design
   :maxdepth: 2
   :hidden:
   :glob:

   reconfig/chisel/firesim-chipyard

.. toctree::
   :caption: Reconfigurable Computing
   :maxdepth: 2
   :hidden:
   :glob:

   reconfig/xilinx/xilinx-getting-started
   reconfig/xilinx/xilinx-vivado-flow
   reconfig/xilinx/pynq-cluster
   reconfig/xilinx/xilinx-smart-ssd
   reconfig/vortex/vortex-riscv-gpgpu
   reconfig/xilinx/xilinx-ml-tools
   reconfig/intel/oneapi-fpga-getting-started
   reconfig/intel/oneapi-fpga-crnch-workflow
   reconfig/fpga_power_measurement

.. toctree::
   :caption: RISC-V
   :maxdepth: 2
   :hidden:
   :glob:
   
   riscv/rg-riscv-hardware.rst
   reconfig/vortex/vortex-riscv-gpgpu.rst

.. toctree::
   :caption: Techfee Systems
   :maxdepth: 2
   :hidden:
   :glob:
   
   techfee/frozone-omnipath.rst
   techfee/hopper.rst
   techfee/dash-spr-max-smartnic.rst
   
.. toctree::
   :caption: Miscellaneous
   :maxdepth: 2
   :hidden:
   :glob:

   measurements/power_monitoring
   
.. toctree::
   :caption: Related Work
   :maxdepth: 1
   :hidden:


.. toctree::
   :caption: Educational Resources
   :maxdepth: 1
   :hidden:

   resources/rg-tutorials
   resources/near-memory-resources
   resources/graphblas-resources
   resources/neuromorphic-computing-resources
   resources/quantum-computing-resources
   resources/reconfigurable-computing-resources
   resources/related-testbeds.rst
