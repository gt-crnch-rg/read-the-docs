===================
Python Environments
===================

CRNCH RG supports many different flavors of python, but we have some suggested rules about using Python and virtual environments.

TLDR Version
============

- The default Python is typically 3.8. We do not support Python2 usage as most packages have updated to support Python3.
- We also have installed :code:`venv` across most of our servers and as many dev boards as possible.
- We do not typically recommend using conda, miniconda, or anaconda as these quickly eat up home directory space. 
    - However, if you want to use conda or miniconda please consider using your scratch space to store your venvs.


Using venv on CRNCH RG
======================
TBD - examples of how to use venv to install packages, environments

What's the difference between pip, venv, env, conda, etc?
=============

See these resources for more details:

- `Understanding conda and pip <https://www.anaconda.com/blog/understanding-conda-and-pip>`__
- `Explaining the many flavors of conda <https://whiteboxml.com/blog/the-definitive-guide-to-python-virtual-environments-with-conda>`__


Venv
^^^^^^^^^^^^^^

Pip
^^^^^^^^^^^^^^

Conda
^^^^^^^^^^^^^^
**Note:** We typically don't recommend using anaconda due to the amount of dependencies it pulls into your home directory. If you get to where you need anaconda for a project this is typically some software that should be installed in a project space or system-wide!

Bonus: IPython, IPykernel, and Jupyter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
You may see some reference to IPython kernels which switching between virtual environments or especially for Jupyter notebooks. In short, IPython (`see site <https://ipython.org/>`__) is a command shell for interactive Python execution that can be extended for GUI applications and parallel computing. Jupyter is a web-based interactive tool that builds on IPython but also supports many other kernels for languages like Julia and R. You can read more about kernels for Jupyter `at this link <https://docs.jupyter.org/en/latest/projects/kernels.html>`__. 
