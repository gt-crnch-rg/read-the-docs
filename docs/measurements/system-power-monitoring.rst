=======================
System Power Monitoring
=======================

IPMI Commands for Power Monitoring
==================================

ipmitool
~~~~~~~~

`ipmitool` is a command-line utility that allows you to manage and monitor servers using the Intelligent Platform Management Interface (IPMI). It provides a wide range of functions, including accessing sensor data, controlling power, and managing system events.

ipmi-oem
~~~~~~~~

`ipmi-oem` is a subcommand of `ipmitool` that allows you to execute OEM-specific commands. These commands can vary depending on the server vendor and may provide access to more specialized monitoring or control features.

.. code-block:: bash

   man ipmi-oem

This command will display the manual page for `ipmi-oem`, providing information about its usage and available options.

.. code-block:: bash

   sudo ipmi-oem IntelNM get-node-manager-statistics mode globalpower

This command queries Intel Node Manager for global power statistics. Here is an example output

.. code-block:: text

   Current Power                                                                                                                                                                                       : 575 Watts
   Minimum Power                                                                                                                                                                                       : 13 Watts
   Maximum Power                                                                                                                                                                                       : 1017 Watts
   Average Power                                                                                                                                                                     1192196 seconds    579 Watts
   Statistics Reporting Period
   Policy / Global Administrative State                                                                                                                                     In Progress                 : Enabled
   Measurements State

.. code-block:: bash

   sudo ipmi-oem IntelNM get-node-manager-statistics mode globalpower

Remember to consult any README files or documentation that might be included with the scripts for specific instructions or prerequisites.

