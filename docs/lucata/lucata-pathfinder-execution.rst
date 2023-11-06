===========================
Lucata Pathfinder Execution
===========================

Following our workflow guide for the Lucata Pathfinder platform, you will normally work through the following phases:
1) Running code on an x86 machine with the memoryweb library
2) Running code in untimed and timed mode using the simulator, emusim.
3) Running code on a single node of the Pathfinder system
4) Running code on multiple **nodes** within a single chassis.
5) Running code on multiple **chassis**.

Here we go through the last 3 steps in more detail. 

Precursor
---------

This page assumes that your application compiles and runs correctly with emusim.x. If it does not, please check the programming guide and fix any functional errors. 

.. code:: shell

    rg-emu-dev$> emusim.x --total_nodes 2 -m 24 -- hello-world-spawn.mwx

        SystemC 2.3.3-Accellera --- Jul 13 2023 18:00:55
        Copyright (c) 1996-2018 by all Contributors,
        ALL RIGHTS RESERVED
    Hello, world!

    Info: /OSCI/SystemC: Simulation stopped by user.

.. note::

   You should set up SSH keys for your account before running on the Pathfinder hardware. This is needed since `emu_multinode_exec` will launch jobs across multiple nodes in the Pathfinder cluster. Please see our `SSH page <https://gt-crnch-rg.readthedocs.io/en/main/general/ssh-jump-hosts.html>`__ for more details if you haven't done this before. 

Checking the status of the system:
----------------------------------

Check all nodes in the system to see if it is multi-chassis, single-chassis, or single-node

.. code::

    $ emu_system_cmd -p -c {0..3} -- 'emu_chassis_get_configs -l {0..7}'
    c0: Running 'emu_report_config' in parallel on n[0,1,2,3,4,5,6,7]...
    c0: n0: Node Initialization Status = initialized.
    c0: n0:         Logical Node 0 in a 32 node system. Node has 8 MSPs, 8 clusters with 2 GCs per cluster.
    c0: n0:         Core clock is at 180 MHz, GC clock is at 225 MHz
    ...
    c3: n7: Node Initialization Status = initialized.
    c3: n7:         Logical Node 31 in a 32 node system. Node has 8 MSPs, 8 clusters with 2 GCs per cluster.
    c3: n7:         Core clock is at 180 MHz, GC clock is at 225 MHz
    c3: Chassis Switch Initialization Status = initialized.

Note that we also have a helper script that gets updated with the current status of the system that can be run from other nodes and from the "CCB" nodes (pathfinder<0-3>):

.. code::

    pathfinder0:$ pathfinder_current_status.sh
    #This output indicates chassis 0 and 1 are in 16-node multinode while the other two chassis are in 8 node multinode
    Chassis 0 is in multinode (LN 0..7)
    Chassis 1 is in multinode (LN 8..15)
    Chassis 2 is in multinode (LN 0..7)
    Chassis 3 is in multinode (LN 0..7)

Single Node PF Execution
------------------------

You can use the `emu_multinode_exec` script which launches an executable across 1-N Pathfinder nodes, but you can much more quickly test small programs with the `emu_handler_and_loader` program. 

.. code::

    # Here the timeout is 0 (no timeout), thread_ID is base 10, and the executable is hello-world-spawn.mwx
    emu_handler_and_loader 0 10 -- hello-world-spawn.mwx
    Hello, world!
    Thread/application exit at TPC=0x8000dd56, with ThreadID=0x000004c2bc7a44fc and return value=0=0x0
    

Multi-node PF Execution
-----------------------

1) Check that the configuration matches what you expect.
2) Go to the first node of the first multinode chassis (typically `pathfinder0->n0`) and launch your job. 

.. code:: 

    #Running from pathfinder2
    n0$> emu_multinode_exec 0 -- hello-world-spawn.mwx
    [STATUS]: Checking nodes to ensure ok to run...
    [STATUS]: Copying hello-world-spawn.mwx to nodes.
    [STATUS]: Launching emu_loader and emu_seq_handler_background on sn1 to sn15
    [STATUS]: Gathering launch logs from non-local nodes.
    [STATUS]: Running emu_handler_and_loader
    Hello, world!
    Thread/application exit at TPC=0x8000dd56, with ThreadID=0x0000049988173dae and return value=0=0x0
    [STATUS]: Run complete; gathering logs.
    [STATUS]: Moving concatenated logs with PID=9328 into /nethome/gburdell/USERSCRATCH/lucata.
    [STATUS]: Checking mn_exec_usr.9328.log for problems...
    [STATUS]: Checking mn_exec_sys.9328.log for problems...


Multiple-chassis PF Execution
-----------------------------

1) Check that the configuration matches what you expect.
2) Go to the first node of the first multinode chassis (typically `pathfinder0->n0`) and launch your job. The execution semantics are the same as the multi-node execution.

.. code:: 

    #Running from pathfinder0
    n0$> emu_multinode_exec 0 -- hello-world-spawn.mwx
    [STATUS]: Checking nodes to ensure ok to run...
    [STATUS]: Copying hello-world-spawn.mwx to nodes.
    [STATUS]: Launching emu_loader and emu_seq_handler_background on sn1 to sn15
    [STATUS]: Gathering launch logs from non-local nodes.
    [STATUS]: Running emu_handler_and_loader
    Hello, world!
    Thread/application exit at TPC=0x8000dd56, with ThreadID=0x0000049988173dae and return value=0=0x0
    [STATUS]: Run complete; gathering logs.
    [STATUS]: Moving concatenated logs with PID=9328 into /nethome/gburdell/USERSCRATCH/lucata.
    [STATUS]: Checking mn_exec_usr.9328.log for problems...
    [STATUS]: Checking mn_exec_sys.9328.log for problems...

Using the local SSDs for fast storage
-------------------------------------

All nodes in the Pathfinder cluster are connected to our shared `/nethome` and `/netscratch` which are connected via 10 and 40 Gigabit Ethernet to the Pathfinder cluster. However, each of the 32 nodes in the system also has a 900 GB SSD that is typically available under `/data` on each node. You might want to use this to load a piece of your data set during a Pathfinder run rather than using network-based storage. 

To use this localscratch, please follow the following steps with the `emu_system_cmd` which is a wrapper for pdsh. 

.. code:: shell

    emu_system_cmd -s -p {0..31} -- 'mkdir -p /data/<your_username>'
    Running 'mkdir -p /data/<gburdell' in parallel on sn[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]...

You can then copy your data to each folder using tools like `pdcp`.

To check how much space is available on each node, you can use the same command with `df`. Note that the `data` folder is just placed under the root directory on each node. 

.. code:: shell

    emu_system_cmd -s -p {0..31} -- 'df -h /'
    ...
    # This will print information on all nodes
    ...
    sn9: Filesystem      Size  Used Avail Use% Mounted on
    sn9: /dev/root       916G  392G  479G  45% /

Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~
See our `dedicated page for common issues and troubleshooting <https://gt-crnch-rg.readthedocs.io/en/main/lucata/lucata-pathfinder-troubleshooting.html>`__. In many cases, these can be resolved via reconfiguration by the admins or via Slurm reconfiguration.
