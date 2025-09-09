Apptainer Sandboxes
===================

An Apptainer Sandbox is an intermediate representation of an Apptainer
container that exists as a filesystem on your development node. Similar
to how Docker allows you to add "layers" to a container, the Apptainer
sandbox allows you to update a base container image with your own files
and packages to customize it for your workflow. You can also use this to
test a single-node workflow before deploying it at scale on a cloud or
cluster environment.

Creating a Sandbox
------------------

You first want to create a basic sandbox from a base Apptainer or Docker
image. Here we've used an Ubuntu24 image and told Apptainer that we want
to create a sandbox, ``coolproj``.

.. code:: 

   dev_node:/localscratch/gburdell$ apptainer build --fix-perms --sandbox coolproj docker://ubuntu:24.04
   INFO:    Starting build...
   INFO:    Fetching OCI image...
   28.3MiB / 28.3MiB [================================================================================] 100 % 11.6 MiB/s 0s
   INFO:    Extracting OCI image...
   WARNING: The --fix-perms option modifies the filesystem permissions on the resulting container.
   INFO:    Inserting Apptainer configuration...
   INFO:    Creating sandbox directory...
   INFO:    Build complete: coolproj
   
   dev_node$ ls coolproj
   bin   dev          etc   lib    media  opt   root  sbin         srv  tmp  var
   boot  environment  home  lib64  mnt    proc  run   singularity  sys  usr

Adding files to your sandbox
----------------------------

Note that the sandbox is just a local filesystem at this point. We can
write files to the filesystem and even modify their permissions!

.. code:: 

   gburdell@dev_node:/localscratch/gburdell$ echo -e '#!/bin/bash\necho "Check out this excellent sandbox!"' > coolproj/opt/welc
   ome-msg.sh
   gburdell@dev_node:/localscratch/gburdell$ chmod o+x coolproj/opt/welcome-msg.sh

To run the sandbox as a container, we use similar syntax as
``apptainer shell`` except with a directory, ``coolproj`` instead of a
``.sif`` file. Here we have added the following options:

-  ``--cleanev`` - don't carry over any of your existing environment
   variables

-  ``--fakeroot`` - we use fakeroot here to work inside the container as
   a sudo or root user

-  ``--writable`` - this is a key flag for sandboxes. Unlike normal
   Apptainer containers, the sandbox can be updated and changes will be
   saved after the user leaves the container.

-  ``--cwd /opt`` - this optional flag tells Apptainer to start the
   container and put the user in ``/opt`` instead of ``/root``.

.. code:: 

   gburdell@dev_node:/localscratch/gburdell$ apptainer shell --cleanenv --fakeroot --writable --cwd /opt coolproj
   WARNING: Skipping mount /etc/localtime [binds]: /etc/localtime doesn't exist in container
   
   #Now we can run the script we added in the previous step
   Apptainer> . /opt/welcome-msg.sh
   Check out this excellent sandbox!

Using apt to install packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can edit and add files in sandbox mode, update environment
variables, and most importantly build and install new packages.

.. code:: 

   dev_node$ apptainer shell --cleanenv --fakeroot --writable --cwd /root coolproj
   WARNING: Skipping mount /etc/localtime [binds]: /etc/localtime doesn't exist in container
   
   #Run apt update
   Apptainer> apt update
   ...
   All packages are up to date.
   
   #Install your packages - in this case, we'd like to add GCC 13 to our container image
   Apptainer> apt -y install gcc-13
   
   #You may also want to clean up the package cache if you have run many update/install operations or if you have temporary installation files from a local installation
   Apptainer> apt clean

Saving a new image from your sandbox
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: 

   # We use the fakeroot flag again to avoid errors on reading `coolproj/var/cache/apt/...`
   dev_node$ apptainer build --fakeroot coolproj.sif coolproj
   dev_node$ apptainer shell coolproj.sif
   Apptainer> gcc-13 --version
   gcc-13 (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
   Copyright (C) 2023 Free Software Foundation, Inc.
   This is free software; see the source for copying conditions.  There is NO
   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Note that the final file sizes will vary in size: Sandbox Directory >> New
Apptainer > Base Apptainer

As you add more files to your image, the container size will naturally
grow, so be cautious about how many packages you add by default!

.. code:: 

   # Sandbox directory
   336M    coolproj
   # The updated container is slightly bigger due to the addition of the GCC 13 toolchain
   140M    coolproj.sif
   # Note the "base" image is only 29 MB
   29M     ubuntu24.04.sif

Creating a new Apptainer definition file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You are now ready to use your newly created sandbox container, but you
might also want to save the commands you used to create this new
container image for **reproducibility purposes**. You can do this using
``history -w`` from inside the container.

.. code:: 

   Apptainer> history -w /opt/sandbox_history.txt
   Apptainer> exit
   
   #Check the file you saved for the correct commands to add to the %post section in your definition file!
   tail coolproj/opt/sandbox_history.txt
