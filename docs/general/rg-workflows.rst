Rogues Gallery Workflows
========================

*This page is currently a work in progress!*

Novel and post-Moore architectures typically have a specific workflow
that incorporate some aspect of simulation or "emulation" before running
on actual hardware. In a sense, this is because novel architectures are
typically challenging to program or have some beta features that may
crash when running a full program.

This page provides a guide for the general "suggested" workflows to be
productive on the Rogues Gallery. Most of these workflows incorporate
the usage of our Slurm job scheduler to request and use physical
resources like servers and FPGAs.

Arm HPC
-------

Reconfigurable - Xilinx
-----------------------

Reconfigurable - Intel
----------------------

Bluefield Networking
--------------------

Lucata Pathfinder
-----------------

Neuromorphic 
-------------

Whenever possible, I suggest using `Visual Studio Code <https://code.visualstudio.com/>`__
along with the `Remote Development Extension Pack <https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack>`__
to SSH to ``rg-neuro-dev.crnch.gatech.edu``. This allows you to navigate folders
and edit code with the power and convenience of VS Code and its many excellent extensions.

If you do use VS Code, I suggest configuring your SSH configuration file for easy
access to rg-login and rg-neuro-dev so that you don't have to remember hostnames nor worry
about whether you are on the campus VPN or not. 

1. After installing the Remote Development Extension Pack, click the green button on the bottom left corner of the screen.
2. A dialog will open at the top, select ``Connect to Host`` then select ``Configure SSH Hosts...``.
3. You should have at least one ``config`` file listed here, if there are multiple then just select the one associated with your current user.
4. This will open the ``config`` file in the VS code editor, from here follow this format to add a host to your file:

.. code:: bash

    Host RG-Login
    HostName rg-login.crnch.gatech.edu
    User jwood78

.. code:: bash

    Host RG-Neuro-Dev
    HostName rg-neuro-dev.crnch.gatech.edu
    User jwood78
    ProxyJump RG-Login

This has added ``rg-login``, and below that ``rg-neuro-dev``. Pay special notice to the ``ProxyJump`` 
option which will route your connection to ``rg-neuro-dev`` through ``rg-login`` first. 

Done! Now, if you select that green button again, then ``Connect to Host``, you can pick either ``rg-login`` or ``rg-neuro-dev`` as options.

For GUI applications, or if you just don't want to use VS Code, use x2go. Setup instructions for that can be found `here <https://gt-crnch-rg.readthedocs.io/en/main/general/using-gui-with-x2go.html?highlight=x2go#how-do-i-quickly-get-started-using-x2go-on-crnch-resources>`__.

Quantum
-------
