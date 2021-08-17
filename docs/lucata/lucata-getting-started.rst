*Last updated: 8/17/2021*

Lucata Pathfinder Getting Started
============

The Rogues Gallery hosts two systems from Lucata (formerly known as Emu Technology): The Gen1 Emu Chick, an 8-node desktop-style system, and the Lucata Pathfinder, a two-chassis system with 16 nodes and 24 cores in each node for a total of 384 cores. 


Using the EMU simulation and compiler tools
===========================================

The current toolset, documentation, and examples are available on the
login and emu-dev VMs under ``/usr/local/emu/`` for the current
most-stable version. Other versions are available under ``/tools/emu``.
Eric Hein has also written a nice README.

| rg-login.crnch.gatech.edu: primary login VM for Rogue’s Gallery. Use
  for **Emu compilation and simulation**
| rg-emu-dev.crnch.gatech.edu: VM for **Emu compilation and simulation**
| karrawingi-login.crnch.gatech.edu (emuscb): The main EMU node, used
  for login and transferring files to a specific node/set of nodes.
  **NOTE:** You cannot run any code on this node and will need to copy
  your code to n0-n7 on the Emu machine. 

Typical usage model:

1. Compile and simulate code on rg-emu-dev. Do debugging and
   initial verification here but note that simulation is slow!

2. Copy your .mwx file and any inputs to karrawingi-login and then to a
   specific Emu node (n0-n7).

3. Run your code natively on n0 (multinode) or any of n0-n7
   (single-node).


Tutorials and Training
=============================

We have placed some examples for using the Emu as well as related tools
in a Github repo at https://github.gatech.edu/crnch-rg/emu-common.
Please feel free to branch and fork as makes sense for your research.

| Eric Hein has also contributed a nice micro-benchmark that uses serial
  and recursive spawn. 
| `Micro
  benchmark <https://github.gatech.edu/crnch-rg/emu-microbench>`__

Where do I get more assistance?
===============================

-  Emu has also started an official `community
   forum <http://www.emutechnology.com/community/>`__.

I think that I have found a bug to report to Emu!
=================================================

First of all, please try to create a minimum working example (MWE) that
replicates the problem you are seeing with detailed output and limited
extraneous code. Right now, we have a few people who can post issues
with the emusolutions tracker, so it might be best to go through them:
Eric Hein, Jason Riedy, Jeff Young can all post to the tracker. Please
also feel free to discuss via the mailing list once you have an MWE to
illustrate the problem.

Other resources:
================

-  CilkPlus can also be run on CPU-based clusters. For more information
   on general CilkPlus check out the official
   `website <https://www.cilkplus.org/>`__ and other `Cilk
   tutorials <http://faculty.knox.edu/dbunde/teaching/cilk/>`__.

-  See our Kokkos
   `branch <https://github.com/jyoung3131/kokkos/tree/cilkplus>`__
   focused on CilkPlus and eventually on an Emu backend. For more
   information on Kokkos, check out their
   `website <https://github.com/kokkos>`__,
   `tutorials <https://github.com/kokkos/kokkos-tutorials>`__, and other
   documentation.
