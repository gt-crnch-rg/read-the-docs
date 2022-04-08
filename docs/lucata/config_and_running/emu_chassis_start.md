The `emu_chassis_start` script is the main script used to bring up the systems.  In a Pathfinder, if the system is configured for multinode, `emu_chassis_start` will bring up the CSB (in parallel with the nodeboards).  Once all the nodeboards have been brought up successfully and the CSB has booted, the SRIO links will be checked.

Once the script has run to completion, the script will touch `/var/log/emutechnology/EmuAllStartChassis.init` to indicate that the system as configured has been initialized by emu_chassis_start.

```
usage: emu_chassis_start <MACHINE_NAME FIRST_NID LAST_NID> | <-l NODE_IDS> 
	Arguments are case sensitive.
	MACHINE_NAME                            The name of the machine (logging base name).
	FIRST_NID                               The first node id.
	LAST_NID                                The last node id.
	NODE_IDS                                A list of targeted node IDs
	-b,--BIT_RATE val                       Optional argument. Sets the SRIO bit rate - only impacts multinode. (default val=hardware)
	-c,--CORE_FREQ val                      Optional argument. Sets the core clock frequency. (default val=hardware).
	-g,--GC_FREQ val                        Optional argument. Sets the GC clock frequency. (default val=hardware).
	-u,--BAUD_RATE val                      Optional argument. Sets the interchassis SRIO baud rate - only impacts multinode. (default val=6)
	--DISABLE_STRIPING                      Optional argument. Turns OFF MSP memory striping.
	--DISABLE_ECC                           Optional argument. Turns OFF error-correcting code memory.
	--DISABLE_MEM_CHECK                     Optional argument. Turns OFF full memory checking.
	--ENABLE_PREFETCH                       Optional argument. Enables prefetch buffer.
	-o,--REBOOT                             Optional flag. Attempts to reboot node boards.
	-p,--POWER_CYCLE                        Optional flag. Attempts to power cycle node boards.
	-r,--RETRY val                          Optional argument. Sets the retry count. (default val=5).
	-s,--SKIP_NCDIMM_CHECK                  Optional argument. Skips checking ncdimm versions.
	-v,--version                            Print the version string and quit.
	-h,--help                               Print this help message and quit.
```

## Logs
 `emu_chassis_start` copies over a log from the node to the control board.  When booting a Pathfinder system, the following logs are also created and put into `/var/log/emutechnology`: `emu_csb_init.log`, `emu_csb_boot.log`, and `check_srio_links.log`.
