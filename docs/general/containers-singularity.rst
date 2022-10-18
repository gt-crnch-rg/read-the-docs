=======================
Singularity
=======================

Singularity is often used for more high-performance or AI-focused environments. It has a few key differences from Docker:

- Singularity has traditionally not required any kind of root or sudo privileges to execute. 
- Singularity containers typically compress all the layers of a built image whereas Docker uses "layers". The tradeoff is that Docker images tend to be much larger, but you can potentially rollback to an earlier version of the container. 

For initial development and "system oriented" developments, it is typically better to use Docker containers. For HPC systems or for usage on the CRNCH RG testbed Singularity CE is suggested. 

Why are there two versions of Singularity?
-----------------------------
Singularity Community Edition (CE) and Apptainer are two different forks of Singularity with very similar functionality but that have a slightly different development philosophy. For more information on how they differ, please see `this wiki page <https://docs.hpc.shef.ac.uk/en/latest/bessemer/software/apps/singularity.html>`__ and these posts from Sylabs on `Singularity open source philosophy <https://sylabs.io/category/open-source/>`__ and on `future Singularity CE plans <https://sylabs.io/2022/02/singularityce-4-0-and-beyond/>`__.

Installing Singularity Locally
--------------------------
`Singularity CE installation instructions <https://github.com/sylabs/singularity/blob/main/INSTALL.md>`__ support building from source or `RPMs or DEBs for Ubuntu 18.04+ <https://github.com/sylabs/singularity/releases>`__. 

Prerequisites for installation
------------------------------
- shadow-utils

For installation on a server platform, we just download an RPM and install it:
`sudo rpm -ivh singularity-ce-3.10.0-1.el8.x86_64.rpm`


Converting a Docker container to a Singularity Image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NASA's HPC organization has a nice guide on several techniques to convert Docker images to Singularity Image Files (SIF). Please see it `here <https://www.nas.nasa.gov/hecc/support/kb/converting-docker-images-to-singularity-for-use-on-pleiades_643.html>`__. 

Other Resources
~~~~~~~~~~~~~~~
- `OSC Guide to Running Docker and Singularity Images <https://www.osc.edu/book/export/html/4678>`__
- `Using Apptainer on a cluster environment <https://docs.hpc.shef.ac.uk/en/latest/bessemer/software/apps/singularity.html#>`__
- `Running Singularity containers on OLCF <https://docs.olcf.ornl.gov/software/containers_on_summit.html#>`__
