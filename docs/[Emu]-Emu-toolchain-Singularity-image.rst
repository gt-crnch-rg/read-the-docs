.. code:: 

   _Last updated: 3/22/2019_
   
   **Note: The Emu toolchain is provided under a Georgia Tech-associated NDA. It is fine to use this image for your personal research and coursework, but do not post the toolchain or this image publicly on any external resources (i.e., outside of GT Github or GT-hosted servers).**
   
   ## What is Singularity?
   Singularity is a containerization solution that is geared towards scientific and high-performance computing applications. A good way to think of the differences between Singularity and Docker is that Singularity is focused on supporting features that normally are only available in HPC systems like InfiniBand networking and PCI Express-enabled GPUs. Docker and Singularity share many features, and Singularity can typically work with and import Docker-based containers. 
   
   More resources:
   * [Singularity tutorial](https://singularity.lbl.gov/quickstart) - Note this QuickStart requires a system where you have root to build new containers.
   * [Singularity whitepaper](https://www.sylabs.io/wp-content/uploads/2019/01/Sylabs_Whitepaper_High_performance_server_v3.pdf)
   
   ## Using the Emu toolchain with Singularity
   We provide a Singularity image for a few reasons: 1) It allows us to package the python dependencies with the toolchain, regardless of the base OS. 2) The image also allows users to run the compiler toolchain and the simulator on other nodes (or their laptops) to free up scarce compute resources on our host VMs.
   
   ### Using the Singularity image
   
   To use the image, you can call it with a specific Emu toolchain command. As an example:
   ```
   singularity exec /tools/emu/singularity/emu-toolchain-19.02.img emusim.x <your MWX file>
   ```
   
   ### Building the Singularity image
   As a user, you shouldn't need to build or rebuild the Singularity image. For administrators, please see the build scripts in the toolchain repo [here](https://github.gatech.edu/crnch-rg/emu-toolchain-defs). 
   
   ### Using Singularity on your local machine (Windows or Mac OSX)
   Both of these setups typically require a Vagrant and VirtualBox VM backend to run Singularity, which is well documented on the newer Singularity [page](https://www.sylabs.io/guides/3.0/user-guide/installation.html#install-on-windows-or-mac).
   
   Once you have vagrant up and running with Singularity, you will want to add a sync'ed folder to share your local Emu image. Edit your Vagrantfile (in the vm-singularity directory or wherever you started vagrant) to add the following:
   
   ```
   #Leave this top part of your Vagrantfile alone
   Vagrant.configure("2") do |config|
     # other config here
   
   #Uncomment this line and edit it to match your local directory - we assume "emu" has the tools Singularity image.
     config.vm.synced_folder "~/vm-singularity/emu/", "/usr/local/emu"
   ```
   
   Then reboot your Vagrant VM with `vagrant halt` and `vagrant up`. You should see a line that includes mounting the shared folders.
   
   ```
   ==> default: Mounting shared folders...
       default: /vagrant => /Users/jyoung/vm-singularity
       default: /usr/local/emu => /Users/jyoung/vm-singularity/emu
   ```
   
   *Note:* Right now, the singularity image cannot be used from this synced folder share. Presumably this is a permissions issue, but we can get around this by copying the image to our home directory. 
   
   ```
   #Error you get if you try to run from the synced folder share - there is probably a reasonable fix for this
   singularity exec /usr/local/emu/emu-toolchain-19.02.img emusim.X
   FATAL:   container creation failed: mount error: can't mount image /proc/self/fd/8: failed to mount squashfs filesystem: input/output error
   
   #Get around the error by scp-ing the image inside your VM or just copy it from your sync'ed folder
   #SCP semantics
   hostmachine:/home/username/singularity-vm/emu$ scp -P 2222 emu-toolchain-19.02.img vagrant@127.0.0.01:~/.
   The authenticity of host '[127.0.0.1]:2222 ([127.0.0.1]:2222)' can't be established.
   ECDSA key fingerprint is SHA256:yY1Ub/uUVN+tyBPaq1fAxpu9wLkdSq0q42Q1WjnzL2w.
   Are you sure you want to continue connecting (yes/no)? yes
   Warning: Permanently added '[127.0.0.1]:2222' (ECDSA) to the list of known hosts.
   #Default password is vagrant
   vagrant@127.0.0.1's password: 
   emu-toolchain-19.02.img                                               8%  304MB  48.4MB/s   01:09 ETA^Clawn-128-61-21-139:emu jyoung$ scp -P 2222 emu-toolchain-19.02.img vagrant@127.0.0.01:~/.
   vagrant@127.0.0.1's password: 
   
   #OR from the Vagrant VM, copy from the shared files and then run
   vagrant:]$cp /usr/local/emu/emu-toolchaing-19.02.img ~/.
   vagrant:$singularity exec ~/emu-toolchain-19.02.img emusim.x --version
           SystemC 2.3.1-Accellera --- Feb 15 2019 08:53:31
           Copyright (c) 1996-2014 by all Contributors,
           ALL RIGHTS RESERVED
   Version=EMUSIM-19.02
   ```
   
   Remember when running the Emu simulator, emusim, that you need to set the -n and -m flags or else you will get an out of memory error (`ERROR: NodeInterpreter(unsigned, unsigned): out of memory!!`). See the following example running one node (8 GCs) with the smallest memory size per node with our SpMV example:
   
   ```
   emusim.x -n 1 -m 26 csr_spmv.mwx synth 100 2 1 64
   
           SystemC 2.3.1-Accellera --- Sep 27 2018 10:58:07
           Copyright (c) 1996-2014 by all Contributors,
           ALL RIGHTS RESERVED
   Total log2_num_nodelets < log2_nodelets_per_node; setting log2_num_nodelets to be one node
   Start untimed simulation with local date and time= Fri Mar 22 13:49:32 2019
   
   Generate Laplacian Matrix ...
   Input file: (null) 
   n: 100 
   data_dist: 2 
   Output file: (null) 
   Number of nodelets: 8 
   Recursive spawn is 1
   CSR Matrix: nrows=10000, ncols=10000, nnz=49600
   nthreads: 64
   grainsize: 156
   nloops: 5
   Initializing x
   Initializing y
   Starting CSR multiply
   {"matrix_type":"synthetic","input_file":"(null)","laplacian_size":100,"data_layout":2,"output_file":"(null)","num_nodelets":8,"spawn_mode":1,"num_row":10000,"num_cols":10000,"nnz":49600,"nthreads":64,"grain_size":156,"num_trials":5,"replicate_x":1,"region_name":"spmv","time_ms":4.86,"ticks":1456768}
   Average time (5 loops) for CSR Sparse Ax, clocks = 0 
   Results match
   End untimed simulation with local date and time= Fri Mar 22 13:49:34 2019
   ```
   
   #### Vagrant Resources
   [Vagrant commands for Mac](http://sourabhbajaj.com/mac-setup/Vagrant/README.html)
   
   [Synced Folders link](https://www.vagrantup.com/docs/synced-folders/basic_usage.html)
