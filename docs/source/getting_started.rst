============
Getting Started with Rogues Gallery
============

*Last updated: October 30, 2020*

How do I request an account on the Rogues Gallery?
--------------------------------------------------

Users external to Georgia Tech should request a new account using our form on the CRNCH page
`here <http://crnch.gatech.edu/request-rogues-access>`__. GT users can just email
us at *crnch-rg-admin@lists.gatech.edu*. We will need your GT (Passport) username 
to add login access.

How do I ssh to the RG machines?
--------------------------------

To access Rogues Gallery machines from off campus you need to either use the GT VPN or the
login node, ``rg-login.crnch.gatech.edu``. From this node you can SSH to
other nodes.

**Some of the Rogues Gallery machines include:**

Note that all machines have a **.crnch.gatech.edu** suffix

-  **rg-login** login VM for off-campus access. Used
   as a gateway node
-  **rg-emu-dev:** VM for Emu compilation and
   simulation
-  **rg-fpga-dev-<1-3>:** VMs for FPGA compilation and
   simulation
-  **rg-neuro-dev:** VM for neuromorphic tools
-  **flubber<1-3>:** physical boxes containing FPGAs
-  **notebook:** a Jupyter notebook VM
-  **octavius-login:** an x86 VM for running jobs on the A64FX cluster
-  **rg-fpaa-host:** Raspberry Pi that acts as a
   gateway host for the FPAA prototype
-  Please see `this
   page <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/RG-Hardware>`__
   for a complete list of available machines in the RG testbed

Use your GT username and password to log into the system. rg-login is
available from off the campus network and VPN, and other nodes are
accessible from the login node.

What's this about the VPN?
--------------------------

You can access all CRNCH resources using login nodes like rg-login. However, you can
also use GT's
`VPN <https://faq.oit.gatech.edu/content/how-do-i-get-started-campus-vpn>`__
solution as an alternative to access VMs and nodes directly. Note that this may require that you set up two-factor
authentication on your phone and link it with your account name. You
shouldn't need to use the VPN to access Rogues Gallery resources and
materials, but for special requirements please email us at
*crnch-rg-admin@lists.gatech.edu*.

How do I work with *novel architecture of interest X*?
------------------------------------------------------

First of all, check the wiki sidebar for the appropriate architecture
category and read through the existing documentation. Once you have done
this, if you have questions please `ask on Teams or via help
ticket <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/RG-Mailing-Lists-and-Requesting-Help>`__.

What are some best practices for using the RG hardware?
-------------------------------------------------------

1. Make sure to back your code up, preferably with a GT Github or
   external Github. While we do have a `shared
   filesystem <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/RG-Filesystems>`__,
   this can possibly experience a hardware failure.
2. Use `tmux or
   screen `__
   on the login and development VMs, especially when running tests.

How do I ask for assistance? Is there a mailing list?
-----------------------------------------------------

Please refer to this
`page <https://github.gatech.edu/crnch-rg/rogues-docs/wiki/RG-Mailing-Lists-and-Requesting-Help>`__
for more details.
