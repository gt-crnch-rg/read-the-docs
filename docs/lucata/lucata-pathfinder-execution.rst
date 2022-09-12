*Last updated: 4/07/2022*

Lucata Pathfinder Execution
============

Following our workflow guide for the Lucata Pathfinder platform, you will normally work through the following phases:
1) Running code on an x86 machine with the memoryweb library
2) Running code in untimed and timed mode using the simulator, emusim.
3) Running code on a single node of the Pathfinder system
4) Running code on multiple **nodes** within a single chassis.
5) Running code on multiple **chassis**.

Here we go through the last 3 steps in more detail. 

Checking the status of the system:
------------------------

Check all nodes in the system to see if it is multi-chassis, single-chassis, or single-node
`emu_system_cmd -p -c {0..3} -- 'emu_chassis_get_configs -l {0..7}'`

Single Node PF Execution
-------------

Multi-node PF Execution
-------------

Multiple-chassis PF Execution
-------------

