=======================
Singularity / Apptainer
=======================

Singularity (or Apptainer) is often used for more high-performance or AI-focused environments. It has a few key differences from Docker:

- Singularity has traditionally not required any kind of root or sudo privileges to execute. 
- Singularity containers typically compress all the layers of a built image whereas Docker uses "layers". The tradeoff is that Docker images tend to be much larger, but you can potentially rollback to an earlier version of the container. 

For initial development and "system oriented" developments, it is typically better to use Docker containers. For HPC systems or for usage on the CRNCH RG testbed Singularity CE or Apptainer is suggested. 

Why are there two versions of Singularity?
-----------------------------
Singularity Community Edition (CE) and Apptainer are two different forks of Singularity with very similar functionality but that have a slightly different development philosophy. For more information on how they differ, please see `this wiki page <https://docs.hpc.shef.ac.uk/en/latest/bessemer/software/apps/singularity.html>`__ and these posts from Sylabs on `Singularity open source philosophy <https://sylabs.io/category/open-source/>`__ and on `future Singularity CE plans <https://sylabs.io/2022/02/singularityce-4-0-and-beyond/>`__.

Installing Singularity on your Local Machine
------------------------------
Please see our `separate installation page <https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/general/containers-local-installation.rst>`__ for more information on installing Singularity locally. 

Running a Singularity container on CRNCH RG
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: shell

    apptainer run --nv /projects/tools/x86_64/containers/nvhpc_23.1_devel.sif

.. code:: shell

  bootstrap: docker
  from: nvcr.io/nvidia/cuquantum-appliance:22.11
  
  %labels
    Maintainer RG Admin
    Version 22.11
  %post
    pip install jupyterlab
    pip install pipenv

Running a Singularity container on PACE Phoenix
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Converting a Docker container to a Singularity Image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NASA's HPC organization has a nice guide on several techniques to convert Docker images to Singularity Image Files (SIF). Please see it `here <https://www.nas.nasa.gov/hecc/support/kb/converting-docker-images-to-singularity-for-use-on-pleiades_643.html>`__. 

Other Resources
~~~~~~~~~~~~~~~
- `OSC Guide to Running Docker and Singularity Images <https://www.osc.edu/book/export/html/4678>`__
- `Using Apptainer on a cluster environment <https://docs.hpc.shef.ac.uk/en/latest/bessemer/software/apps/singularity.html#>`__
- `Running Singularity containers on OLCF <https://docs.olcf.ornl.gov/software/containers_on_summit.html#>`__
- `Princeton Singularity documentation <https://researchcomputing.princeton.edu/support/knowledge-base/singularity>`__ 
