.. code:: 

   _Last updated: 9/7/20_
   
   ## How does the Alveo use networking?
   
   * Can link to any useful forum posts or QDMA material.
   * Alveo only supports Ethernet (40/100GE) but does not work with IB.
   
   ## How do we program the Alveo to enable networking?
   
   
   ##Process and documentation for installing drivers via JTAG
   
   In order to program the Alveo U280 FPGA using the custom Vivado flow, Xilinx Cable Drivers must be installed first. Click [here](https://www.xilinx.com/support/answers/59128.html) for instructions.
   
   You must have sudo access to install the drivers:
   
   1. Disconnect all Xilinx USB cables from the Alveo U280 and host computer.
   2. Open a shell or terminal console.
   3. Navigate to <vivado_install_path>/data/xicom/cable_drivers/lin64/install_script/install_drivers
   4. Run `sudo ./installc_drivers`
   5. Reconnect the Xilinx USB cables to Alveo U280 and host computer.
   
   
   ## Programming via JTAG (micro-USB) interface.
   
   IMPORTANT!! Bear in mind [this](https://www.xilinx.com/support/answers/72926.html) issue before programming the U280 via the custom Vivado flow. Otherwise, the board may lock-up.
   
   
   Program Alveo U280 through Vivado Hardware Manager. See [here](https://www.xilinx.com/support/answers/71763.html) for instructions.
   
   After programming:
   1. Disconnect USB Cable from the Alveo U280.
   2. Perform a cold reboot on the host machine.
   
   ## How do we revert the Alveo back to using a Vitis-compatible base image?
   
   Once the Alveo U280 is programmed using the custom Vivado flow, Xilinx Runtime (XRT) and the xbutil utility will not recognize the Alveo card
   To revert the Alveo card to a Vitis-compatible mode, the card must be reverted to the golden (factory) image.
   
   There are many ways to do this:
   
     Run `sudo xbutil flash -r`
     (no cold reboot required)
     
     OR
    
     Revert to golden image via Micro USB - JTAG connection and Vivado Hardware Manager (see link below)
     (cold reboot required)
   
   Please see [here](https://www.xilinx.com/support/answers/71757.html) for further instructions and/or alternatives.
