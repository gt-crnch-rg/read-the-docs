===================
Python Environments
===================

CRNCH RG supports many different flavors of python, but we have some suggested rules about using Python and virtual environments.

Key Takeaways for using Python on the RG Testbed
=============

- The default Python is typically 3.8. We do not support python 2 usage as most packages have updated to support python 3.
- We also have installed :code:`virtualenv` across most of our servers and as many dev boards as possible.
    - We recommend to use either :code:`virtualenv` with :code:`pip` or :code:`pipenv` to install packages into your local virtual environments. 
- We do not typically recommend using conda, miniconda, or anaconda as these quickly eat up home directory space. 
    - However, if you want to use conda or miniconda please consider `using miniconda with your scratch space folder <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-filesystems.html>`__ to store your venvs.
    
What's the difference between pip, venv, env, conda, etc?
=============

.. list-table:: **Python Environment Tools**
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Tool Name
      - Supported Python Versions
      - Purpose
      - Default on CRNCH RG
      - Notes
    * - `pip <https://pypi.org/project/pip/>`__
      - All Versions
      - Default Package installer
      - Y
      - 
    * - `pipenv <https://pypi.org/project/pipenv/>`__
      - 
      - Combines pip and virtualenv
      - Y
      - 
    * - `virtualenv <https://virtualenv.pypa.io/en/latest/>`__
      - 
      - 
      - 
      - 
    * - `venv <https://docs.python.org/3/library/venv.html>`__
      - 3.3+
      - 
      - 
      - venv is a subset of virtualenv installed by default with Python 3.3+
    * - `miniconda <https://docs.conda.io/en/latest/miniconda.html>`__
      - 
      - 
      - N
      - Suggested version of conda to use on RG
    * - anaconda
      - 
      - 
      - N
      - Not supported on RG
    * - `poetry <https://python-poetry.org/>`__
      - 
      - 
      - N
      - Not supported on RG


Using venv on CRNCH RG
======================
Venv is the default virtual environment module included since Python 3.3, and it totally replaces `pyenv` since Python 3.6. Virtualenv has many similarities to venv in terms of its functionality, but we recommend using venv unless you need to use a version of Python older than 3.3. 

Installing venv
~~~~~~~~~~~~~~~~

Creating a new virtual environment with venv
~~~~~~~~~~~~~~~~

Activating/deactivating an environment
~~~~~~~~~~~~~~~~

Installing and using packages
~~~~~~~~~~~~~~~~

Using pipvenv on CRNCH RG
======================

Installing pipenv
~~~~~~~~~~~~~~~~
Using the official installation instructions `here <https://pipenv.pypa.io/en/latest/install/#installing-pipenv>`__:

.. code:: shell

    python3 -m pip install pipenv

Creating a new virtual environment with pipenv
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: shell

    $ pipenv install
    Creating a virtualenv for this project...
    Pipfile: /nethome/gburdell/Pipfile
    Using /usr/bin/python3.8 (3.8.13) to create virtualenv...
    ⠦ Creating virtual environment...created virtual environment CPython3.8.13.final.0-64 in 2991ms
      creator CPython3Posix(dest=/nethome/gburdell/.local/share/virtualenvs/gburdell-hxKrwMjp, clear=False, no_vcs_ignore=False, global=False)
      seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=/nethome/gburdell/.local/share/virtualenv)
        added seed packages: pip==22.3, setuptools==65.5.0, wheel==0.37.1
        activators BashActivator,CShellActivator,FishActivator,NushellActivator,PowerShellActivator,PythonActivator

    ✔ Successfully created virtual environment!
    Virtualenv location: /nethome/gburdell/.local/share/virtualenvs/gburdell-hxKrwMjp
    Pipfile.lock not found, creating...
    Locking [dev-packages] dependencies...
    Locking [packages] dependencies...
    Updated Pipfile.lock (db4242)!
    Installing dependencies from Pipfile.lock (db4242)...
      🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 0/0 — 00:00:00
    To activate this project's virtualenv, run pipenv shell.
    Alternatively, run a command inside the virtualenv with pipenv run.

Activating/deactivating an environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Installing and using packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




Pip
==============

Conda
===================
**Note:** We typically don't recommend using anaconda due to the amount of dependencies it pulls into your home directory. If you get to where you need anaconda for a project this is typically some software that should be installed in a project space or system-wide!

Resources with more details on differences between different Python packages:

- `Understanding conda and pip <https://www.anaconda.com/blog/understanding-conda-and-pip>`__
- `Explaining the many flavors of conda <https://whiteboxml.com/blog/the-definitive-guide-to-python-virtual-environments-with-conda>`__
- `OLCF's guide to using conda, which assumes a sitewide installation of conda <https://docs.olcf.ornl.gov/software/python/conda_basics.html>`__.
- `NERSC's guide on using python with anaconda <https://docs.nersc.gov/development/languages/python/>`__

Poetry
===============
Poetry is a tool for dependency management and packaging similar to pipenv (which combines pip and venv). While we don't currently support it, you may be interested to try it out in your user-local setup. Read more about Poetry at the `official website <https://python-poetry.org/docs/>`__.

Bonus: IPython, IPykernel, and Jupyter
======================================
You may see some reference to IPython kernels which switching between virtual environments or especially for Jupyter notebooks. In short, IPython (`see site <https://ipython.org/>`__) is a command shell for interactive Python execution that can be extended for GUI applications and parallel computing. Jupyter is a web-based interactive tool that builds on IPython but also supports many other kernels for languages like Julia and R. You can read more about kernels for Jupyter `at this link <https://docs.jupyter.org/en/latest/projects/kernels.html>`__. 

