SSH Keys and SSH Jump Hosts
========================

SSH Keys
--------------

SSH Jump Hosts
--------------
You can add an `SSH jump host <https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts>`__ to your SSH config file to allow applications to jump to a secondary node for use with `VNC <https://gt-crnch-rg.readthedocs.io/en/main/general/using-gui-with-vnc.html>`__ or `Visual Studio Code <https://gt-crnch-rg.readthedocs.io/en/main/general/visual-studio-code.html>`__. Note that this guide assumes that you have an active session on the target compute node - you may need to make a `Slurm reservation <https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm.html>`__ for a specific compute server. 

The example below shows how to add an SSH key to log in to `rg-login` and also a jump host to `hawksbill`, one of our general development machines. 

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

Usage of each of these jump hosts would look similar to the following commands:

.. code::

  <local laptop/terminal>:~$ ssh rglogin
  ....
  Last login: ....
  gburdell@rg-login:~$ exit

  #Test out jumping directly to hawksbill
  <local laptop/terminal>:~$ ssh hawksbill
  Last login: ....
  gburdell@hawksbill:~$

Note that you can even use scp or rsync since the utilizes the same ssh config file and syntax.

.. code::

  #Copy a test file to your home directory on hawksbill, using rg-login as a jump host 
  <local laptop/terminal>:~$ scp test1 hawksbill:~/.

  #Do the same copy with rsync using ssh syntax
  rsync -av test1 hawksbill:~/.
  building file list ... done
  test1

  sent 143 bytes  received 42 bytes  123.33 bytes/sec
  total size is 19  speedup is 0.10

  
