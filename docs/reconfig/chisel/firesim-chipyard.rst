====================
Firesim and ChipYard
====================

.. note:: 
   This page builds off the Docker instructions from Farzad Fatollahi-Fard at LBL that can be `found publicly here <https://socks.lbl.gov/cag/bxe/-/wikis/Docker-Image>`__. Please review these instructions and note there are some minor differences with our use of Apptainer, which you can review `here <https://gt-crnch-rg.readthedocs.io/en/main/containers/containers-singularity.html>`__

Farzad was kind enough to share his Dockerfile which can be found on our container repo `here <https://github.gatech.edu/crnch-rg/container-defs/blob/main/firesim_chipyard/firesim_1.16.0>`__ (requires login).

FireSim 1.16 uses ChipYard 1.9.0 so building FireSim will enable using ChipYard as well. 

Creating a FireSim and Chipyard Singularity image from the Docker image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The easiest way to create a Singularity container image is from an
existing Dockerfile using spython or by building from a Docker archive.

.. code-block::

   hawksbill:/netscratch/gburdell/containers$ docker pull socks.lbl.gov:4567/cag/bxe
   Using default tag: latest
   latest: Pulling from cag/bxe
   0fb668748fc8: Already exists
   41b3333ca59c: Already exists
   Digest: sha256:d2bb96c6744a335aecb1de6851177389dd438edf86bcf5962394023a8a54dacc
   Status: Downloaded newer image for socks.lbl.gov:4567/cag/bxe:latest
   socks.lbl.gov:4567/cag/bxe:latest

   [..containers]$ docker image ls
   REPOSITORY                               TAG       IMAGE ID       CREATED        SIZE
   socks.lbl.gov:4567/cag/bxe               latest    10a5c176f7c0   4 months ago   31.2GB

   [..containers]$ docker save 10a5c176f7c0 -o bxe_firesim_1.16.tar

   [..containers]$ apptainer build bxe_firesim_1.16.sif docker-archive://bxe_firesim_1.16.tar
   INFO:    Starting build...
   Getting image source signatures
   ...
   2023/11/21 22:07:59  info unpack layer: sha256:755ddbd1bc48f09cece4ffcd4213634de71d17989fb7311b31b328d84c4ce421
   ...
   INFO:    Creating SIF file...
   INFO:    Build complete: bxe_firesim_1.16.sif



Launching the Singularity container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use bind mounts to include $USERSCRATCH as a scratch directory in your image.

.. code-block::

   $> apptainer shell --bind /netscratch/<your_username>:/scratch  /projects/tools/x86_64/containers/firesim-1.16.sif

.. _section-2:

Activate FireSim environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To use FireSim you need to activate the environment inside the
container:

.. code-block::

   Apptainer> conda activate firesim
   # Switch to the root firesim directory
   (firesim) gburdell@hawksbill:~$ cd /root/firesim
   # Set up paths for ChipYard and FireMarshal
   (firesim) gburdell@hawksbill:~$ source source-env.sh
   /root/firesim$ source source-env.sh
   Activating FireSim Conda Environment...
   Sourcing FireSim Environment...
   Navigating to Chipyard Directory...
   Sourcing Chipyard Environment...
   (/root/firesim/target-design/chipyard/.conda-env) gburdell@hawksbill:/root/firesim/target-design/chipyard$

Errors with Activating the Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If you get an error, this may be because you have existing conda
environment support in your home directory, which was mapped into the
container. To fix this reinitialize and then activate the firesim
environment.

.. code-block::

   CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'.
   To initialize your shell, run

       $ conda init <SHELL_NAME>

   #Initialize 
   Apptainer> conda init bash
   ...

   #Then reload your shell
   Apptainer> bash
   #And reactivate the FireSim environment
   (base) gburdell@hawksbill:~$ conda activate firesim
