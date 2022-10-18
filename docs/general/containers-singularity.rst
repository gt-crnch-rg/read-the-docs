=======================
Singularity
=======================

Singularity is often used for more high-performance or AI-focused environments. It has a few key differences from Docker:

- Singularity has traditionally not required any kind of root or sudo privileges to execute. 
- Singularity containers typically compress all the layers of a built image whereas Docker uses "layers". The tradeoff is that Docker images tend to be much larger, but you can potentially rollback to an earlier version of the container. 

For initial development and a focus on 

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
