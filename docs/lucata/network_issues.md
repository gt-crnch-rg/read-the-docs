This is a continuation of diagnosing_prolems.md

***

## Network problem???

`emu_node_cmd`, `emu_system_cmd`, `emu_chassis_get_configs`, `emu_chassis_get_versions`, `emu_chassis_start` are failing because it can't reach some nodes.  Now what?

First, calm yourself down.  Let's see what's going on

### Are the node boards on the network?
Use 
```
emu_system_cmd -p -c {0..#(C-1)} -- 'arp -a | grep fm1-mac1'
```
and look for ones that says `incomplete`.  arp stands for Address Resolution Protocol, it basically allows one to map from IP address to Ethernet Mac address.  When a nodeboard makes a network connection, the chassis controller will record it and so when you use the command it'll tell you if any nodeboards are missing in action from the internal Ethernet switch.

### Accessing the nodeboard even when it is not connected to network
Use
```
minicom -c on --dev /dev/ttyUSB#
```
where # is a number from 2 (for node 0) - 9 (for node 7) to access the console connection to the nodeboard.  This console connection uses UART between the chassis controller and the node board, so a network connection is not necessary.  You can use minicom to watch the boot messages for a node board, reset a node board's network link, or even interrupt the boot process to go into u-boot (bootloader) to modify settings (very similar to accessing the BIOS on a PC)

### How do I reset a node-board's network connection?
Once you can log in to the node board using the console, you can use
```
ifconfig fm1-mac4 down
```
to bring down the network interface between the node board and the chassis controller.  You can then use
```
ifconfig fm1-mac4 up
```
to bring it back up.  You can do both in one line:
```
ifconfig fm1-mac4 down; ifconfig fm1-mac4 up
```
Keep in mind that this is the console connection and the kernel may be spewing out messages onto the console connections, so you might have to type fast (or copy and paste the above commands) to reset the network connection without losing track of what you typed.

Resetting the network connection can often resolve the network problem.  You can use
```
arp -a
or
ping ccb
```
to see if the network is back up and running.

### I can't even get any response from console
At this point, there is not much more you can do.  You power cycle the node board from the chassis controller with:
```
node-board -c disable #; node-board -c enable #'
```
where # is the node board number.  In all likelihood, the node board should respond and if you still have the minicom session active, you should see the boot messages on the screen.
