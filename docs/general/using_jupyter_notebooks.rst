Last updated: 12/6/21

We suggest using JupyterLab as your interface for neuromorphic, quantum,
and reconfigurable research. PACE has a `nice
article <https://docs.pace.gatech.edu/interactiveJobs/jupyterInt/>`__ on
using Jupyter notebooks we also recommend. Eventually we will support
schedulable Jupyter notebooks via our Slurm scheduler.

*Note*: If you are running a long-running job like ML training we
recommend that you don't use port forwarding as closing your local
machine/web browser will likely stop or pause any actions within the
Jupyter notebook. You alternatively can use
`VNC <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BMisc%5D-Using-GUI-applications-with-VNC>`__
or
`x2go <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BMisc%5D-Using-GUI-applications-with-X2Go>`__
to create a remote server and you can then run your notebook within a
browser in that remote terminal session.

Using jump hosts to access Jupyter notebooks
============================================

Note that these techniques will let you use "port forwarding" to forward
the Jupyter notebook to your local machine.

First connect from your local terminal to this server using SSH
forwarding for a specific port:

.. code:: 

   ssh -L 59801:localhost:59801 -C -J rg-login.crnch.gatech.edu rg-quantum-dev.crnch.gatech.edu

Then start your JupyterLab instance on the node you want to use a
notebook with:

.. code:: 

   rg-quantum-dev:$ jupyter-lab --no-browser --port 59801 
   [W 21:20:20.924 LabApp] JupyterLab server extension not enabled, manually loading...
   [I 21:20:20.931 LabApp] JupyterLab extension loaded from /nethome/gtburdell/.local/lib/python3.8/site-packages/jupyterlab
   [I 21:20:20.931 LabApp] JupyterLab application directory is /nethome/gtburdell/.local/share/jupyter/lab
   [I 21:20:20.934 LabApp] Serving notebooks from local directory: /nethome/gtburdell/git_repos/vip_class
   [I 21:20:20.935 LabApp] Jupyter Notebook 6.1.5 is running at:
   [I 21:20:20.935 LabApp] http://localhost:59801/?token=f59c32ebccccbc3f3036bfd32b8f62a47b48442085f3f4a2
   [I 21:20:20.935 LabApp]  or http://127.0.0.1:59801/?token=f59c32ebccccbc3f3036bfd32b8f62a47b48442085f3f4a2
   [I 21:20:20.935 LabApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
   [C 21:20:21.002 LabApp]

       To access the notebook, open this file in a browser:
           file:///nethome/gtburdell/.local/share/jupyter/runtime/nbserver-14090-open.html
       Or copy and paste one of these URLs:
           http://localhost:59801/?token=f59c32ebccccbc3f3036bfd32b8f62a47b48442085f3f4a2
        or http://127.0.0.1:59801/?token=f59c32ebccccbc3f3036bfd32b8f62a47b48442085f3f4a2

Connect locally to the notebook using your web browser with the token
provided.

.. code:: 

   http://localhost:59801/?token=f59c32ebccccbc3f3036bfd32b8f62a47b48442085f3f4a2

Alternative method: use the provided setup script
-------------------------------------------------

This method provides a randomized port number for you to use and is
preferred. It still requires creating a tunnel to your home machine but
shares the string to do so with you:

.. code:: 

   ./tools/misc/scripts/start_jupyter_notebook.sh
   ==========================================================
      Connect to this instance using port forwarding in another terminal from your machine with the following string:
      ssh -L 54050:localhost:54050 -C -J rg-login.crnch.gatech.edu notebook.crnch.gatech.edu
      1) Then Connect your browser to http://localhost:54726/<yourtoken>
      2) When done, use Ctrl-C and y to exit the jupyter port forwarding environment
   ==========================================================

   [I 14:35:34.137 LabApp] JupyterLab extension loaded from /nethome/gburdell/.local/lib/python3.8/site-packages/jupyterlab
   [I 14:35:34.137 LabApp] JupyterLab application directory is /nethome/gburdell/.local/share/jupyter/lab
   [I 14:35:34.140 LabApp] Serving notebooks from local directory: /net/tools/misc
   [I 14:35:34.140 LabApp] Jupyter Notebook 6.1.5 is running at:
   [I 14:35:34.140 LabApp] http://localhost:54050/?token=ccc0907e7f4f22ed7c25dbcbc63ce6512e34e3fbbca5c077
   [I 14:35:34.140 LabApp]  or http://127.0.0.1:54050/?token=ccc0907e7f4f22ed7c25dbcbc63ce6512e34e3fbbca5c077
   [I 14:35:34.140 LabApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
   [C 14:35:34.145 LabApp]

       To access the notebook, open this file in a browser:
           file:///nethome/gburdell/.local/share/jupyter/runtime/nbserver-1303810-open.html
       Or copy and paste one of these URLs:
           http://localhost:54050/?token=ccc0907e7f4f22ed7c25dbcbc63ce6512e34e3fbbca5c077
        or http://127.0.0.1:54050/?token=ccc0907e7f4f22ed7c25dbcbc63ce6512e34e3fbbca5c077

Example images of Jupyter notebook usage
----------------------------------------

Figure 1: Example of using the JupyterLab token to connect locally

Figure 2: JupyterLab session with Qiskit code

**Note:** Remember to close both your jump session and your jupyterlab
session when you are finished!
