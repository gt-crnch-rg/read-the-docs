Jupyter Notebooks
=================
JuptyerLab is an interactive notebook that interleaves runnable code with figures, text, and other educational aids.

We suggest using JupyterLab as your interface for neuromorphic, quantum,
and reconfigurable research. PACE has a `nice
article <https://docs.pace.gatech.edu/interactiveJobs/jupyterInt/>`__ on
using Jupyter notebooks we also recommend. Eventually we will support
schedulable Jupyter notebooks via our Slurm scheduler.


Using Open On Demand
--------------------------------------------
We recommend using Open on Demand to run JupyterLab. 
To begin, head to the `CRNCH OOD Login Page <https://rg-ood.crnch.gatech.edu>`__,
you will need to authenticate with your GT credentials. 

Next, go to Interactive Apps -> JupyterLab

.. figure:: ../figures/general/ood-navbar-jupyter-lab.png
    :alt: Accessing JupyterLab on navigation bar
Figure 1: Interactive Apps -> JupyterLab


You will then need to configure the settings for your JupyterLab session. For general use, Dr. Young recommends
the partition be set to **rg-dev** using the **crush** node. 
You can select the hours and CPU settings according to your needs. 

.. figure:: ../figures/general/ood-navbar-jupyter-lab.png
    :alt: Setting JupyterLab session settings
Figure 2: Configuring JupyerLab Session Settings

Once you have configured the session settings, hit the launch button.

Your JupyterLab should now be queued. You will be taken to a screen that looks like so:

.. figure:: ../figures/general/ood-jupyter-lab-queued.png
    :alt: JupyterLab session queued
Figure 3: JupyerLab Session Queued

Once your JupyterLab session is ready, its status will be shown. You can connect to the session by clicking *Connect to Jupyter*.

.. figure:: ../figures/general/ood-jupyer-lab-running.png
    :alt: JupyerLab session running
Figure 4: JupyterLab Session Running

Finally, you will be redirected to your JupyterLab session! It should look something like this:

.. figure:: ../figures/general/jupyter-lab-example2.png
    :alt: Example JupyterLab session
Figure 5: Example of a JupyerLab Session

Overview of Starting a JupyerLab session on Open OnDemand:
`CRNCH OOD Login Page <https://rg-ood.crnch.gatech.edu>`__ -> Interactive Apps -> JupyterLab -> JupyerLab Settings -> Session Queue -> Session Running -> Connect to JupyterLab


Running JupyterLab through Apptainer Container
----------------------------------------------
Apptainer containers are enormously useful to standardize program dependencies. Unfortunately, it is not obvious how to run Jupyter notebook code through an Apptainer. 
The solution is to use `Jupyter kernels <https://docs.jupyter.org/en/stable/projects/kernels.html>`__.
The kernel acts an interface between the Jupyter notebook and the programming language. Given the notebook code to run, 
the kernel runs the code and then helps display any outputs: text, graphs, etc. 
`ipykernel <https://github.com/ipython/ipykernel>`__ is Jupyter's built in python kernel, which itself is built on top of `IPython <https://ipython.org/>`__. 
To use run our (python) code through an Apptainer, we will build an additional layer on top of IPython.
We use as example a kernel created by Dr. Jezghani for the neuromorphic subteam: `kernel-spec <https://github.gatech.edu/crnch-rg/vip-neuro-snNab>`__

Inside our kernel-spec directory are two files. ``kernel.json`` and ``init.sh``. Let's begin with kernel.json:

.. figure:: ../figures/general/snNab-jupyter-kernel-spec.png
    :alt: kernel.json
Figure 6: kernel.json

This file is relatively self explanatory, aside from "argv". 
"argv" is a list of command line arguments that will be passed to ``init.sh``. 

Let's now look at ``init.sh``:

.. figure:: ../figures/general/snNab-jupyter-kernel-init-sh.png
    :alt: init.sh
Figure 7: init.sh

This file is really only one command, `apptainer exec <https://apptainer.org/docs/user/main/cli/apptainer_exec.html>`__. The ``--nv`` option enables nvidia support. ``/projects/rg_vip_class/neuro/snNab/snntorch-ffmppeg.sif`` is the singularity Apptainer file. 
If you look at the specification for ``apptainer exec``:  

``apptainer exec [exec options...] <container> <command>``  

it is clear that ``python3 -m ipykernel $@`` is the command that is run inside of the container. ``python3 -m ipykernel`` runs the ipykernel module.
But what is ``$@``? `Here <https://unix.stackexchange.com/questions/660122/what-is-in-bash>`__ is a good stack overflow thread on the ``$@`` special parameter. Remember "argv" in kernel.json. 
The first element of argv: "/projects/rg_vip_class/neuro/snNab/kernel-spec/init.sh" is the name of the script for our kernel to run, in this case, ``init.sh``. 
The next two elements of "argv" are command line arguments we wish to pass into ``init.sh``. ``$@`` expands out these arguments passed into the script. In effect, the command that will be run is:  
``apptainer exec --nv /projects/rg_vip_class/neuro/snNab/snntorch-ffmppeg.sif python3 -m ipykernel -f {connection_file}``  
connection_file is provided to us by our JupyterNotebook. Ipykernel still acts as the interface between our Jupyter notebook and the language, but now it is running inside of our specified Apptainer image.
The notebook code is able to utilize all of the dependencies that we included in the image. 

Finally, you will need to move / copy the kernel into Jupyer's kernel directory: ``.local/share/jupyter/kernels/``
You can do this with by creating a symbolic link between the kernel directory and a new directory in ``.local/share/jupyter/kernels/``.
The command to do this is:  

``ln -sfn /path/to/your/kernel/dir .local/share/jupyter/kernels/kernel-dir-name``

Select Kernel in JupyterNotebook
--------------------------------
To select your new kernel inside of your JupyterNotebook, go to Kernel -> Change kernel and then select the kernel that you'd like to use.

.. figure:: ../figures/general/jupyter-notebook-switch-kernel1.png
    :alt: Switch Kernel
Figure 8: Kernel -> Change kernel

.. figure:: ../figures/general/jupyter-notebook-switch-kernel2.png
Figure 9: Selecting SNN Torch kernel




