Xilinx Vivado Flow
===================

This page describes using the "Vivado Flow" with Alveo boards as well as other platforms in the Rogues Gallery. Note that this is considered advanced because it can cause the boards to lock up. 

Most of the relevant documentation for "custom" flows can be found at this `Xilinx support link <https://support.xilinx.com/s/article/71754?language=en_US>`__.

**VERY IMPORTANT NOTE**

The Alveo boards are mostly restricted to Vitis programming flow in other centers. It is IMPERATIVE that you do not program HBM-enabled Alveo boards incorrectly as they will need to be RMAed to be fixed. This is ultimately a Xilinx "documentation bug", but we have had this happen to 2-3 of our cards which causes long downtimes 

This bug is described in `Support Article 72926 <https://support.xilinx.com/s/article/72926>`__. The important note is that you need to follow the 2 steps listed:

1. In the Vivado design, connect pin D32 to the CATTRIP output from the HBM IP or connect to GND
2. Add the following constraints (do not include the pulldown constraint if connecting to the CATTRIP output from the HBM IP):

.. code::

  set_property PACKAGE_PIN D32              [get_ports "HBM_CATTRIP"];# Bank  75 VCCO - VCC1V8   - IO_L17P_T2U_N8_AD10P_75
  set_property IOSTANDARD  LVCMOS18         [get_ports "HBM_CATTRIP"];# Bank  75 VCCO - VCC1V8   - IO_L17P_T2U_N8_AD10P_75
  set_property PULLDOWN TRUE                      [get_ports "HBM_CATTRIP"];

If you do happen to fail to follow these instructions, we can try the steps on the `Alveo Debugging Page <https://xilinx.github.io/Alveo-Cards/master/debugging/build/html/docs/card-not-recognized.html>`__. However, we have had to RMA several of our U280s in the past 1-2 years due to this bug and user error.

Alveo Documentation
~~~~~~~~~~~~~~~~~~~

We have moved the Alveo documentation, XDC (constraint files), and related tools into a separate repo on our GT repo called `reconfig-docs <https://github.gatech.edu/crnch-rg/reconfig-docs>`__. Please log in using your Rogues Gallery username and passowrd.

General Locations of Board Files
--------------------------------

Xilinx now posts their board files in a Github repos for the `Board Store <https://github.com/Xilinx/XilinxBoardStore>`__ and `Vivado example designs <https://github.com/Xilinx/XilinxCEDStore>`__.

U50 Boards
^^^^^^^^^^

Vivado Flow requires a special Alveo programming cable that is attached via USB to the host server. This is detailed in the `Alveo Programming Cable Guide <https://docs.xilinx.com/r/en-US/ug1377-alveo-programming-cable-user-guide>`__.


User and Programming Guides
----------------------------
* U50 User Guide: https://docs.xilinx.com/r/en-US/ug1371-u50-reconfig-accel/Introduction
* U280 User Guide: https://docs.xilinx.com/r/en-US/ug1314-alveo-u280-reconfig-accel

TBD - need links to the HBM

U50 has a reference design but it's pretty large. If it's useful we should link it here. 

U280 Boards
^^^^^^^^^^^

Vivado flow requires a USB programming cable to be connected into the card. 

Find the `User Guide here <https://docs.xilinx.com/r/en-US/ug1314-alveo-u280-reconfig-accel>`__

TBD - need links to any HBM Guidance

TBD - how to check that the board shows up in Vivado.
