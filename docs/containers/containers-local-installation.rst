Container Local Installations
=============================

This page documents how you can install tools like Docker and Singularity locally to run containers on your laptop or local machine. 

The Pawsey Supercomputing Center has a nice guide on using Singularity with an HPC environment, and they have detailed instructions for `local installation of Singularity <https://pawseysc.github.io/singularity-containers/44-setup-singularity/index.html>`__.

Mac OSX
-------------------------
TBD


Installing Singularity Locally
--------------------------
`Singularity CE installation instructions <https://github.com/sylabs/singularity/blob/main/INSTALL.md>`__ support building from source or `RPMs or DEBs for Ubuntu 18.04+ <https://github.com/sylabs/singularity/releases>`__. 

Prerequisites for installation
------------------------------
- shadow-utils

For installation on a server platform, we just download an RPM and install it:
`sudo rpm -ivh singularity-ce-3.10.0-1.el8.x86_64.rpm`
