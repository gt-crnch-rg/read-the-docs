Visual Studio Code
========================

This page details how to add both rg-login to your SSH config file and also how you can add a jump host for use with `Visual Studio Code <https://gt-crnch-rg.readthedocs.io/en/main/general/visual-studio-code.html>`__.

.. code::

  #Add to your .ssh/config. This example uses an SSH key
  Host rglogin
  HostName rg-login.crnch.gatech.edu
        User gburdell
        IdentityFile ~/.ssh/id_rsa

  Host hawksbill
        HostName hawksbill.crnch.gatech.edu
        User gburdell
        ProxyJump rglogin
