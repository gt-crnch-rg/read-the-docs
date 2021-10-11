============
Octavius - A64FX Testbed
============

*Last Updated: 10/11/21*

Current Status
==============

Octavius has been updated with the latest Cray Programming Environment
and Lmod support.

BUGS / Feature Requests
-----------------------

-  No topology file for Slurm

System Specifications and Tools
===============================

+-------------+-------------+-------------+-------------+-------------+
| Queues      | CPU         | Memory (GB) | Networking  | Storage     |
|             |             |             |             | (GB)        |
+=============+=============+=============+=============+=============+
| rg-arm-debu | `A64FX <htt | 32 HBM2e    | EDR IB      | 330         |
| g,          | ps://en.wik |             |             |             |
| rg-arm-shor | ipedia.org/ |             |             |             |
| t,          | wiki/Fujits |             |             |             |
| rg-arm-long | u_A64FX>`__ |             |             |             |
+-------------+-------------+-------------+-------------+-------------+

Octavius is a 16 node cluster, where each node contains one CPU with
integrated HBM memory, a small amount of SSD storage (340 GB per node),
and a PCIe3 attached EDR InfiniBand card. The specific chassis for each
node is the HPE Apollo 80, previously referred to as the Cray NSP-1 or
"Baymax" platform. While this system is similar to standard Fujitsu
servers, the main difference between these nodes and the Fugaku
supercomputer is that Fugaku also includes a 6D Torus network that is
tied into each CPU core.

Current Tools
-------------

Note that the Cray compilers are likely to have the best support for
SVE, although GCC 10 is supposed to add more low-level support geared
towards A64FX.

**Compilers**: CCE 12.0.1 (updated to July 2021 version), Clang 10,
GNU8.3, 9, MVAPICH2, OpenMPI4

**Arm tools**: Arm 21.0 and Forge/Map 21.0

**Debuggers**: gdb4hpc 4.7.2, 4.8.1; valgrind4hpc 2.7.1, 2.8.1

**Profilers**: PAPI 6.0, perftools 20.10.0

How do I get to Octavius?
=========================

As with most CRNCH resources, you need to either log in via the gateway
node, rg-login, or access the system from the campus network via VPN or
an on-campus connection. Octavius-login is an x86 VM that can be used to
submit Slurm jobs for interactive compilation, short, and longer runs.

The figure below shows the basic outline of all the resources that you
might interact with on the Arm cluster. The "login" VM for octavius
provides some basic functionality and scheduling capabilities. Your
network shared home is available on all nodes listed in this figure,
although long compilations and tar/untar operations are suggested to use
local scratch space on VMs or nodes.

The Mellanox SB7890 provides an InfiniBand connection to all the nodes
within this cluster (as well as to flubber3), and

.. figure:: https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/figures/armhpc/rg-octavius-overview-2021.png
   :alt: Octavius overview

Compiling for the A64FX
-----------------------

Our installation includes a license for the Cray PE toolset, so you are
encouraged to use this framework to compile your code. Clang and GCC are
also currently available for compilation on the compute nodes.

To compile, you must request a short job (arm-debug queue) since we
can't currently cross-compile on the x86 login node, octavius-login. By
default, these jobs last an hour and are meant to be used to do
compilation and basic testing.

For example:

.. code:: 

   [octavius-login]$ sinfo
   PARTITION     AVAIL  TIMELIMIT  NODES  STATE NODELIST
   rg-arm-debug*    up 2-12:00:00      4   idle octavius[1-4]
   rg-arm-short     up 5-00:00:00     16   idle octavius[1-16]
   rg-arm-long      up 15-00:00:0     16   idle octavius[1-16]

   #Request an allocation for one hour
   [octavius-login]$ salloc -q rg-arm-debug -t 01:00:00 -N 1 -n 48 --exclusive
   salloc: Granted job allocation 6

   Check that your job has launched.
   [octavius-login]$ squeue
   JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
   6 rg-arm-de     bash  gburdell  R       0:21      1 octavius1

   #Launch an interactive job, run your compilation and testing, and then exit the node
   #Note that the -l flag indicates that the interactive job should load local environment scripts and is needed!
   [octavius-login]$ srun --pty bash -l
   gburdell@octavius1:~$ <run_compilation>
   gburdell@octavius1:~$ exit

   #Cancel your job if needed (ie, if you have just used a few minutes)
   [octavius-login]$ scancel 6
   [octavius-login]:~$$ salloc: Job allocation 6 has been revoked.

To request a specific node you can use the ``-w <nodename>`` flag

.. code:: 

   [octavius-login]$ salloc -q rg-arm-debug -t 01:00:00 -N 1 -n 48 --exclusive -w octavius2
   [octavius-login]$ squeue
                JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
                  203 rg-arm-de     bash  gburdell  R       0:04      1 octavius2
   //srun and execute job

Using modules
-------------

By default octavius uses LMOD. Use the standard ``module avail`` and
``module load`` commands.

Running jobs
------------

Once you have compiled your code, you can request a longer job to do
testing.

.. code:: 

   # Clone the Slurm examples from our internal wiki
   $ git clone https://github.gatech.edu/crnch-rg/rogues-docs.git
   $ cd slurm_examples
   $ sbatch octavius_cpe_mvapich.sbatch
   Submitted batch job 539

Requesting new packages or assistance
-------------------------------------

Please just `submit a
ticket <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/RG-Mailing-Lists-and-Requesting-Help>`__
or ask on our Teams group in the "help-request" channel. We also have a
general arm-hpc discussion channel on our Teams group.

Useful training material
------------------------

The recent `SVE tutorial <https://jlinford.github.io/sc20-hackathon/>`__
by Arm is probably the best source for learning how to use SVE with
A64FX. You can also ask questions in the hackathon channel on the [Arm
HPC User's Group]
Slack(\ https://join.slack.com/t/a-hug/shared_invite/zt-it2g9rlv-aQfZsyV7r3T8jEDDSQKFHg).

`2021 SVE Hackathon for
Ookami <https://gitlab.com/arm-hpc/training/arm-sve-tools>`__

`SVE Hackathon
repo <https://gitlab.com/arm-hpc/training/arm-sve-tools>`__ -also
available under ``/tools/training/arm-hpc`` on RG nodes

Vendor-provided Documents and Resources
---------------------------------------

-  `Cray PE Programming Guide
   (10/20) <https://pubs.cray.com/bundle/HPE_Cray_Programming_Environment_User_Guide_For_Apollo_80_ARM_2009_S8011_Apollo80/page/About_Cray_Programming_Environment_User_Guide.html#>`__
   - a copy of this is also included in the rogues-docs repo.

-  `Arm A64FX Architecture
   Manual <https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitecture_Manual_en_1.2.pdf>`__

-  `Arm wiki for optimizing
   HPL <https://gitlab.com/arm-hpc/packages/-/wikis/packages/hpl>`__

-  `Cray Programming Environment Workshop Slides from
   NERSC <https://www.nersc.gov/assets/Uploads/180614+CrayPE+Workshop-NERSC.pdf>`__

