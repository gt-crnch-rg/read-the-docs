=============
PYNQ cluster
=============

.. figure:: ../../figures/images/pynq-z2-cluster.jpg
   :alt: PYNQ Z2 Cluster
   :scale: 10

Xilinx's Python or PYNQ framework has recently been extended from supporting just PYNQ-branded boards to full devices like the Zynq and Alveo platforms. This means that PYNQ can be used on the Rogues Gallery either with PYNQ branded boards or with specific Zynq or Alveo boards. 

PYNQ Cluster
--------------
The PYNQ cluster is a fully scheduled and remotely accessible PYNQ-Z2 cluster, which is part of the Rogues Gallery's educational outreach mission. As such they are on the `cc.gatech.edu` subnet, and they need to be accessed via the synestia2 VM with Slurm.

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
      
Accessing the PYNQ cluster
--------------------------
The most up-to-date documentation is currently on the CS3220 website. Eventually it will be updated and migrated to this page.

- To access the Synestia VMs see this link `<https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/access_vm_steps/access_vm_doc.md>`__.
- To access an FPGA from Synestia, please see this link `<https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/access_pynq_boards/updated_instructions.md>`__

PYNQ Resources
--------------
* `Alveo PYNQ Examples <https://github.com/Xilinx/Alveo-PYNQ>`_
* `PYNQ Tutorial - FCCM 2020 Workshop <https://pypi.org/project/pynq-fccm-2020/>`_
* `Pypi PYNQ tutorial <https://pypi.org/project/pynq-compute-labs/>`_
