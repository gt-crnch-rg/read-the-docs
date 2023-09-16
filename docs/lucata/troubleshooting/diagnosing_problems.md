I have created this page to outline procedures that one can do to diagnose problems on a pathfinder-s system when something goes wrong.  This is probably not complete, but I will add and edit as I think of things to add

***

## Things to check before running on the hardware

Before you start running, please check a few things to make sure they are what you want before you launch your program.  This can save you A LOT of grief if you check first:

### Is the system running the correct version?
Use 
```
emu_chassis_get_versions -l {0..7}
```
to check the chassis you are on

Use
```
emu_system_cmd -p -c {0..#(C-1)} -- emu_chassis_get_versions -l {0..7}
```
to check the entire system that you are using.  You should calculate what #(C-1) is for you (C is the number of chassis).  If you have 4 chassis, #(C-1) is 3.  If C is 1, #(C-1) is 0 (you may just as well use `emu_chassis_get_versions -l {0..7}` or `emu_system_cmd -c -p 0 -- emu_chassis_get_versions -l {0..7}`

In general, you want all of the nodes that you are using together to have matching versions. This means that if you are running a program on 32 nodes, you want all 32 nodes to have the same sc-driver version and the same hardware/ncdimm image. 

### Is the system configured correctly?
Use
```
emu_chassis_get_configs -l {0..7}
```
to check the chassis you are on

Use

```
emu_system_cmd -p -c {0..#(C-1)} -- emu_chassis_get_configs -l {0..7}
```
to check the entire system that you are using.  You should calculate what #(C-1) is for you (C is the number of chassis).  If you have 4 chassis, #(C-1) is 3.  If C is 1, #(C-1) is 0 (you may just as well use `emu_chassis_get_configs -l {0..7}` or `emu_system_cmd -c -p 0 -- emu_chassis_get_configs -l {0..7}`
There are a few things in the output that you should pay attention to: 
1. Is the system configured as the number of nodes that you want? Double-check that all chassis are configured as you want. 
2. Check that the initialization status is `initialized` for all nodes and all switches. 
3. If the link speed is shown, check that the links are running at the speed you want. 

If you need to reconfigure the system, see these pages:   
- [System-Reconfiguration](https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/lucata/config_and_running/system_reconfig.md) 
- [Bringing up a multichassis system](https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/lucata/config_and_running/multichassis_start.md)

### Are SRIO ports running well?
Use
```
emu_system_cmd -p -s {0..#(N-1)} -- 'emu_diagnostic_tool --read_srio_status_regs' | grep -v '='
```
to check the SRIO ports for the entire system that you are using.  You should calculate what #(N-1) is for you (N is the number of nodes).  If you have 4 chassis, #(N-1) is 31. If the SRIO ports have or are experiencing physical layer errors or problems, you may see things like:

```
sn0: SRIO PORT 0 packet ackID out of sequence.                                                                                                                  
sn0: SRIO PORT 0 received packet-not-accepted control symbol.                                                                                                   
sn0: SRIO PORT 5 has encountered a fatal error.
sn0: SRIO PORT 5 output stopped due to error.
sn0: SRIO PORT 5 link-response control symbol with an ackID that is not outstanding.
sn0: SRIO PORT 5 packet ackID out of sequence.
sn0: SRIO PORT 5 received packet-not-accepted control symbol.
sn7: SRIO PORT 5 input is disabled.
sn7: SRIO PORT 5 output is disabled.
sn7: SRIO PORT 5 is not initialized.
sn7: SRIO PORT 5 invalid, illegal, or disallowed 8B10B code group.
sn7: SRIO PORT 5 loss of receiver descrambler synchronization.
sn7: SRIO PORT 5 invalid or illegal 8B10B code group.
```

If you see any of these, you can try the following sequence to see if you can clear the errors.  You'll do them **on the nodeboards** that have these problems and substitute P with the port number that you see above:

```
emu_diagnostic_tool --reset_srio_link P
emu_diagnostic_tool --resynchronize_srio_link P
emu_diagnostic_tool --clear_srio_error_regs
```

Once done, repeat
```
emu_system_cmd -p -s {0..#(N-1)} -- 'emu_diagnostic_tool --read_srio_status_regs' | grep -v '='
```
to see if they are recurring.  If so, you may be better off to restart the node with `emu_chassis_start`, but use the `--RESTART` option

Use
```
emu_system_cmd -p -c {0..#(C-1)} -- 'emu_switch_diagnostic --port_error_status -1' 2>&1 | grep stopped | sort
```
to check the interchassis links.  If you have stopped ports, you will probably have to reboot the SRIO switches.  This can be done by using `switch-board -c disable` to turn off the switch booard followed by `emu_chassis_start`, which will automatically power on the switch board.  Alternatively, you can also use `emu_switch_start` to reboot the switch.  If problems persist, you should probably check the physical cables.

For more information, see this page: [SRIO Link Checking](https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/lucata/check_srio.md)

### Are there already other runs in progress?

Before starting any runs, check the scheduling mechanism for the desired machine to ensure that no one else has reserved time on the nodes that you want. 
This can save everyone time and grief. 

Use
```
emu_system_cmd -p -s {0..#(N-1)} -- 'ps aux | grep emu | grep handler | grep -v grep'
```
to see if there is already something running on the nodes.  The command will look for `emu_handler_and_loader` or `emu_seq_handler_background` on the nodes.  If they are running, you should either wait for them to finish or checkpoint the run before you start yours.

***

## Running programs on hardware

In general, it is a good idea to run w/ a reasonable time out so you can get `emu_multinode_exec` or `emu_handler_and_loader` to terminate program if it's hanging.  **Avoid using ctrl-C to interrupt a run as this often leads into problems in cleaning up the system.**

### Checking the Logs 
If you suspect that something has gone wrong while you are running a program or during termination, you should check the log files. 
The log files are called `mn_exec_sys.PID.log` and `mn_exec_usr.PID.log`, and they can be found in the directory the program was run from. 
You can look in these files for ERROR, FATAL, and WARN messages. 
For more information, see this page: [Running programs with emu_multinode_exec](https://github.com/gt-crnch-rg/read-the-docs/blob/main/docs/lucata/emu_multinode_exec.md)

### Manually terminating a program

If you suspect a program is hung and would like to terminate a program, the best thing to do is to open another terminal (via tmux or screen) and run:
```
emu_system_cmd -p -s {0..#(N-1)} -- 'emu_diagnostic_tool --start_checkpointing'
```
to gracefully terminate a program.  This will take a few seconds to do, but it generally terminate the program cleanly.

If you are running a multinode program, you need to checkpoint on all the chassis you are running on. So for a 32-node multinode run, you should instead use:

```
emu_system_cmd -p -c {0..3} -n {0..7} -- 'emu_diagnostic_tool --start_checkpointing'
```
If you are using a separate BASH script to run `emu_multinode_exec`, you should kill that script **first** before checkpointing.
If you do not kill the script first and it attempts to start more `emu_multinode_exec` jobs, this may interfere with your checkpointing efforts. 

### Cleaning up when checkpoint fails

If checkpointing fails due to hung SRIO ports, hung MSP, lost remotes, acks, memory transactions, you may need to take additional action to clean up.  Bad hardware errors will result in reboots anyway, but doing the following steps will ensure a successful reboot and restart on the first try
* Check to make sure **ALL** `emu_handler_and_loader` as well as `emu_seq_handler_background` have terminated so they are not running or waiting on hardware.  systemd will wait for a couple of minutes for processes to terminate even for reboots.  This can often mess up the timing for a `emu_chassis_start` 
* If you don't intend on rebooting, but you want to continue with another run, make sure no checkpoint marker files are left (`emu_system_cmd -p -s {0..#(N-1)} -- 'rm -f /var/log/emutechnology/emu_checkpoint.in_progress'`)
* (Rare) Delete all /dev/shm/sem* files on the nodes (`emu_system_cmd -p -s {0..#(N-1)} -- 'rm -f /dev/shm/*'`) if you you think all the processes should have exited cleanly

### Manually Cleaning up

If you used ctrl-C to interrupt a run or system start-up despite warnings, you should manually clean up and restart the system.  In general, you should do, at a minimum, the following:

Check to make sure **ALL** `emu_init`, `emu_memory_check`, `emu_multinode_exec`, `emu_handler_and_loader`, and `emu_seq_handler_background` have terminated so they are not running or waiting on hardware. You can use `pkill` to kill the processes by name.  For example,
```
emu_system_cmd -p -s {0..#(N-1)} -- 'pkill -9 emu.*handler'
```
will kill all of the `emu_handler_and_loader` and `emu_seq_handler_background` processes (the `.*` is a regexp to match them).  **Note that a more graceful exit using `emu_system_cmd -p -s {0..#(N-1)} -- 'emu_diagnostic_tool --start_checkpointing'` is always preferred**

If you don't think a reboot is necessary, you should ensure the following files aren't around:
```
/var/lock/emu_start_node.lock
/var/lock/emu_needs_reconfigured.lock
/var/log/emutechnology/emu_start.in_progress
/var/log/emutechnology/emu_checkpoint.in_progress
/dev/shm//x10_device_semaphore
```
A reboot is usually required if you encountered PCIe read completion timeouts, downed SRIO ports, hard checkpoint failures, crashed kernel driver.  A reset may often take care of lost memory transactions, hung programs w/ lock contention, or other software bugs.

## Are the hostnames set up correctly?

Sometimes when you reconfigure the system, you get an error that the hostnames cannot be set correctly. 

```
[ERROR]: n13: ssh: Could not resolve hostname n13: Name or service not known
c2: n11: ssh: Could not resolve hostname n11: Name or service not known
```

To fix this you can run the following command as root:
```
root@pathfinder0:~# emu_system_init_config -c 4 -t pathfinder-s
c1: Launching emu_chassis_init_config with args: pathfinder-s 8                                                                                                                               c0: Launching emu_chassis_init_config with args: pathfinder-s 8
c3: Launching emu_chassis_init_config with args: pathfinder-s 8
c1: Running 'mkdir -p /etc/emutechnology; mkdir -p /var/lock; touch /var/lock/emu_needs_reconfigured.lock; echo pathfinder-s > /etc/emutechnology/SystemType; slot-id > /etc/emutechnology/NodeId' in parallel on n[0,1,2,3,4,5,6,7]...
c0: Running 'mkdir -p /etc/emutechnology; mkdir -p /var/lock; touch /var/lock/emu_needs_reconfigured.lock; echo pathfinder-s > /etc/emutechnology/SystemType; slot-id > /etc/emutechnology/NodeId' in parallel on n[0,1,2,3,4,5,6,7]...
...
c3: ################################################################
c3:
c3: SSH key update Completed on Wed Aug  2 22:25:23 EDT 2023!
c3: Users should remove the entries for nodes in the known_hosts
c3: file in their .ssh directory
c3:
c3: ################################################################
[STATUS]: emu_system_init_config complete.
```
