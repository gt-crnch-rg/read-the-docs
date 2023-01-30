=============
PYNQ cluster
=============

.. image:: https://github.com/gt-crnch-rg/read-the-docs/blob/231df79ad9e70a0dbcfedad88a5b22b0681b7ea3/docs/figures/images/pynq-z2-cluster.jpg
   :alt: PYNQ Z2 Cluster
   :scale: 50

Xilinx's Python or PYNQ framework has recently been extended from supporting just PYNQ-branded boards to full devices like the Zynq and Alveo platforms. This means that PYNQ can be used on the Rogues Gallery either with PYNQ branded boards or with specific Zynq or Alveo boards. 

PYNQ Cluster
--------------
The PYNQ cluster is a fully scheduled and remotely accessible PYNQ-Z2 cluster, which is part of the Rogues Gallery's educational outreach mission.

.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Resource
      - CPU
      - Memory (GB)
      - FPGA Fabric
      - Software and Features
    * - pynq-z2-<1-40>
      - 2 core, Arm A9
      - 0.5
      - 85K logic cells
      - ZYNQ XC7Z020-1CLG400C (7000 series)
    * - synestia<1-18>
      - 4 core, E312xx
      - 12
      - NA
      - Ubuntu 20.04 VM for FPGA tools

PYNQ Resources
--------------
* `Alveo PYNQ Examples <https://github.com/Xilinx/Alveo-PYNQ>`_
* `PYNQ Tutorial - FCCM 2020 Workshop <https://pypi.org/project/pynq-fccm-2020/>`_
* `Pypi PYNQ tutorial <https://pypi.org/project/pynq-compute-labs/>`_
