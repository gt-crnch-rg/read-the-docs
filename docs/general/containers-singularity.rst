=======================
Singularity
=======================

Singularity is often used for more high-performance or AI-focused environments, and it has a few key differences from Docker:

- Singularity has traditionally not required any kind of root or sudo privileges to execute. 
- Singularity containers typically compress all the layers 


Installing Singularity Locally
--------------------------
`Singularity CE installation instructions <https://github.com/sylabs/singularity/blob/main/INSTALL.md>`__ support building from source or `RPMs or DEBs for Ubuntu 18.04+ <https://github.com/sylabs/singularity/releases>`__. 

Prerequisites for installation
------------------------------
- shadow-utils

For installation on a server platform, we just download 


Converting a Docker container to a Singularity Image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NASA's HPC organization has a nice guide on several techniques to convert Docker images to Singularity Image Files (SIF). Please see it `here <https://www.nas.nasa.gov/hecc/support/kb/converting-docker-images-to-singularity-for-use-on-pleiades_643.html>`__. 

Other Resources
~~~~~~~~~~~~~~~
- `OSC Guide to Running Docker and Singularity Images <https://www.osc.edu/book/export/html/4678>`__
