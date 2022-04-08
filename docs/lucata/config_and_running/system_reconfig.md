There are now scripts to reconfigure the system.  The system can be reconfigured before or after initialization.  Running `emu_chassis_get_configs` on every chassis will inform you how each one is configured.

* `emu_system_reconfig`: pathfinder only, calls `emu_chassis_reconfig`
* `emu_chassis_reconfig`: call directly only on Chicks.
  * Call directly on a pathfinder chassis only after running `emu_system_reconfig` (this is how nightly regressions are handled).  While there are sanity checks build into this script, running it on a single pathfinder chassis without running emu_system_reconfig.sh **may** be risky to other users.

***

## Commentary:
The initialization and reconfiguration scripts for pathfinder are designed to treat a pathfinder as a cohesive system rather than separate boxes wired together.  This change of mindset should continue to be reflected as software is modified.  Shouldn't hurt to run `emu_switch_diagnostic --reconfigure_routing_tables` on any chassis.

***

## Script Assumptions
* All control boards (CBs) and nodes are powered on
* All CBs are reachable from SystemRackID=0, SystemChassisID=0; every CB can reach every node in that chassis
* Every pathfinder chassis has 8 nodes
* Every pathfinder system has a power-of-2 number of chassis
* Pathfinder system is no more than 128 nodes (16 chassis); other programs currently restrict this further (32 is the current max for routing purposes)
* The reconfigure scripts will perform the reconfiguration and perform SRIO checks (if necessary), thus the nodes and CSBs (in pathfinders) must be initialized.
  * Note: Looking to remove this restriction.

## emu_system_reconfig
```
usage: emu_system_reconfig
Must have either -f or -n <val>
	-f,--full                               Configure into maximum size system
	-n,--num_nodes <val>                    Power-of-2 number of nodes to configure into
	-s,--single                             Put all remaining chassis into singlenode mode
	-v,--version                            Print the version and quit
	-h,--help                               Print this message and quit
```
OTHER NOTES:
* Will call `emu_chassis_reconfig` for pathfinder systems
* `/etc/hosts` and system wide SSH known host keys will be updated for the system node aliases (sn*)

## emu_chassis_reconfig
```
usage: emu_chassis_reconfig <config_type> <logical_num_nodes>
arguments are only required if LogicalSystemChassisCount == 1
	<config_type>                           singlenode or multinode
	-s,--skip                               Skip the actual reconfiguration, just change configuration files
	-v,--version                            Print the version and quit
	-h,--help                               Print this message and quit
```
NOTES:
* Nodes 0-<logical_num_nodes-1> will be configured into multinode system; all remaining nodes will be put into singlenode configuration.
* `emu_system_reconfig` should be favored on pathfinders unless you need a mix of singlenode and multinode configurations in different boxes.
* The -s switch should be used if you plan on rebooting and restarting the chassis right after the reconfiguration.  The switch just avoids an unnecessary run of reconfiguration, since a reboot is forthcoming.

## WHAT HAPPENS
* `emu_system_reconfig` sets the necessary files in `/etc/emutechnology/` for each control board in the Pathfinder system; `emu_chassis_reconfig` is then invoked on each control board.
* `emu_chassis_reconfig` script performs the following:
  * Sets the `/var/lock/emu_needs_reconfigured.lock` on all boards.
  * Updates the necessary files in `/etc/emutechnology/` for all boards.
  * Runs `emu_reconfig_node` on the nodes.
    * This will clear `/var/lock/emu_needs_reconfigured.lock` on the nodes.
    * This will also restart the RPC servers to ensure they have their proper node numbers, etc.
* If <config_type> == multinode, runs the appropriate SRIO link checker
* Clears `/var/lock/emu_needs_reconfigured.lock` on the control board.
