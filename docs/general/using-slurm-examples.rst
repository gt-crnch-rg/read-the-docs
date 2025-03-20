Using Slurm Examples
====================

This page documents some common operations that you might use with Slurm on the Rogues Gallery testbed. 

If you have not checked out the main Slurm page with the queues and links to other training, `please read that page first <https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm.html>`__.


Current Slurm Status
--------------------
Right now we mostly do not support the usage of the account flag ``-A <GTusername``.

Checking on Slurm Nodes and Features
------------------------------------

You can use commands like ``sinfo`` to report different node states and features.

Slurm Interactive Jobs
----------------------

On the Rogues Gallery testbed cluster, interactive jobs can be run with Slurm for you to test out debug your code. This is especially important for heterogeneous resources like Arm clusters. 

Here is an example allocating one node (octavius1) on the A64FX cluster to the "debug" queue for 1 hour using ``salloc``:

.. code:: shell

   $ salloc -p rg-nextgen-hpc --nodes=1 --ntasks-per-node=1 --nodelist octavius1 --time=01:00:00
     ...
     salloc: Nodes octavius1 are ready for job 
     gburdell@octavius1:~$

Note that for the "account" parameter for ``salloc`` that you should use
your GT user account for the Newell cluster. Also note that after
running ``salloc``, you should see output confirming job allocation.

You can verify that the resources have been allocated using the
``squeue``:

.. code:: shell

   $ squeue
                JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
                  382     debug interact gburdell3  R       0:04      1 octavius1

Note that on some nodes running ``salloc`` may not automatically give you an interactive shell. In this case, please connect to your job using the JOBID.

.. code:: shell

   $ salloc --jobid=<JOB_ID_ALLOCATED> --pty bash -i

Typically you do not need to include the "jobid" parameter for ``srun`` after using ``salloc`` but is included here for illustration.

Interactive jobs can also be run with Slurm using ``srun`` command:

.. code:: shell

   $ srun -p rg-dev  --nodes=1 --ntasks-per-node=1 --time=01:00:00 --pty bash -i 
     ...
     gburdell@hawksbill:~$

For more information on ``salloc``, please go here: `Slurm
salloc <https://slurm.schedmd.com/salloc.html>`__.

For more information on ``srun``, please go here: `Slurm
srun <https://slurm.schedmd.com/srun.html>`__.


Querying the State of Your Job
------------------------------

TBD: Using scontrol to look at the state of the node you allocated and also the state of your job.

.. code:: shell

   # scontrol show node <nodename>
   $ scontrol show node violet2

Slurm Batch Jobs
----------------------

Please see this page for more information and examples on Slurm batch jobs.

Other RG-specific Slurm example commands
-------------------------------------------

Request an interactive job on a specific node

Request exclusive access on a node (use primarily for benchmarking, NOT for debugging)

Request a GPU using the Slurm "feature" flag (not any specific node)

Request a development VM (but no specific VM)

.. code:: shell

   $ salloc


Common Slurm Issues
-------------------

My GPU doesn't show up under my allocated job!
- Make sure that you are using the right flags to request a node. Typically you need to add `-G <num_gpus` to your salloc/sbatch command to get a GPU allocated.

My job is only running on one core / has too little memory!

My MPI job crashes when running with Slurm sbatch but runs in an interactive session with ssh



