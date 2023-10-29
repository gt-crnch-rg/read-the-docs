Container Local Installations
=============================

This page documents how you can install tools like Docker and Singularity locally to run containers on your laptop or local machine. 

Docker Installation
-------------------

We highly recommend that you use either `Docker Desktop <https://docs.docker.com/desktop/>`__ or the basic Docker Engine <https://docs.docker.com/engine/install/>`__ to install Docker on your local system. If you have space, Docker Desktop includes additional tools for building and using Docker containers. 

Note that Docker Desktop in Linux uses a virtual machine to run, so you may want to install just the Docker engine if you are working on an older laptop or light-weight system.

Apptainer Installation
------------------------



Mac OSX
-------

.. note::

  Recent M1/M2 MacBooks use Arm processors, which require the use of Virtualbox and Vagrant to run Singularity in a virtualized environment. To use Virtualbox, you will need to manually install either the `Developer preview version 7.0.8 <https://www.virtualbox.org/wiki/Download_Old_Builds_7_0>`__ or the latest `"macOS/ARM64 BETA" test build <https://www.virtualbox.org/wiki/Testbuilds>`__.

Follow the instructions for `installing on Windows or Mac <https://docs.sylabs.io/guides/3.0/user-guide/installation.html#install-on-windows-or-mac>`__ noting the manual install of Virtualbox. We suggest using an Ubuntu 22.04 Vagrantfile:

.. code::

  # Note the changes for an Ubuntu VM
  vagrant.configure("2") do |config|
    # Choose operating system distribution
    # Ubuntu 20.04
    config.vm.box = "ubuntu/focal64"
    # Ubuntu 22.04
    config.vm.box = "ubuntu/jammy64"

    config.vm.provider "virtualbox" do |vb|
      # Customize the number of cpus on the VM:
      vb.cpus = "2"

      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end

    config.vm.provision "shell", inline: <<-SHELL
      # Matching linux installation instructions
      apt-get install -y apptainer
    SHELL
  end

Then run the correct vagrant commands to get to your Apptainer environment:

.. code::

  vagrant up
  vagrant ssh
  apptainer --version
  
.. note::

  If you are having issues with SSH timing out, make sure that your ssh-agent is not running as the keys there can conflict with `as discussed in this issue <https://github.com/hashicorp/vagrant/issues/12751>`__

Resources
---------

- `Apptainer Local Installation Instructions <https://apptainer.org/docs/admin/main/installation.html#installation-on-windows-or-mac>`__
- `Singularity CE installation instructions <https://github.com/sylabs/singularity/blob/main/INSTALL.md>`__ support building from source or `RPMs or DEBs for Ubuntu 18.04+ <https://github.com/sylabs/singularity/releases>`__. 
- The Pawsey Supercomputing Center has a nice guide on using Singularity with an HPC environment, and they have detailed instructions for `local installation of Singularity <https://pawseysc.github.io/singularity-containers/44-setup-singularity/index.html>`__.
