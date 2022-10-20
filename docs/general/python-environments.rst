===================
Python Environments
===================

CRNCH RG supports many different flavors of python, but we have some suggested rules about using Python and virtual environments.

Key Takeaways for using Python on the RG Testbed
=============

- The default Python is typically 3.8. We do not support python 2 usage as most packages have updated to support python 3.
- We also have installed :code:`venv` across most of our servers and as many dev boards as possible.
    - We recommend to use either :code:`venv` with :code:`pip` or :code:`pipenv` to install packages into your local virtual environments. 
- We do not typically recommend using conda, miniconda, or anaconda as these quickly eat up home directory space. 
    - However, if you want to use conda or miniconda please consider `using your scratch space folder <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-filesystems.html>`__ to store your venvs.


Using venv on CRNCH RG
======================

Creating a new virtual environment

Activating/deactivating an environment

Installing and using packages:


Using pipvenv on CRNCH RG
======================

Creating a new virtual environment

Activating/deactivating an environment

Installing and using packages:


What's the difference between pip, venv, env, conda, etc?
=============


.. list-table:: **Python Environment Tools**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Tool Name
      - Supported Python Versions
      - Purpose
      - Installed on CRNCH RG
      - Notes
    * - pip
      - All Versions
      - Default Package installer
      - Y
      - 
    * - pipenv
      - 
      - Combines pip and virtualenv
      - Y
      - 
    * - virtualenv
      - 
      - 
      - 
      - 
    * - venv
      - 
      - 
      - 
      - 
    * - miniconda
      - 
      - 
      - Y
      - Suggested version of conda to use on RG
    * - anaconda
      - 
      - 
      - N
      - Not supported on RG
    * - poetry
      - 
      - 
      - N
      - Not supported on RG


Venv
-------

Venv is the default virtual environment module included since Python 3.3, and it totally replaces `pyenv` since Python 3.6. Virtualenv has many similarities to venv in terms of its functionality, but we recommend using venv unless you need to use a version of Python older than 3.3. 

For CRNCH, we recommend using venv or pipenv to set up your own environment. 



Pipenv
------

- `Pipenv & Virtual Environments <https://docs.python-guide.org/dev/virtualenvs/>`__

Pip
^^^^^^^^^^^^^^

Conda
^^^^^^^^^^^^^^
**Note:** We typically don't recommend using anaconda due to the amount of dependencies it pulls into your home directory. If you get to where you need anaconda for a project this is typically some software that should be installed in a project space or system-wide!

Resources with more details on differences between different Python packages:

- `Understanding conda and pip <https://www.anaconda.com/blog/understanding-conda-and-pip>`__
- `Explaining the many flavors of conda <https://whiteboxml.com/blog/the-definitive-guide-to-python-virtual-environments-with-conda>`__
- `OLCF's guide to using conda, which assumes a sitewide installation of conda <https://docs.olcf.ornl.gov/software/python/conda_basics.html>`__.
- `NERSC's guide on using python with anaconda <https://docs.nersc.gov/development/languages/python/>`__

Poetry
^^^^^^^^^^^^^^^^


Bonus: IPython, IPykernel, and Jupyter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
You may see some reference to IPython kernels which switching between virtual environments or especially for Jupyter notebooks. In short, IPython (`see site <https://ipython.org/>`__) is a command shell for interactive Python execution that can be extended for GUI applications and parallel computing. Jupyter is a web-based interactive tool that builds on IPython but also supports many other kernels for languages like Julia and R. You can read more about kernels for Jupyter `at this link <https://docs.jupyter.org/en/latest/projects/kernels.html>`__. 
