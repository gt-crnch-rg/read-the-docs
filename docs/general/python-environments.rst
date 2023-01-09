===================
Python Environments
===================

- The default Python is typically 3.8. We do not officially support Python 2 usage as most packages have updated to support Python 3.
    - Look into `2to3 <https://docs.python.org/3/library/2to3.html>`__ if your code is still using Python 2!
- :code:`virtualenv` is installed across most of our servers and as many dev boards as possible.
    - We recommend to use either :code:`virtualenv` or :code:`venv` with :code:`pip` or :code:`pipenv` to install packages into your local virtual environments. Note that :code:`venv` and :code:`pip` are default packages for all Python 3.3+ installations.
- We do not typically recommend using conda, miniconda, or anaconda as these quickly eat up home directory space. 
    - However, if you want to use conda or miniconda please consider `using miniconda with your scratch space folder <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-filesystems.html>`__ to store your conda environment and venvs. See the example below under the Conda section as a template.
    
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
      - Default package manager
      - Y
      - 
    * - `pipenv <https://pypi.org/project/pipenv/>`__
      - 2+
      - Package, dependency, and environment manager
      - Y
      - Combines pip and virtualenv
    * - `virtualenv <https://virtualenv.pypa.io/en/latest/>`__
      - 2+
      - Environment manager
      - Y
      - 
    * - `venv <https://docs.python.org/3/library/venv.html>`__
      - 3.3+
      - Environment manager
      - Y
      - venv is a subset of virtualenv installed by default with Python 3.3+
    * - `miniconda <https://docs.conda.io/en/latest/miniconda.html>`__
      - NA
      - Minimalist package and environment manager 
      - N
      - Suggested version of conda to use on RG; Installs its own conda/Python as well as non-Python packages
    * - `anaconda <https://www.anaconda.com/>`__
      - NA
      - Package and environment manager 
      - N
      - Not supported on RG; Installs its own Python
    * - `poetry <https://python-poetry.org/>`__
      - 3.7+
      - Package and dependency manager
      - N
      - Not supported on RG


Using venv on CRNCH RG
======================
Venv is the default virtual environment module included since Python 3.3, and it totally replaces `pyenv` since Python 3.6. Virtualenv has many similarities to venv in terms of its functionality, but we recommend using venv unless you need to use a version of Python older than 3.3. 

Creating a new virtual environment with venv
---------------

Activating/deactivating an environment
---------------

Installing and using packages
---------------

Using pipvenv on CRNCH RG
======================

Installing pipenv
---------------
Using the official installation instructions `here <https://pipenv.pypa.io/en/latest/install/#installing-pipenv>`__:

.. code:: shell

    python3 -m pip install pipenv

Creating a new virtual environment with pipenv
---------------

When you run :code:`pipenv install`, it will create a standard virtual environnment and all related pip installs will occur within this user-accessible folder.

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
    
 If you'd like to create a Python 3.8 environment, use the following syntax. Note that this will overwrite the standard location for your virtualenv
 
.. code:: shell
    pipenv install pipenv --python 3.8 install

Activating/deactivating an environment
---------------

.. code:: shell

   $ pipenv shell
   Launching subshell in virtual environment...
    . /nethome/gburdell/.local/share/virtualenvs/gburdell-hxKrwMjp/bin/activate
   gburdell@rg-login:~$  . /nethome/gburdell/.local/share/virtualenvs/gburdell-hxKrwMjp/bin/activate
   (gburdell) gburdell@rg-login:~$
   
OR use the code::`pipenv run` method

.. code:: shell

   $ python3 --version
   Python 3.6.8
   $ pipenv run python3 --version
   Python 3.8.13
   

Installing and using packages
---------------

.. code:: shell

   $ pipenv install 2to3
   Installing 2to3...
   Adding 2to3 to Pipfile's [packages]...
   ✔ Installation Succeeded
   Pipfile.lock (db4242) out of date, updating to (7d7dfd)...
   Locking [dev-packages] dependencies...
   Locking [packages] dependencies...
   Building requirements...
   Resolving dependencies...
   ✔ Success!
   Updated Pipfile.lock (7d7dfd)!
   Installing dependencies from Pipfile.lock (7d7dfd)...
     🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 0/0 — 00:00:00
   To activate this project's virtualenv, run pipenv shell.
   Alternatively, run a command inside the virtualenv with pipenv run.
   
To show what packages are installed and their dependencies, you can use :code:`pipenv graph`. Here we show the dependencies for 2to3 and matplotlib.

.. code:: shell

  $ pipenv graph
  //No dependencies for this package
  2to3==1.0 
  //Several dependencies were installed, including numpy
  matplotlib==3.6.2
  - contourpy [required: >=1.0.1, installed: 1.0.6]
    - numpy [required: >=1.16, installed: 1.24.1]
  - cycler [required: >=0.10, installed: 0.11.0]
  - fonttools [required: >=4.22.0, installed: 4.38.0]
  - kiwisolver [required: >=1.0.1, installed: 1.4.4]
  - numpy [required: >=1.19, installed: 1.24.1]
  - packaging [required: >=20.0, installed: 23.0]
  - pillow [required: >=6.2.0, installed: 9.4.0]
  - pyparsing [required: >=2.2.1, installed: 3.0.9]
  - python-dateutil [required: >=2.7, installed: 2.8.2]
    - six [required: >=1.5, installed: 1.16.0]

Pipenv Related Documents
==============
- `Pipenv and Virtualenv <https://docs.python-guide.org/dev/virtualenvs/>`__
- `Pipenv guide <https://realpython.com/pipenv-guide/>`__
- `Pipenv vs virtualenv vs conda environment <https://medium.com/@krishnaregmi/pipenv-vs-virtualenv-vs-conda-environment-3dde3f6869ed>`_

Pip
==============

Pip or the `package installer for python` is the default way to install packages from the Python Package Index, or `PyPI <https://pypi.org/>`__. Depending on the version of Python used, you may need to call it using code::`pip install <packagename>` or code::`python -m pip install <packagename`>. 

Note that best practices specify that you should install packages into a "user-local" directory (normally under :code:`~/.local` or your virtual environment folder). You can find this location for your version of Python using the following command.

.. code:: shell

    $ python3 -m site --user-base
    /nethome/gburdell/.local

Then you can install packages to your local directory as follows. Assuming a standard Python 3.8 install, the installed files can be found at code::`.local/lib/python3.8/site-packages/`.

.. code:: shell

    $ pip install --user matplotlib
       
Pip Related Documents
-----------------
- `Python Pip tutorial page <https://python-tutorials.in/python-pip/>`__.

Conda
===================
**Note:** We typically don't recommend using anaconda due to the amount of dependencies it pulls into your home directory. If you get to where you need anaconda for a project this is typically some software that should be installed in a project space or system-wide! Please consider submitting a help ticket especially if you need multiple packages that can't be satisfied with pipenv. 

Miniconda Installation and Usage Example
-----------------------
With the above caveat in mind, this example shows how to use your scratch space to install and use Miniconda. We recommend this approach since this saves space in your home directory and because full Conda environments do not typically need to be backed up. Note that you can always use :code:`conda env export --from-history>ENV.yml` to back up an installed environment. 

.. code:: shell

   mkdir ~/USERSCRATCH/conda
   gburdell@rg-login:~/tutorials$ cd ~/USERSCRATCH/conda/
   gburdell@rg-login:~/USERSCRATCH/conda$ wget https://repo.anaconda.com/miniconda/Miniconda3-py38_22.11.1-1-Linux-x86_64.sh
   ...
   ... ‘Miniconda3-py38_22.11.1-1-Linux-x86_64.sh’ saved [64630241/64630241]
   //This command uses "batch mode" to auto-accept the EULA and installs in a local folder
   gburdell@rg-login:~/USERSCRATCH/conda$ bash Miniconda3-py38_22.11.1-1-Linux-x86_64.sh -b -p conda3_22.11.1
   PREFIX=/nethome/gburdell/USERSCRATCH/conda/conda3_22.11.1
   Unpacking payload ...
   Installing base environment...
   Downloading and Extracting Packages
   ...
   installation finished.

   //Add the location of miniconda to your path. You should add this to your .bashrc file
   export PATH=$PATH:~/USERSCRATCH/conda/conda3_22.11.1/bin && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/USERSCRATCH/conda/conda3_22.11.1/lib

   //Create a new conda environment on your scratch space.
   conda create --prefix ~/USERSCRATCH/condaenv/
   Collecting package metadata (current_repodata.json): done
   Solving environment: done

   ## Package Plan ##
   environment location: /nethome/gburdell/USERSCRATCH/condaenv
   
   Preparing transaction: done
   Verifying transaction: done
   Executing transaction: done
   #
   # To activate this environment, use
   #
   #     $ conda activate /nethome/gburdell/USERSCRATCH/condaenv
   #
   # To deactivate an active environment, use
   #
   #     $ conda deactivate

Conda Related Documents
-----------------------
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
