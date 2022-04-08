The `emu_node_cmd` and `emu_system_cmd` scripts can be used execute commands in parallel to a set of nodes or chassis.  Both use `pdsh` to execute commands on the nodes or chassis and both rely on SSH's known host keys installed in the system to allow commands to be executed w/o requiring passwords. Thus, `emu_node_cmd` can be used out of the box, but `emu_system_cmd` should only be used after a system has been properly configured.

`emu_node_cmd` runs on the chassis controller and as the name suggests, can only run commands to the nodes within a chassis

`emu_system_cmd` also runs on the chassis controller, but is extended to be able to run commands to a set of chassis controllers within a multichassis system, a set of nodes within a multichassis system, or just a set of nodes within a single chassis.  Note that in a multichassis system, any chassis controller can access any other chassis controller or any nodes in the system and thus, one is not limited to run `emu_system_cmd` from just chassis 0.

```
usage: emu_node_cmd NODE_IDS -- COMMAND
	NODE_IDS                                A list of targeted node IDs
	COMMAND                                 The command to execute on each node.  COMMAND must not start as
	                                        a number and should be enclosed in quotes, have special characters
	                                        escaped appropriately, or noglobbing turned on to avoid local shell expansion
	-p,--parallel                           Run the command in parallel using pdsh
	-v,--version                            Print the version string and quit.
	-h,--help                               Print this help message and quit.
```

```
usage: emu_system_cmd IDS -- COMMAND
	IDS                                     A list of targeted hosts
	COMMAND                                 The command to execute on each chassis ccb.  COMMAND must not start as
	                                        a number and should be enclosed in quotes, have special characters
	                                        escaped appropriately, or noglobbing turned on to avoid local shell expansion
	-c,--chassis                            Run the command on chassis controllers (absolute chassis IDs)
	-n,--node                               Run the command on local nodes in this chassis
	-s,--system_node                        Run the command on system nodes
	-p,--parallel                           Run the command in parallel using pdsh
	-v,--version                            Print the version string and quit.
	-h,--help                               Print this help message and quit.
```

## Specifying NODE_IDS or IDS
The list of NODE_IDS or IDS can be specified using shell expressions.  For example, `{0..7}` is expanded by BASH into `0 1 2 3 4 5 6 7`; `{0..3,5..6}` is expanded into `0 1 2 3 5 6`; and `{2,5,14}` is expanded into `2 5 16`

Note that you can also simply list out the NODE_IDS or IDS by separating them with a blank between them.

## Specifying commands

For `emu_node_cmd` and `emu_system_cmd`, everything after the initial command separator (`--`) are considered to be commands and options that you want to pass to the remote nodes or chassis.

However, since you are constructing a command to be executed remotely, you should be careful in constructing the command string.  Keep in mind that string placed in double quotes (`"`) allows the local shell to expand variables while string placed in single quotes (`'`) does NOT allow the local shell to expand variables.

For example, if you specify `emu_node_cmd -p {0..7} -- "echo $SSH_CLIENT"`, this will allow the local shell to expand the environment variable `SSH_CLIENT` on the chassis controller before passing the command string to the nodes.

However, if you specify `emu_node_cmd -p {0..7} -- 'echo $SSH_CLIENT'`, the single quotes string escapes shell expansion on the chassis controller and thus will pass the `$SSH_CLIENT` to each node to be expanded there.

## Examples

`emu_node_cmd -p {0..7} -- 'date'` runs the command `date` on every node.

`emu_node_cmd -p {0..7} -- 'dnf update -y'` runs DNF update on every node.

`emu_node_cmd -p {0..7} -- 'emu_diagnostic_tool --read_node_ram_word 0x200000 n'` reads GC memory location 0x200000 on every node.

`emu_system_cmd -p -c {0..3} -- 'emu_chassis_power_cycle -c -l {0..7}'` runs emu_chassis_power_cycle on chassis 0-3 to power cycle the CSB and nodes 0-7 on each of the chassis.  This in effect power cycles all 32 nodes and 4 CSBs on all 4 chassis simultaneously with just 1 line.

`emu_system_cmd -p -c {0..3} -- 'emu_chassis_start -l {0..7}' runs emu_chassis_start to initialize all 32 nodes in the system.

`emu_system_cmd -p -s {0..31} -- 'emu_diagnostic_tool --read_srio_status_regs'` reads the SRIO status registers on 32 system nodes (0 to 31)

`emu_system_cmd -p -c {0..3} -- 'emu_chassis_update_flash -l {0..7} /usr/ncdimm/ncdimm_stx_5.0.0.periph.rpd'` programs all 32 nodes with the ncdimm_stx_5.0.0.periph.rpd (assuming the image already exists in /usr/ncdimm)

As you can see, `emu_node_cmd` and `emu_system_cmd` can be used to efficiently execute commands in a Pathfinder system.  Used incorrectly, there is also potential for these commands to obliterate a system quickly too.  Therefore, use these commands carefully.
