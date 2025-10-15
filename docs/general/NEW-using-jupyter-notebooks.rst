Jupyter Notebooks
=================


We suggest using JupyterLab as your interface for neuromorphic, quantum,
and reconfigurable research. PACE has a `nice
article <https://docs.pace.gatech.edu/interactiveJobs/jupyterInt/>`__ on
using Jupyter notebooks we also recommend. Eventually we will support
schedulable Jupyter notebooks via our Slurm scheduler.


Using Open On Demand
--------------------------------------------
We now recommend using Open on Demand to run JupyterLab. 
To begin, head to the `CRNCH OOD Login Page <https://rg-ood.crnch.gatech.edu>`
You will need to authenticate with your GT credentials. 

Next, go to Interactive Apps -> JupyterLab

.. figure:: ../figures/general/ood-navbar-jupyter-lab.png
    :alt: Accessing JupyterLab on navigation bar


You will then need to configure the settings for your JupyterLab session. For general use, Dr.Young recommends
the partition be set to **rg-dev** using the **crush** node. 
You can select the hours and CPU settings according to your needs. 
For general use (i.e not ML training, HPC tasks) you should not need more than 1 CPU. 

.. figure:: ../figures/general/ood-navbar-jupyter-lab.png
    :alt: Setting JupyterLab session settings

Once you have configured the session settings, hit the launch button.

Your JupyterLab should now be queued. You will be taken to a screen that looks like so:
.. figure:: ../figures/general/ood-jupyter-lab-queued.png
    :alt: JupyterLab session queued

Once your JupyterLab session is ready, its status will be shown. You can connect to the session by clicking *Connect to Jupyter*.

.. figure:: ../figures/general/ood-jupyer-lab-running.png
    :alt: JupyerLab session running

Finally you will be redirected to your JupyterLab session! It should look something like this:
.. figure:: ../figures/general/jupyter-lab-example2.png
    :alt: Example JupyterLab session

Overview of Starting a JupyerLab session on Open OnDemand:
`CRNCH OOD Login Page <https://rg-ood.crnch.gatech.edu>` -> Interactive Apps -> JupyterLab -> JupyerLab Settings -> Session Queue -> Session Running -> Connect to JupyterLab

