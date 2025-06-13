================================
Using NVIDIA Jetpack and PyTorch
================================

This page is targeted towards using NVIDIA JetPack functions and PyTorch with the Jetson boards in the testbed.

NVIDIA JetPack
==============

What functions does it have for Jetsons?
----------------------------------------

NVIDIA JetPack SDK is the official software development kit for the NVIDIA Jetson platform (Nano, Xavier NX, AGX Xavier, Orin series, etc.).
It bundles essential libraries, tools, drivers, and APIs to develop AI, computer vision, multimedia, and robotics applications. 

Using PyTorch with Jetson
=========================

Pytorch is available for both `rudi1 (Jetson Xavier NX) and rudi2 (Jetson Orin) <https://gt-crnch-rg.readthedocs.io/en/main/neuromorphic/rudi-jetson-dev-boards.html>`__ boards in CRNCH.

Prerequisites and Dependencies
------------------------------

Before you install Pytorch on your system, ensure you:

1) Install `JetPack SDK <https://developer.nvidia.com/embedded/jetpack>`__ on your Jetson device.
2) Install system packages required by PyTorch

.. code:: shell
   sudo apt-get -y update; 
   sudo apt-get install -y  python3-pip libopenblas-dev;

3) If installing 24.06 PyTorch or later versions, `cusparselt<https://docs.nvidia.com/cuda/cusparselt/index.html>`__ needs to be installed first by:

.. code:: shell
   wget 
   raw.githubusercontent.com/pytorch/pytorch/5c6af2b583709f6176898c017424dc9981023c28/.ci/docker/
   common/install_cusparselt.sh 
   export CUDA_VERSION=12.1 # as an example   
   bash ./install_cusparselt.sh

Next, Install Pytorch with the following steps:

1) Export with the following command
.. code:: shell
   export TORCH_INSTALL=https://developer.download.nvidia.cn/compute/redist/jp/v511/pytorch/torch-2.0.0+nv23.05-cp38-cp38-linux_aarch64.whl

or Download with the wheel file and set.

.. code:: shell
   export TORCH_INSTALL=path/to/torch-2.2.0a0+81ea7a4+nv23.12-cp38-cp38-linux_aarch64.whl

2) Install Pytorch
.. code:: shell
   python3 -m pip install --upgrade pip; python3 -m pip install numpy==’1.26.1’; python3 -m pip install --no-cache $TORCH_INSTALL


Multiple versions of pytorch can be installed using virtual environments.
First start with installing `virtualenv` package and create a new Python3 virtual environment.

.. code:: shell
   sudo apt-get install virtualenv
   python3 -m virtualenv -p python3 <chosen_venv_name>

Next, activate the created virtual environment and install the desired version of pytorch where `JP_VERSION` is the major and minor version of JetPack,
and `PYT_VERSION` is the released version of PyTorch wheels, as given in the `compatibility matrix<https://docs.nvidia.com/deeplearning/frameworks/install-pytorch-jetson-platform-release-notes/pytorch-jetson-rel.html#pytorch-jetson-rel>`__

.. code:: shell
   source <chosen_venv_name>/bin/activate
   pip3 install --no-cache https://developer.download.nvidia.com/compute/redist/jp/v$JP_VERSION/pytorch/$PYT_VERSION

The virtual environment can be deactivated by:

.. code:: shell
   deactivate

Using Tensorflow with Jetson
============================

Tensorflow can also be installed like Pytorch, with the system packages:

.. code:: shell
   $ sudo apt-get update
   $ sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran

and with the Python package dependencies

.. code:: shell
   $ sudo pip3 install -U numpy==1.22 future==0.18.2 mock==3.0.5 keras_preprocessing==1.1.2 keras_applications==1.0.8 gast==0.4.0 protobuf pybind11 cython pkgconfig packaging h5py==3.7.0

Installation of Tensorflow can be done with by specifying the version, where `JP_VERSION` is the major and minor version of JetPack, 
`TF_VERSION` is the release version of tensorflow (for example, 2.11.0) and `NV_VERSION` is the monthly NVIDIA container version of TensorFlow.

.. code:: shell
   $ sudo pip3 install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v$JP_VERSION tensorflow==$TF_VERSION+nv$NV_VERSION

Installation of multiple versions can be done similarly to PyTorch.

Hello AI World
==============

`Hello AI World<https://github.com/dusty-nv/jetson-inference>`__ is an instructional guide for inference and realtime vision DNN library for NVIDIA Jetson devices.
This section demonstrates how to `classify images with ImageNet<https://github.com/dusty-nv/jetson-inference/blob/master/docs/imagenet-console-2.md>`__

Detailed build instructions can be found `here<https://github.com/dusty-nv/jetson-inference/blob/master/docs/building-repo-2.md>`__,
and the following is a condensed form of commands.

.. code:: shell
   sudo apt-get update
   sudo apt-get install git cmake libpython3-dev python3-numpy
   git clone --recursive --depth=1 https://github.com/dusty-nv/jetson-inference
   cd jetson-inference
   mkdir build
   cd build
   cmake ../
   make -j$(nproc)
   sudo make install
   sudo ldconfig

After the build is done move the working directory to `jetson-inference/build/aarch64/bin`, and run the classification.
The following is an example from `ImageNet Console<https://github.com/dusty-nv/jetson-inference/blob/master/docs/imagenet-console-2.md>`__

.. code:: shell
   # C++
   $ ./imagenet --network=resnet-18 images/jellyfish.jpg images/test/output_jellyfish.jpg

   # Python
   $ ./imagenet.py --network=resnet-18 images/jellyfish.jpg images/test/output_jellyfish.jpg