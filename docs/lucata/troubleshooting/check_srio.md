**NOTE:** As a normal user, you should not have to check SRIO status. Please ask an admin if you think this needs to be checked.

There are functions in `emu_chassis_start` and `emu_chassis_reconfig` that will handle the SRIO link checking automatically.  The result of the checking can be found in `/var/log/emutechnology/check_srio_links.log`

On the chassis controller, use `emu_switch_diagnostic --port_error_status -1` to check the error status registers of all of the SRIO switch chips.  If the errors were transient and occurred during initialization and were not cleared, they can be cleared manually by using `emu_switch_diagnostic --clear_port_errors -1`

Similarly, on a node, use `emu_diagnostic_tool --read_srio_status_regs` to check the error status registers of all of the SRIO links on the node.  The output may look like the following.  Note that SRIO Port 3 is showing physical layer errors:

```
SRIO_PORT_0_CONTROL=0xd06f_0101                                                                                                                                 
SRIO_PORT_1_CONTROL=0xd06f_0101                                                                                                                                 
SRIO_PORT_2_CONTROL=0xd06f_0101                                                                                                                                 
SRIO_PORT_3_CONTROL=0xd06f_0101                                                                                                                                 
SRIO_PORT_4_CONTROL=0xd06f_0101                                                                                                                                 
SRIO_PORT_5_CONTROL=0xd06f_0101                                                                                                                                 
SRIO_PORT_0_ERR_STATUS=0xe000_0002                                                                                                                              
SRIO_PORT_1_ERR_STATUS=0xe000_0002                                                                                                                              
SRIO_PORT_2_ERR_STATUS=0xe000_0002                                                                                                                              
SRIO_PORT_3_ERR_STATUS=0xe000_0002                                                                                                                              
SRIO_PORT_4_ERR_STATUS=0xe000_0002                                                                                                                              
SRIO_PORT_5_ERR_STATUS=0xe000_0002                                                                                                                              
SRIO PORT 3 invalid, illegal, or disallowed 8B10B code group.                                                                                                   
SRIO PORT 3 invalid or illegal 8B10B code group.                                                                                                   
```

If transient errors occurred during initialization were not cleared, they can be cleared manually by using `emu_diagnostic_tool --clear_srio_error_regs`

## Resetting links

Sometimes, a link may need to be reset if it is uninitialized or in an error stopped state.  This can be somewhat tricky as a downed link may need to be reset on both the SRIO switch end and on the node end. If there is only 1 down link, it is usually not difficult to identify the corresponding ends and reset them.

To reset a link on the SRIO switch, use `emu_switch_diagnostic --reset_port <switch_id> <port_id>` and specify the specific switch ID and port ID.

To reset a link on the node, use `emu_diagnostic_tool --reset_srio_link <port_number>` and specify the port number.  The output may look like the following:

```
Toggling soft reset to SRIO port 2                                                                                                                              
SRIO port 2 reports PORT_OK after 6 iterations                                                                                                                  
SRIO port 2 sending link-request reset-device to link partner                                                                                                   
SRIO port 2 sending link-request input-status to link partner                                                                                                   
SRIO port 2 link partner still in error or stop state (0x80000005) after 20000 0 iterations                                                                     
```

Note that after a link is reset on one end, one will usually have to resynchronize the link with its link partner to ensure the ackID are synchronized.  This typically just needs to be done on the node end.  Use `emu_diagnostic_tool --resynchronize_srio_link <port_number>` to do so and the output may look like the following:

```
SRIO port 2 locking out port to resynchronize ackID                                                                                                             
SRIO port 2 sending link-request input-status to link partner                                                                                                   
SRIO port 2 link partner reports valid response after 1 iterations                                                                                              
SRIO port 2 resynchronizing to link partner ackID 0, local outbound ackID 0, local outstanding ackID 0                                                          
SRIO port 2 enabling port after resynchronizing ackID                                                                                                           
```

Afterwards, use `emu_diagnostic_tool --clear_srio_error_regs` to clear the error flags.

If a link still shows errors after resetting, try restarting the particular nodeboard of the affected link.  Use the `-o` option w/ `emu_chassis_start` to reboot the nodeboard when restarting.

## Useful commands

Use `emu_system_cmd -p -c {0..3} -- 'emu_switch_diagnostic --port_error_status -1' 2>&1 | grep uninitialized | sort` to see uninitialized links on the switch (some may be expected)

Use `emu_system_cmd -p -c {0..3} -- 'emu_switch_diagnostic --port_error_status -1' 2>&1 | grep stopped | sort` to see stopped links

Use `emu_system_cmd -p -s {0..31} -- 'emu_diagnostic_tool --read_srio_status_regs' | grep uninitialized` to see uninitialized links on the nodes

Use `emu_system_cmd -p -s {0..31} -- 'emu_diagnostic_tool --read_srio_status_regs' | grep 'SRIO PORT'` to see node ports with physical layer errors on a 32 node system
