===========================
Using Slurm with RG Systems
===========================

See `this page <https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm-examples.html>`__ with examples of how to use Slurm to request jobs on the testbed!

What is Job Scheduling and Why Do We Use It?
--------------------------------------------
Job scheduling helps us to manage a limited number of novel resources with an active 
userbase while guaranteeing the resources you need to finish your job. While job scheduling
is currently most used for homogeneous cluster resources like PACE's `Phoenix cluster <https://docs.pace.gatech.edu/phoenix_cluster/gettingstarted_phnx/>`__
we have focused on using it for the Rogues Gallery to provide fair access to all users and to
help document how specific resources are utilized. 

We use `Slurm <https://slurm.schedmd.com/overview.html>`__ as our job scheduler and resource manager 
as it is widely used by large cluster installations including Cori and Perlmutter at NERSC, 
Frontera at TACC, and near-term systems like Frontier at ORNL. Since the Rogues Gallery has a large
diversity of resources, we have many different *workflows* depending on the novel architecture that
is targeted.

What Slurm queues are available?
--------------------------------

You can check the current status of all queues by using ``sinfo --federation`` on any RG node. The Pathfinder runs as a `"federated" Slurm cluster <https://slurm.schedmd.com/federation.html>`__ since it has a different host environment than the other RG nodes.

Slurm Partitions
----------------
.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Queue Partition
      - Time Limit
      - Nodes
      - Node List
      - Notes
    * - rg-pathfinder
      - No limit
      - 32
      - c0n[0-7],c1n[0-7],c2n[0-7],c3n[0-7]
      - Lucata Pathfinder system
    * - rg-arm-debug
      - 4 hours
      - 4
      - octavius[1-4]
      - Used to compile/profile code
    * - rg-arm-long
      - 12 hours
      - 16
      - octavius[1-16]
      - Used for longer running jobs      
    * - rg-gpu
      - 12 hours
      - 7
      - frozone[1-4],instinct,quorra[1-2]
      - Different types of GPU-focused nodes for classes and neuromorphic research
    * - rg-hpc
      - 12 hours
      - 3
      - flubber[8-10]
      - General HPC nodes      
    * - rg-intel-fpga-hw
      - 12 hours
      - 2
      - flubber[2-3]
      - Hosts Intel FPGAs
    * - rg-xilinx-fpga-hw
      - 12 hours
      - 2
      - flubber[1-3]
      - Hosts Xilinx FPGAs
    * - rg-smart-nic
      - 12 hours
      - 2
      - flubber[6-7]
      - SmartNIC nodes      
    * - notebook
      - 12 hours
      - 1
      - hawksbill
      - Used to run Jupyter notebooks for tutorials, data analysis    

How do I get started with Slurm on RG?
--------------------------------------
We suggest that you first check out the following Slurm "Quick Start" resources from LLNL
if you have not used a batch submission system before. Find them `here and below in the resources section <https://hpc.llnl.gov/banks-jobs/running-jobs/slurm-quick-start-guide>`__.

Then please check out our RG Slurm Examples page and the RG Workflows page for architecture of interest and specific commands to run for these systems.

- `RG Slurm Examples <https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm-examples.html>`__
- `RG Workflows <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-workflows.html>`__

Important Slurm Commands
~~~~~~~~~~~~~~~~~~~~~~~~

Please consider looking at `PACE's training information <https://docs.pace.gatech.edu/training/slurm-orientation/>`__ for Slurm as well.

- `sinfo <https://slurm.schedmd.com/sinfo.html>`__ - See status of queues and what is active/idle. 
- squeue - See the status of your jobs. You can also run ``squeue -u <username>`` to just list your jobs.
- scancel - Used with the ``JOBID`` reported by ``squeue`` to cancel a job.

Options to run jobs include the following commands:
- salloc - request resources from the Slurm scheduler and run a task when resources are ready
- sbatch - create a batch file for later execution of one or more programs
- srun - run parallel tasks across multiple processes. Called after salloc/sbatch.

Slurm General Resources
=======================

-  `Slurm Quickstart User Guide <https://slurm.schedmd.com/quickstart.html>`__
-  `LLNL Slurm User
   Manual <https://hpc.llnl.gov/banks-jobs/running-jobs/slurm-user-manual>`__
-  `LLNL Slurm QuickStart
   Guide <https://hpc.llnl.gov/banks-jobs/running-jobs/slurm-quick-start-guide>`__
-  `LLNL Slurm Commands
   Reference <https://hpc.llnl.gov/banks-jobs/running-jobs/slurm-commands>`__
-  `University of Maryland Torque versus Moab Guide
   Reference <https://hpcc.umd.edu/hpcc/help/slurm-vs-moab.html>`__
-  `Princeton Research Computing's Slurm learning resources <https://researchcomputing.princeton.edu/education/external-online-resources/slurm>`__
-  `Slurm Video Tutorials <https://slurm.schedmd.com/tutorials.html>`__
