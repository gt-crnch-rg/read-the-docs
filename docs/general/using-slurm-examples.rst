Using Slurm Examples
====================

This page documents some common operations that you might use with Slurm on the Rogues Gallery testbed. 

If you have not checked out the main Slurm page with the queues and links to other training, `please read that page first <https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm.html>`__.


Current Slurm Status
--------------------
Right now we mostly do not support the usage of the account flag ``-A <GTusername``.

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

Slurm Batch Run Job
-------------------

Batch jobs can also be run with Slurm on the Rogues Gallery testbed.

Here is a simple example that you can run on the quorra cluster that
runs the command ``hostname`` and outputs it to a file. Create a text
file named "batch-job-example.batch" with the following content:

.. code:: shell

   #!/bin/bash
   # Partition for the job:
   #SBATCH -p debug
   # Multithreaded (SMP) job: must run on one node
   #SBATCH --nodes=1
   # The name of the job:
   #SBATCH --job-name="batch-job-example"
   # Maximum number of tasks/CPU cores used by the job:
   #SBATCH --ntasks=1
   #SBATCH --cpus-per-task=8
   # The amount of memory in megabytes per process in the job:
   #SBATCH --mem=32768
   # The maximum running time of the job in days-hours:mins:sec
   #SBATCH --time=0-1:0:00
   #SBATCH -o batch-job-example-output-%j

   # Run hostname command on the allocated node
   hostname

Then run the example with ``sbatch``:

.. code:: shell

   $ sbatch batch-job-example.batch
   Submitted batch job 383

This should generate an output file named "batch-job-example-output-383"
that should be output in the same location as your batch file. For this
example, the output should be the following:

.. code:: shell

   $ more batch-job-example-output-383
   quorra1

For more information on ``sbatch``, please go here: `Slurm sbatch <https://slurm.schedmd.com/sbatch.html>`__.

Slurm Batch Run Job with MPI
----------------------------

Batch run jobs using MPI (Message Passing Interface) can also be run
with Slurm on the Rogues Gallery testbed.

Here is a simple example using `Open MPI <https://www.open-mpi.org/>`__
that you can run on the Newell cluster that compiles and runs code for a simple MPI "hello world" program.

First, create a file or download the C code from here:
`mpi-hello-world.c <https://github.com/mpitutorial/mpitutorial/blob/gh-pages/tutorials/mpi-hello-world/code/mpi_hello_world.c>`__.
The code is also included here:

.. code:: c

   #include <mpi.h>
   #include <stdio.h>

   int main(int argc, char** argv) {
     // Initialize the MPI environment. The two arguments to MPI Init are not
     // currently used by MPI implementations, but are there in case future
     // implementations might need the arguments.
     MPI_Init(NULL, NULL);

     // Get the number of processes
     int world_size;
     MPI_Comm_size(MPI_COMM_WORLD, &world_size);

     // Get the rank of the process
     int world_rank;
     MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

     // Get the name of the processor
     char processor_name[MPI_MAX_PROCESSOR_NAME];
     int name_len;
     MPI_Get_processor_name(processor_name, &name_len);

     // Print off a hello world message
     printf("Hello world from processor %s, rank %d out of %d processors\n",
            processor_name, world_rank, world_size);

     // Finalize the MPI environment. No more MPI calls can be made after this
     MPI_Finalize();
   }

Create a text file named "mpi-batch-job-example.batch" with the
following content:

.. code:: shell

   #!/bin/bash

   # Partition for the job:
   #SBATCH -p debug
   # Multithreaded (SMP) job: must run on one node
   #SBATCH --nodes=2
   #SBATCH --nodelist=quorra1,quorra2
   # The name of the job:
   #SBATCH --job-name="mpi-batch-job-example"
   # Maximum number of tasks/CPU cores used by the job:
   #SBATCH --ntasks=2
   #SBATCH --cpus-per-task=8
   # The amount of memory in megabytes per process in the job:
   #SBATCH --mem=32768
   # The maximum running time of the job in days-hours:mins:sec
   #SBATCH --time=0-1:0:00
   #SBATCH -o mpi-batch-job-example-output-%j

   # Source .bashrc file
   source ~/.bashrc

   # Clear modules and load OpenMPI (4.4.1) module
   module purge
   module load openmpi/4.4.1

   # Run the mpi-hello-world example from mpi-batch-job-examples directory
   cd $HOME/mpi-batch-job-examples
   mpicc mpi-hello-world.c -o mpi-hello-world
   mpirun mpi-hello-world

Note that the 2 nodes used in the example (quorra1,quorra2) are
specified in the batch file using the "nodelist" parameter.

Also note that Open MPI (version 4.4.1) is loaded using ``module`` in
this example.

Then run the MPI example with ``sbatch``:

.. code:: shell

   $ sbatch batch-job-example.batch
   Submitted batch job 384

This should generate an output file named "batch-job-example-output-384"
that should be output in the same location as your batch file - here in
the mpi-batch-job-examples directory. For this example, the output
should be the following:

.. code:: shell

   $ more mpi-batch-job-example-output-384
   Hello world from processor quorra1.cc.gatech.edu, rank 0 out of 2 processors
   Hello world from processor quorra2.cc.gatech.edu, rank 1 out of 2 processors

For more information on Open MPI, please go here: `Open MPI <https://www.open-mpi.org/>`__

Other RG-specific Slurm example commands
-------------------------------------------

Request an interactive job on a specific node



Request exclusive access on a node (use primarily for benchmarking, NOT for debugging)

Request a GPU (but not any specific node)

Request a development VM (but no specific VM)




Common Slurm Issues
-------------------

My GPU doesn't show up under 

My job is only running on one core / has too little memory!

My MPI job crashes when running with Slurm sbatch but runs in an interactive session with ssh



