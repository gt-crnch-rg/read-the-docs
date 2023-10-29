===============================
Using Containers with CRNCH RG
===============================

This page collects some useful resources for using containers on CRNCH RG as well as links to additional training and tutorials.

Apptainer/Singularity
---------------------
We typically recommend that you us Apptainer (aka Singularity) on CRNCH RG since it doesn't require root access. For more information on using Singularity please see `this page <https://gt-crnch-rg.readthedocs.io/en/main/containers/containers-singularity.html>`__.

Docker
------
Many vendor-provided images are provided in Docker format, and this is typically easiest for use on your own laptop or desktop environment. Since you can easily convert Docker definitions into Apptainer containers, we currently recommend using Apptainer on CRNCH RG. For more information on using Docker, please see `this page <https://gt-crnch-rg.readthedocs.io/en/main/containers/containers-docker.html>`__.

CharlieCloud
------------
TBD

Local Installation
------------------
See `this page <https://gt-crnch-rg.readthedocs.io/en/main/containers/containers-local-installation.html>`__ for information on installing Docker and Singularity on your laptop or local desktop.

Useful resources
~~~~~~~~~~~~~~~~~
-  `NVIDIA Docker images <https://github.com/NVIDIA/nvidia-docker>`__
-  `NVIDIA's Getting Started with Containers <https://docs.nvidia.com/deeplearning/frameworks/preparing-containers/index.html>`__
-  `Cloud Init <https://cloudinit.readthedocs.io/en/latest/>`__
-  `NVIDIA Enroot <https://github.com/NVIDIA/enroot>`__ - create a userspace sandbox from a privileged container
-  `Dive tool <https://github.com/wagoodman/dive>`__ - Dive allows for investigating a Docker image to reduce its size.
