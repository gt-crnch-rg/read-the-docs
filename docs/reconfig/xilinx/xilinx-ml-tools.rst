*Last updated: 11/16/20*

Please feel free to edit if you find good resources! 

We have been notified by Xilinx that `Vitis-AI <https://github.com/Xilinx/Vitis-AI>`_ is the preferred framework going forward.

Vitis-AI
-----------

We installed `Vitis AI <https://github.com/Xilinx/Vitis-AI>`_ using the Docker instructions and installing Docker on Ubuntu using the recommended `Docker Engine installation path <https://docs.docker.com/engine/install/ubuntu/>`_. 

Note that you must be part of the Docker group and download the Vitis AI repo to your local home directory or ideally to your localscratch directory. 

Check your docker group status and that you can run Docker images without sudo. 

.. code-block::

   $ groups | grep docker
   gtguest docker ... coc-rg-login ...

   #Test a basic Docker image - if this fails your group 
   #permissions are not correct; please submit a ticket
   $ docker run hello-world

   Hello from Docker!
   This message shows that your installation appears to be working correctly.
   ...

Run the docker image - **note you should not need to pull a new Docker image as this is shared for all users**

.. code-block::

   #Pull the Vitis AI repo, which includes their docker run script. It is suggested to make a directory on localscratch
   $git clone --recurse-submodules https://github.com/Xilinx/Vitis-AI

   #List the available images - note the common Vitis AI image for all users
   $docker images
   REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
   xilinx/vitis-ai     latest              a7eb601784e9        4 months ago        10.1GB
   hello-world         latest              bf756fb1ae65        10 months ago       13.3kB

   #Switch to your Vitis-AI repo directory and run the docker startup script
   $cd Vitis-AI
   $./docker_run.sh xilinx/vitis-ai:latest
   #Accept the terms for the container

    ===========================================
    
    __      ___ _   _                   _____
    
    __      ___ _   _                   _____
    \ \    / (_) | (_)            /\   |_   _|
     \ \  / / _| |_ _ ___ ______ /  \    | |
      \ \/ / | | __| / __|______/ /\ \   | |
       \  /  | | |_| \__ \     / ____ \ _| |_
        \/   |_|\__|_|___/    /_/    \_\_____|

    ============================================

   `Docker Image Version: latest
   Build Date: Mon Nov 16 10:46:01 MST 2020
   VAI_ROOT=/opt/vitis_ai
   For TensorFlow Workflows do:
    conda activate vitis-ai-tensorflow
   For Caffe Workflows do:
    conda activate vitis-ai-caffe
   For Neptune Workflows do:
    conda activate vitis-ai-neptune
   More detail on conda packages included in container: /opt/vitis_ai/conda/conda_packages.txt
   More detail on other 3rd party package source included in container: https://www.xilinx.com/products/design-tools/guest-resources.html
   flubber3:/workspace$`

Xilinx Support for TVM
---------------------------------


* https://sampl.cs.washington.edu/tvmconf/slides/2019/Elliott-Delaye-Xilinx.pdf
* https://xterra2.avnet.com/xilinx/ml/tvm-on-xilinx-mpsoc

Xilinx DPU (Deep Processing Unit)
-----------------------------------------------------


* https://github.com/Xilinx/DPU-PYNQ

Experimental Projects
----------------------------------------------


* `FINN <https://xilinx.github.io/finn/>`_ - a Python and PyTorch-based framework 

Legacy tools - Xilinx's MLSuite
---------------------------------------------

Xilinx's MLSuite is currently described by Xilinx as a "legacy product". It supports mapping TensorFlow and Caffe models to FPGA hardware, and it has evolved from basic GEMM support to the current MLSuite, supported on AWS boards (VCU1525) and newer Alveo boards.


* `Xilinx MLSuite main page <https://www.xilinx.com/products/acceleration-solutions/xilinx-machine-learning-suite.html>`_
* `MLsuite Github <https://github.com/Xilinx/ml-suite>`_ - contains the most resources and info on installation and usage of the tools.
