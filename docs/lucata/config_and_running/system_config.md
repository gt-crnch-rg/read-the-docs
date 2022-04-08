Configuration files stored on the control boards in `/etc/emutechnology/`.  These files are created by `emu_system_init_config` (pathfinder) and/or `emu_chassis_init_config` (chick); the `emu_system_init_config` script will invoke the `emu_chassis_init_config` script in pathfinder systems.  In general, these initialization scripts should be run at system install or when the HW is reconfigured in some way.  OS updates will preserve these files.

For multiple chassis, `emu_system_init_config` will also update `/etc/hosts` and SSH known host keys for system node (sn*) aliases.  After configuration, every CCB and nodes should recognize each other as known hosts.  Note that the 10GbE link on the CCB is used to route TCP/IP traffic from one chassis to another.

These files are separated into sets that identify the physical and logical organizations of the system.  Additionally, as these files are persistent across reboots, we can consider bringing up system components as part of the chassis/node boot process

* RackID, SystemRackID
* ChassisID, SystemChassisID, LogicalChassisID
* SystemChassisCount, LogicalSystemChassisCount
* NodesInChassis
* LocalNodesUsedInLogicalConfig; should be power-of-2
* LogicalConfig: Quick glance at system config; current options are: full, partitioned, single, subsingle
  * Full is for pathfinder systems using all nodes
  * Partitioned is a pathfinder system using a subset of nodes
  * Single is single chassis mode
  * Subsingle is for configs that use fewer than 8 nodes in the chassis
* SystemType: same values as on nodes

NOTES:  
* SystemRackID, SystemChassisID will always start at 0,0 and **must** correspond to the routing diagrams.  Having these allows a customer to set/modify RackID, ChassisID to suit their requirements.
* LogicalChassisID becomes a 0-(LogicalSystemChassisCount-1) value; this is used for putting the connections to the local nodes into the routing tables.

There is another configuration file necessary on SystemRackID=0, SystemChassisID=0 of a **pathfinder** system:
* ChassisList: text file of CCBs in system; will be used to create a list of hosts to PDSH into and configure.  ONE CCB PER LINE!  These should be in numerical order!
* MUST BE INCLUDED TO RUN THE INIT SCRIPT.
