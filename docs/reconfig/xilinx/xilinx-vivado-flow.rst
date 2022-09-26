Xilinx Vivado Flow
===================

This page describes using the "Vivado Flow" with Alveo boards as well as other platforms in the Rogues Gallery. Note that this is considered advanced because it can cause the boards to lock up. 

Most of the relevant documentation for "custom" flows can be found at this `Xilinx support link <https://support.xilinx.com/s/article/71754?language=en_US>`__.

**VERY IMPORTANT NOTE**
The Alveo boards are mostly restricted to Vitis programming flow in other centers. It is IMPERATIVE that you do not program HBM-enabled Alveo boards incorrectly as they will need to be RMAed to be fixed. This is ultimately a Xilinx "documentation bug", but we have had this happen to 2-3 of our cards which causes long downtimes 

This bug is described in [Support Article 72926](https://support.xilinx.com/s/article/72926). The important note is that you need to follow the 2 steps listed:

```
//We have done Step 1.
2. In the Vivado design, connect pin D32 to the CATTRIP output from the HBM IP or connect to GND
3. Add the following constraints (do not include the pulldown constraint if connecting to the CATTRIP output from the HBM IP):
```

If you do happen to fail to follow these instructions, we can try the steps on the [Alveo Debugging Page](https://xilinx.github.io/Alveo-Cards/master/debugging/build/html/docs/card-not-recognized.html). However, we have had to RMA several of our U280s in the past 1-2 years due to this bug and user error.

Alveo Documentation
~~~~~~~~~~~~~~~~~~~

We have moved the Alveo documentation, XDC (constraint files), and related tools into a separate repo on our GT repo called `reconfig-docs <https://github.gatech.edu/crnch-rg/reconfig-docs>`__. Please log in using your Rogues Gallery username and passowrd.

General Locations of Board Files
--------------------------------

Xilinx now posts their board files in a Github repo at https://github.com/Xilinx/XilinxBoardStore and their example designs for Vivado at https://github.com/Xilinx/XilinxCEDStore.

U50 Boards
^^^^^^^^^^

Vivado Flow requires a special Alveo programming cable that is attached via USB to the host server. Detailed in the [Alveo Programming Cable Guide](https://www.xilinx.com/content/dam/xilinx/support/documents/boards_and_kits/accelerator-cards/ug1377-alveo-programming-cable-user-guide.pdf).

TBD - need links to the user guide and programming guide

TBD - need links to the HBM

U50 has a reference design but it's pretty large. If it's useful we should link it here. 

U280 Boards
^^^^^^^^^^

Vivado flow requires a USB programming cable to be connected into the card. 

TBD - need links to the user guide and programming guide

TBD - need links to any HBM Guidance

TBD - how to check that the board shows up in Vivado.
