Rogues Gallery Workflows
========================

*This page is currently a work in progress!*

Novel and post-Moore architectures typically have a specific workflow
that incorporate some aspect of simulation or "emulation" before running
on actual hardware. In a sense, this is because novel architectures are
typically challenging to program or have some beta features that may
crash when running a full program.

This page provides a guide for the general "suggested" workflows to be
productive on the Rogues Gallery. Most of these workflows incorporate
the usage of our Slurm job scheduler to request and use physical
resources like servers and FPGAs.

Arm HPC
-------

Reconfigurable - Xilinx
-----------------------

Reconfigurable - Intel
----------------------

Bluefield Networking
--------------------

Lucata Pathfinder
-----------------

.. figure:: ../figures/lucata/lucata_workflow_diagram.png
   :alt: Rogues Gallery Hardware

When getting started, we highly recommend checking out the `Lucata Pathfinder Programming Manual <https://github.gatech.edu/crnch-rg/rg-lucata-pathfinder/blob/main/docs/pathfinder/Lucata-Pathfinder-Programming-Guide-v2.0.0-2202-tools.pdf>`__ (*requires GT Github login*) and read through Chapters 1,2,3, 5.1, 6, and 7. This will give you a basic understanding of the Cilk-based workflow and Lucata-specific APIs and tools. 

As shown in the figure above, the suggested Lucata workflow combines 1) x86 functionality testing, 2) simulation of code on a VM, 3) execution on a single node of the Pathfinder system, and 4) execution on multiple nodes and chassis.

1. Compile your code on rg-emud-dev using <memoryweb.h>  and emu-cc.sh to target x86 execution. This will run the Cilk code and emulate any data allocations specified by the Lucata APIs.
2. Simulate code on rg-emu-dev. Do debugging and initial verification here but note that simulation is slow! If you need to use a machine with more memory you can use hawksbill.crnch.gatech.edu
3. Profile your code with the simulator for small input sets.
4. Make a reservation on the Google Calendar for the Pathfinder to run jobs. We also use our Slack channel to reserve time on the Pathfinder 
5. Run your job on a single Pathfinder node (**SN<0-7>**. Verify its correctness.
6. Run your job on a single Pathfinder chassis (8 nodes PF<0-1>).
7. Run your job on multiple Pathfinder chassis (2 chassis).

Neuromorphic 
-------------

Quantum
-------
