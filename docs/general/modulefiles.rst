===================
Modulefile Examples
===================

Most software on the testbed is available using "modulefiles", which allow you to load and unload packages to run specific versions of software. Modulefiles specify the correct path variables for a given software package and help to resolve differences between packages. See `this page <>`__ for more details on using modules with the Rogues Gallery.

Key commands to remember
------------------------

- `module list` - list all currently loaded modules
- `module avail` - list available modules 
- `module load/unload <modulename>`
- `module spider <modulename>` - find a module with a specific name
- `module whatis <modulename>` - shows the help for a modulefile

Contributing/updating Modulefiles
---------------------------------
If you have a new tool you'd like to add as a module, please review the resources below and follow this guide for `testing on our internal wiki here <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BMisc%5D-Writing-new-Modulefiles>`__



Modulefile Resources
=======================
-  `NERSC Lmod User Training <https://www.nersc.gov/users/training/past-training-events/2021/lmod-user-training/>`__ - contains a Github tutorial based on Docker that goes into the basic usage of modules.
