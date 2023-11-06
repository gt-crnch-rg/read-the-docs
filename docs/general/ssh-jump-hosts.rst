===========================
SSH Keys and SSH Jump Hosts
===========================

SSH Keys
--------

We highly recommend that you generate and use a newer ed25519 or RSA key to connect to the Rogues Gallery testbed. Note that your private key should only be readable by you if you put it in your `/nethome/<username>/.ssh/` folder. 

Remember that to log in to a remote server, your *public* key needs to be added to the remote server's `authorized_keys`. You can use tools like `ssh-copy-id` to add your public key to the testbed.

.. note:: 

  To make your setup even more secure, we recommend generating two SSH keys: 1) one on your local machine that you use to connect to the   
  testbed and 2) a separate key that you put in your testbed `/nethome` .ssh folder and that is used just to SSH around to other nodes 
  within the testbed. In this way, your private SSH key on your local machine can be used to log into more than one testbed or service 
  withoutexposing it to potential attackers. 

As a simple example, please use the following syntax to generate a "local" SSH key for your account 

.. code::

  #Generate a new SSH key
  rg-login$ ssh-keygen -t ed25519
  
  ssh-keygen -t ed25519 
  Generating public/private ed25519 key pair.
  #Hit enter to save as default
  Enter file in which to save the key (<user_nethome>/.ssh/id_ed25519):
  #It's ok to not use a passphrase for "local" launching of jobs on systems like the Pathfinder
  Enter passphrase (empty for no passphrase):
  Enter same passphrase again:
  Your identification has been saved in <user_nethome>/.ssh/id_ed25519).
  .. Added details about your key

  #Add your public key to your authorized_keys file
  rg-login$ ssh-copy-id rg-login.crnch.gatech.edu
  #Enter your password and then check that your pubkey is in <user_nethome>/.ssh/authorized_keys

Review these resources if you are not familiar with SSH keys!

- `Generating new SSH keys <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>`__
- `ssh-copy-id and authorized_keys <https://www.ssh.com/academy/ssh/copy-id>`__

SSH Keys for Github repos
~~~~~~~~~~~~~~~~~~~~~~~~~
We strongly encourage you to read up about how to use SSH keys or personal access tokens with your Github repositories, as these are key tools for pulling code from remote repos and pushing changes and updates. 

- `Github SSH Keys <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account>`__
- `Github Personal Access Tokens (required for https actions and using GT Github outside of the VPN) <https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens>`__

SSH Config Files
----------------
You can set options like keys, login parameters, or short aliases for specific remote nodes in the Rogues Gallery cluster or other related testbeds using a user-specified config file, located at `~/.ssh/config`. 

Read more about SSH configuration files `here <https://www.ssh.com/academy/ssh/config>`__.

SSH Jump Hosts
--------------
You can add an `SSH jump host <https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts>`__ to your SSH config file to allow applications to jump to a secondary node for use with `VNC <https://gt-crnch-rg.readthedocs.io/en/main/general/using-gui-with-vnc.html>`__ or `Visual Studio Code <https://gt-crnch-rg.readthedocs.io/en/main/general/visual-studio-code.html>`__. Note that this guide assumes that you have an active session on the target compute node - you may need to make a `Slurm reservation <https://gt-crnch-rg.readthedocs.io/en/main/general/using-slurm.html>`__ for a specific compute server. 

The example below shows how to add an SSH key to log in to `rg-login` and also a jump host to `hawksbill`, one of our general development machines. 

.. code::

  #Add to your .ssh/config. This example uses an SSH key
  Host rg-login
  HostName rg-login.crnch.gatech.edu
        User gburdell
        IdentityFile ~/.ssh/id_rsa

  Host hawksbill
        HostName hawksbill.crnch.gatech.edu
        User gburdell
        ProxyJump rglogin

Usage of each of these jump hosts would look similar to the following commands:

.. code::

  <local laptop/terminal>:~$ ssh rg-login
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
