=======================
Singularity / Apptainer
=======================

Singularity (or Apptainer) is often used for more high-performance or AI-focused environments. It has a few key differences from Docker:

- Singularity has traditionally not required any kind of root or sudo privileges to execute. 
- Singularity containers typically compress all the layers of a built image whereas Docker uses "layers". The tradeoff is that Docker images tend to be much larger, but you can potentially rollback to an earlier version of the container. 

For initial development and "system oriented" developments, it is typically better to use Docker containers. For HPC systems or for usage on the CRNCH RG testbed Singularity CE or Apptainer is suggested. 

Why are there two versions of Singularity?
------------------------------------------
Singularity Community Edition (CE) and Apptainer are two different forks of Singularity with very similar functionality but that have a slightly different development philosophy. For more information on how they differ, please see `this wiki page <https://docs.hpc.shef.ac.uk/en/latest/bessemer/software/apps/singularity.html>`__ and these posts from Sylabs on `Singularity open source philosophy <https://sylabs.io/category/open-source/>`__ and on `future Singularity CE plans <https://sylabs.io/2022/02/singularityce-4-0-and-beyond/>`__.

Installing Singularity on your Local Machine
--------------------------------------------
Please see our `separate installation page <https://gt-crnch-rg.readthedocs.io/en/main/containers/containers-local-installation.html>`__ for more information on installing Singularity locally. 

Running a Singularity container on CRNCH RG
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: shell

    apptainer run --nv /projects/tools/x86_64/containers/cuquantum-23.06.sif
    ...
    ================================
    == NVIDIA cuQuantum Appliance ==
    ================================

    NVIDIA cuQuantum Appliance 23.06
    Copyright (c) NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
    Apptainer>


You can also "bind" your scratch directory or host toolchains to your container environment using `--bind <host_dir>:<container_dir>`. Note that your normal `/nethome` should be accessible since you are running the container as a normal user. 

.. code:: shell

    # Bind your CRNCH scratch directory inside your container 
    apptainer run --bind ~/USERSCRATCH:/scratch  /projects/tools/x86_64/containers/cuquantum-23.06.sif

Building your own Singularity container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::

    Users can build containers using fakeroot, so you shouldn't need sudo access to create a new container. However, you may need some help `setting up fakeroot to build Singularity containers <https://apptainer.org/docs/admin/1.2/user_namespace.html#adding-a-fakeroot-mapping>`__. Please reach out to the testbed admins for assistance. 

You can start from a Singularity `.def` file like one of the ones in our `GT Github container-defs repo (GT login required) <https://github.gatech.edu/crnch-rg/container-defs>`__ 

Example .def file for cuQuantum - `see the file here in our repo <https://github.gatech.edu/crnch-rg/container-defs/blob/main/quantum/cuquantum/cuquantum-23.06.def>`__:

.. code:: shell

    bootstrap: docker
    from: nvcr.io/nvidia/cuquantum-appliance:23.06

    %labels
        Maintainer RG Admin
        Version 23.06

    %post
        pip install jupyterlab
        pip install pipenv

To build this container, we highly recommend you use `/project` space or `USERSCRATCH` rather than your home directory. We also suggest using a dev VM (ie, `rg-fpga-dev1`, `rg-emu-dev`) or `hawksbill` to build your new image.

Set up fakeroot to build containers as a non-root user (this may require some admin assistance. 

.. code:: shell

    $> sudo apptainer config fakeroot --add gburdell
    $> INFO:    Detected Singularity user configuration directory

Then build your image. Here we are using USERSCRATCH on `hawksbill`.

.. code:: shell

    USERSCRATCH$> git clone https://github.gatech.edu/crnch-rg/container-defs.git
    USERSCRATCH$> cd container-defs/quantum/cuquantum
    # Note this step may take a while to run
    cuquantum$> apptainer build cuquantum-23.06.sif cuquantum-23.06.def
    INFO:    Starting build...
    Getting image source signatures
    Copying blob f0412dfb1aae done  
    Copying blob 20d547ab5eb5 done
    ...
    Successfully installed distlib-0.3.7 filelock-3.12.4 pipenv-2023.10.24 setuptools-68.2.2 virtualenv-20.24.6
    WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
    INFO:    Adding labels
    INFO:    Creating SIF file...
    INFO:    Build complete: cuquantum-23.06.sif

Testing your container build with writable containers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
While provided containers are typically immutable (non-writable), you can test out the functionality of your container using a `sandbox environment <https://apptainer.org/docs/user/main/quick_start.html#sandbox-directories>`__. This process involves: 1) Creating a sandbox directory from an existing .def or Dockerfile, 2) Running the container as a writable sandbox, and 3) Finalizing your container as immutable for deployment. 

.. code:: shell

    # Create a sandbox from a standard Docker Ubuntu definition
    apptainer build --sandbox ubuntu_sandbox/ docker://ubuntu
    apptainer shell --writable ubuntu_sandbox
    # Test out changes, apt-get and test workflow

    # Then you can build from this sandbox directory to create your final image
    apptainer build final_ubuntu_container.sif ubuntu_sandbox


Running a Singularity container on PACE Phoenix
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TBD

Converting a Docker container to a Singularity Image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NASA's HPC organization has a nice guide on several techniques to convert Docker images to Singularity Image Files (SIF). Please see it `here <https://www.nas.nasa.gov/hecc/support/kb/converting-docker-images-to-singularity-for-use-on-pleiades_643.html>`__. 

As an example, we can use a recent Dockerfile example for the Vortex tutorial: 

.. code:: shell

    # Build from a DockerFile
    docker build -t vortex_micro23:latest .
    [+] Building 53.2s (16/16) FINISHED
    => [internal] load build definition from Dockerfile                                                                               
    ...                                                                                                                               
     => => writing image sha256:8e992d22010e9eada1aa9723068da6d2d27e0ed25bbef55a2d00e939fc0fb5d2   0.0s
     => => naming to docker.io/library/vortex_micro23:latest                                       0.0s

    #Then we check for the Docker image in the docker daemon
    $> docker images | grep vortex
    REPOSITORY        TAG               IMAGE ID       CREATED          SIZE
    vortex_micro23    latest            8e992d22010e   33 seconds ago   1.03GB

    #Then convert the Dockerfile to an Apptainer image
    root@flubber1:/localscratch/jyoung9# apptainer build vortex_micro23.sif docker-daemon://vortex_micro23:latest
    ...
    INFO:    Creating SIF file...
    INFO:    Build complete: vortex_micro23.sif

Alternatively, you can use tools like `spython <https://pypi.org/project/spython/>`__ to convert definition files and build directly from a Singularity definition file.

.. code:: shell

    pip3 install spython 
    
    # Save the Dockerfile to a Singularity .def file
    spython recipe Dockerfile &> Singularity.def

    INFO:    Starting build...
    Getting image source signatures
    ...    
    INFO:    Creating SIF file...
    INFO:    Build complete: vortex_micro23.sif

Other Resources
~~~~~~~~~~~~~~~
- `HSF Software Carpentry Apptainer tutorial <https://hsf-training.github.io/hsf-training-singularity-webpage/>`__
- `Singularity tutorial <https://github.com/Singularity-tutorial/Singularity-tutorial.github.io>`__
- `OSC Guide to Running Docker and Singularity Images <https://www.osc.edu/book/export/html/4678>`__
- `Using Apptainer on a cluster environment <https://docs.hpc.shef.ac.uk/en/latest/bessemer/software/apps/singularity.html#>`__
- `Running Singularity containers on OLCF <https://docs.olcf.ornl.gov/software/containers_on_summit.html#>`__
- `Princeton Singularity documentation <https://researchcomputing.princeton.edu/support/knowledge-base/singularity>`__ 
