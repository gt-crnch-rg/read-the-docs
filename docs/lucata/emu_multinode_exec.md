## Overview
emu_multinode_exec is now the standard script to be used to launch programs in all configurations.  It supports singlenode, singlechassis multinode, or multichassis multinode.

emu_multinode_common contains functions shared by `emu_multinode_exec`.  It should not be executed on its own.

emu_multinode_poll is launched in the background automatically by emu_multinode_exec and will continually poll the nodes to determine if emu_seq_handler_background is running on any node; if it is, it will sleep and then poll again.  Once all nodes have completed executing emu_seq_handler_background, it will collect and check the logs.

Below is the help menu for emu_multinode_exec:

```
usage: emu_multinode_exec TIMEOUT [OPTIONS...] -- PROGRAM [PROGRAM_ARGUMENTS]
                                                The following required options are passed to emu_handler_and_loader.
        TIMEOUT                                 Number of seconds to allow program to run (0 == no timeout).
                                                The following are optional arguments for this script.
        [--log_name <string>]                   Base name used for logfiles.
                                                The following are optional arguments for emu_loader.
        [--acks_off]                            acks for thread launched are turned off.
        [--delay_launch]                        prompts user before launching thread.
        [--thread_quit_on]                      Process thread quits.
        [--thread_id <val>]                     Specifies the initial thread id. val is either base 10 or base 16 in 0x format.
                                                The following required options are passed to emu_loader.\n
        PROGRAM                                 The program name.
                                                The following optional arguments are passed to emu_handler_and_loader.\n
        PROGRAM_ARGUMENTS                       Command line arguments.
```

The main command-line change from emu_multinode_exec is the addition of the `--log_name` flag which allows the user to select a name for the logfiles.  When compared to emu_chassis{0,X}_exec, the PID_NUM argument has been removed.  Additionally, using the `--thread_quit_off` flag will generate a warning.

**Pathfinder execution note: It is highly, highly recommended to use the `--log_name` flag when doing multi-chassis executions.**

This script uses the configuration files in `/etc/emutechnology/` to determine its behavior (mainly done in the evaluate_configuration function).  There are three basic configurations that this script handles as shown below.
1. LogicalNodeId=0, LogicalTotalNodes=1: Launches a singlenode application run by directly calling `emu_handler_and_loader`.
2. LogicalNodeId=0, LogicalTotalNodes>1: Launches a multinode application by running emu_loader, emu_seq_handler_background on the appropriate local nodes; will then launch emu_handler_and_loader on the current node.  After checking for a valid launch, the script will then write the names of the logfiles to /tmp/$(whoami)/mn_names.txt (on n0); these names are then used by emu_multinode_poll to provide consistency across emu_multinode_exec, emu_multinode_poll.

## Logging for emu_multinode_exec
The logging behavior of the script has seen major changes; this section focuses on multinode execution.  Note, <log_base> below is either the string given to the `--log_name` flag with .usr or .sys appended as necessary or mn_exec_{usr,sys}.$MYPID.  Note that .usr is emu-scd.log and .sys is emu-scd-system.log.

* After all necessary nodes have executed emu_loader, the /tmp/$(whoami)/emu_loader.log file is checked for FATAL and ERROR messages.  If this is seen on a node, that file will be copied to LDR_FAIL.snX.log (X is the node that had a loader failure) in the current folder.  After all nodes are checked, emu_multinode_exec takes a fatal error if a FATAL or ERROR message was found.  If there are no errors, the log files are deleted.

* After all necessary nodes have executed emu_seq_handler_background, /tmp/$(whoami)/emu-scd-system.log is scp'ed from each node to /tmp/$(whoami)/<log_base>.snX.launch.log on sn0 (local node).  These logs are then concatenated into /tmp/$(whoami)/<log_base>.launch.log and checked for FATAL and ERROR.  If FATAL or ERROR messages were found, the script will take a fatalerror.  If there are no errors, the log files are deleted.

* At the completion of the run, /tmp/$(whoami)/emu-scd-system.log and /tmp/$(whoami)/emu-scd.log are scp'ed from each node to /tmp/$(whoami)/<log_base>.nX.log on n0 (local node).  These logs are then concatenated into /tmp/$(whoami)/<log_base>.log and copied into the current folder.  After being copied, each log is checked for ERROR and FATAL messages.  The node specific log files in /tmp/$(whoami) are deleted since a concatenated log file already exists.
