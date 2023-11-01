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

This page assumes that your application runs correctly with emusim.x: 

.. code:: shell

    rg-emu-dev$> emusim.x --total_nodes 2 -m 24 -- hello-world-spawn.mwx

        SystemC 2.3.3-Accellera --- Jul 13 2023 18:00:55
        Copyright (c) 1996-2018 by all Contributors,
        ALL RIGHTS RESERVED
    Hello, world!

    Info: /OSCI/SystemC: Simulation stopped by user.

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

Note that we also have a helper script that gets updated with the current status of the system that can be run from other nodes:

```
/projects/tools/lucata/pathfinder_current_status.sh
Chassis 0 is in multinode (LN 0..7)
Chassis 1 is in multinode (LN 8..15)
Chassis 2 is in multinode (LN 0..7)
Chassis 3 is in multinode (LN 0..7)
```

Single Node PF Execution
------------------------

Multi-node PF Execution
-----------------------

Multiple-chassis PF Execution
-----------------------------

Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~
See our `dedicated page for common issues and troubleshooting <>`__. In many cases, these can be resolved via reconfiguration by the admins or Slurm tooling.
