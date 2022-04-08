The FPGA images on nodes can be updated by using `emu_chassis_update_flash` (and multiple chassis can be updated simultaneously with `emu_system_cmd`, see [Parallel command execution with emu_node_cmd and emu_system_cmd](https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/lucata/parallel_cmds.md))

```
usage: emu_chassis_update_flash <MACHINE_NAME FIRST_NID LAST_NID> | <-l NODE_IDS> [-d PATH_TO_DEVICE] PATH_TO_RPD_FILE
	MACHINE_NAME                            The name of the machine.
	FIRST_NID                               The first node id.
	LAST_NID                                The last node id.
	NODE_IDS                                A list of targeted node IDs
	PATH_TO_RPD_FILE                        The absolute path to the .rpd file. (ex: /usr/ncdimm/VERSION.periph.rpd).
	-d,--device                             The path to the device to flash (ex: /dev/mtd11, default is /dev/mtd11).
	-v,--version                            Print the version string and quit.
	-h,--help                               Print this help message and quit.
```

##  Examples

`emu_chassis_update_flash -l 2 /usr/ncdimm/ncdimm_stx_5.0.0.periph.rpd` update FPGA image on node 2 to ncdimm_stx_5.0.0

`emu_chassis_update_flash -l {0..7} /usr/ncdimm/ncdimm_stx_5.0.0.periph.rpd` update FPGA image on all 8 nodes to ncdimm_stx_5.0.0

`emu_system_cmd -p -c {0..3} -- 'emu_chassis_update_flash -l {0..7} /usr/ncdimm/ncdimm_stx_5.0.0.periph.rpd'` update hardware image on all 32 nodes in the 4 chassis system to ncdimm_stx_5.0.0
