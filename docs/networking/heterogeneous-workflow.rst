======================================
Heterogeneous Workflow with Bluefields
======================================

Working with Bluefields and host machines with differing architectures introduces development
peculiarities that must be dealt with.

If you want to develop an application that utilizes
both sets of hardware, you must maintain compatible dependencies and executables for each.
This document provides some tips to deal with common
problems.


Dependency Management
-----------------

With a heterogeneous software package, each compute node must have the correct set of dependencies
loaded and the correct application selected to run. These include but are not limited to,
MPI, compilers, user-provided libraries, and the application itself.

MPI and slurm have a few options to handle disparate dependencies.

MPI and Slurm
-------------

Heterogeneous Slurm Docs :
    - `Official <https://slurm.schedmd.com/heterogeneous_jobs.html>`__
    - `A little more helpful <https://apps.fz-juelich.de/jsc/hps/juwels/modular-jobs.html>`__

Here's a simple example Slurm batch command that runs on a single host node and a single Bluefiels:
TODO

Dependency Management
---------------------

Since each node now has varying dependencies, it's helpful to automate loading of certain libraries.
Below is a helpful `.bashrc` addition courtesy of Sara Karamati. It configures some environment
variables and the hpcx modules depending on the machine architecture. With this, the correct
version of these libraries is loaded for each hardware architecture.

.. code-block:: bash

    arch=$(uname -i)
    FILE=/tmp/hpcx

    if [ "$arch" == 'x86_64' ]; then
        ln -s /global/software/centos-8.x86_64/modules/gcc/8.3.1/hpcx/2.15.0/ /tmp/hpcx
        export PATH=/global/software/centos-8.x86_64/modules/gcc/8.3.1/hpcx/2.14.0/ucx/bin:$PATH
        export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:/global/software/centos-8.x86_64/modules/gcc/8.3.1/hpcx/2.14.0/ucx/lib:/global/software/centos-8.x86_64/modules/gcc/8.3.1/hpcx/2.14.0/ompi/lib/:$LD_LIBRARY_PATH
    elif [ "$arch" == 'aarch64' ]; then
        ln -s /global/software/rocky-9.aarch64/modules/gcc/11/hpcx/2.15 /tmp/hpcx
        export PATH=/global/software/rocky-9.aarch64/modules/gcc/11/hpcx/2.15/ucx/bin:/tmp/hpcx/ompi/tests/osu-micro-benchmarks-5.6.2:$PATH
        export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:/global/software/rocky-9.aarch64/modules/gcc/11/hpcx/2.15/ucx/lib:/global/software/rocky-9.aarch64/modules/gcc/11/hpcx/2.15.0/ompi/lib/:$LD_LIBRARY_PATH

    fi

    source /tmp/hpcx/hpcx-init.sh
    hpcx_load

To be added
-----------
- This page will be updated with information to show how the Slurm job runs with this bashrc.
