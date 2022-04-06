To bring up a multichassis system, you should use `emu_system_cmd` and `emu_chassis_start`.  For example, the following command will bring up a 4 chassis system with the interchassis link speed set to 10:

```
emu_system_cmd -p -c {0..3} -- 'emu_chassis_start -u 10 -l {0..7}'
```

see [Parallel command execution with emu_node_cmd and emu_system_cmd](https://github.com/emusolutions/chick-helpers/wiki/Parallel-command-execution-with-emu_node_cmd-and-emu_system_cmd) on using `emu_system_cmd` and `emu_node_cmd`

see [Bringing up a chassis with emu_chassis_start](https://github.com/emusolutions/chick-helpers/wiki/Bringing-up-a-chassis-with-emu_chassis_start) on using `emu_chassis_start`

After all the chassis have finished `emu_chassis_start`, check the SRIO links see [SRIO Link Checking](https://github.com/emusolutions/chick-helpers/wiki/SRIO-Link-Checking) on how to check SRIO links.  Reboot and reset links as necessary.  Once you are certainly there are no errors with any links, you are good to go!

Generally, if the SRIO switches have been initialized and you are not planning to change the interchassis link speed, you can run `emu_chassis_start` without rebooting or power cycling.  If you are planning on changing the interchassis link speed, you may need to power cycle or reset the SRIO switches.

You can power cycle the SRIO switches by using the `switch-board` command to disable and then enable the chassis switch board, or by specifying the `-c` option when using `emu_chassis_power_cycle` prior to `emu_chassis_start`.

You can reboot the SRIO switches by using the `emu_switch_start` command.  Note that `emu_chassis_start` will call `emu_switch_start`, so be sure to specify the interchassis link speed if you are not planning on using the default rate.


