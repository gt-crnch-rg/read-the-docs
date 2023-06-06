============
Getting Started with Rogues Gallery
============

How do I request an account on the Rogues Gallery (RG)?
--------------------------------------------------

Users should request a new account using our form on the CRNCH page `here <http://crnch.gatech.edu/request-rogues-access>`__. Note that it may take 2-3 business days for your account to be added after you are approved. 

For both internal and external users, we ask for "an RG contact". If you've talked to one of the key personnel for the RG testbed you can put this person down, or you can put down your research advisor if you are external to GT but working at a university. 

For GT users, please put your research advisor or down one of the testbed personnel you have talked to. We will also need your GT (Passport) username to add login access for you. 

**NOTE:** For GT faculty or staff looking to add new *external* users, it is very helpful to us if you can sponsor the users as `Passport guests <https://support.cc.gatech.edu/faq/how-do-i-sponsor-guest-accounts>`__. Then the above form can be filled out with the external user's guest username which helps to streamline the access process. You can sponsor a guest account with Passport for up to one year and then renew the user if they are still an active collaborator. 


How do I Access RG machines?
--------------------------------

**NOTE: You should use your GT Passport username (e.g, gburdell3) and password to access all CRNCH RG nodes and resources!**

Once you receive a note that your account has been approved, you can test your login to the testbed. To access Rogues Gallery machines from off campus you need to either

1) SSH to the testbed via the login node from a terminal session.

OR

2) Use Open OnDemand for a GUI-based session. See `this page for more information on using Open OnDemand <https://gt-crnch-rg.readthedocs.io/en/main/general/open-on-demand.html>`__

For SSH, you should use your Georgia Tech account username and password to log into all nodes using the gateway login node, ``rg-login.crnch.gatech.edu``. ``rg-login`` is available from off the campus network and the VPN, and other nodes are accessible from the login node. As an example:

.. code:: shell
   
   <yourmachine>$ ssh <your-gt-acctname>@rg-login.crnch.gatech.edu
   rg-login.crnch.gatech.edu
   =========================

   This is the main RG login node. From this node you can access all CRNCH resources. To see a complete list of available hardware please visit: https://gt-crnch-rg.readthedocs.io/en/main/general/rg-hardware.html
   <your-gt-acctname>@#rg-login$

Once you've logged in, you can use Slurm to request other nodes within the testbed. See more information on Slurm at `this page <https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm.html>`__.

Note that you can also use VSCode to log into the Rogues Gallery via its terminal functionality. See `this page for more details <https://gt-crnch-rg.readthedocs.io/en/main/general/visual-studio-code.html>`__.

What machines are available in the Rogues Gallery?
--------------------------------------------------

Note that all machines have a **.crnch.gatech.edu** suffix and some examples include:

-  **rg-login** login VM for off-campus access. Used as a gateway node
-  **rg-emu-dev:** VM for Emu compilation and simulation
-  **rg-fpga-dev-<1-4>:** VMs for FPGA compilation and simulation
-  **rg-neuro-dev:** VM for neuromorphic tools
-  Please see `this page <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-hardware.html>`__ for a complete list of available machines in the RG testbed

VPN Requirements (for GT users only)
--------------------------
You can access all CRNCH resources using login nodes like `rg-login` or the Open OnDemand web interface. However, you can also use GT's `VPN <https://faq.oit.gatech.edu/content/how-do-i-get-started-campus-vpn>`__ solution as an alternative to access some VMs and nodes directly. Note that this may require that you set up two-factor authentication on your phone and link it with your account name. You shouldn't need to use the VPN to access Rogues Gallery resources and materials, but for special requirements please email us at *crnch-rg-help@cc.gatech.edu*. 

Other Georgia Tech resources like PACE's Phoenix cluster require the usage of the VPN, and you can read more about these requirements at their `site <https://docs.pace.gatech.edu/phoenix_cluster/logon_phnx/>`__

How do I work with *novel architecture of interest X*?
------------------------------------------------------

First of all, check the sidebar for the appropriate architecture category and read through the existing documentation. Note that we are migrating some of our pages from our internal wiki to this public ReadTheDocs site over the next few months. You can use your GT username and password to log into the internal wiki.

Once you have done this, if you have questions please `ask on Teams or via help ticket <https://gt-crnch-rg.readthedocs.io/en/main/general/mailing-list-help-tickets.html>`__.

-  `Rogues Gallery Hardware Master
   List <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-hardware.html>`__

-  `Lucata Pathfinder Getting
   Started <https://gt-crnch-rg.readthedocs.io/en/main/lucata/lucata-getting-started.html>`__

-  `Reconfigurable Computing HW and
   Tools <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BReconfig%5D-FPGA-Hardware-and-Tools>`__

   -  `Intel FPGAs Getting
      Started <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BReconfig%5D-Intel-FPGAs---Getting-Started>`__

   -  `Xilinx FPGAs Getting
      Started <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BReconfig%5D-Xilinx-FPGAs--Getting-Started>`__

-  `Quantum
   Computing <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BQuantum%5D-Quantum-Tools-and-Software-Stacks>`__

-  `Neuromorphic
   Computing <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BFPAA%5D-Getting-Started-with-the-FPAA>`__

-  `Smart
   Networking <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BNetworking%5D-Mellanox-BlueField-Resources>`__

-  `RISC-V <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/%5BRISC-V%5D-SiFive-Unmatched>`__


What are some best practices for using the RG hardware?
-------------------------------------------------------

1. Make sure to back your code up, preferably with a GT Github or external Github repository. While we do have a `shared filesystem <https://gt-crnch-rg.readthedocs.io/en/main/general/rg-filesystems.html>`__, this can possibly experience a hardware failure.
2. Use tmux or screen on the login and development VMs, especially when running tests.

How do I ask for assistance? Is there a mailing list?
-----------------------------------------------------

Please refer to this `page <https://gt-crnch-rg.readthedocs.io/en/main/general/mailing-list-help-tickets.html>`__ for more details on asking for help and posting to RG community groups and mailing lists.
