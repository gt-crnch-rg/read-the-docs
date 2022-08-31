Xilinx Smart SSD
----------------

The `Xilinx SmartSSD <https://www.xilinx.com/applications/data-center/computational-storage/smartssd.html>`__ provides an FPGA programmable interface to an NVMe SSD drive that can be used to accelerate storage-oriented workloads.


`Xilinx SmartSSD User Guide <https://www.xilinx.com/content/dam/xilinx/support/documents/boards_and_kits/accelerator-cards/1_3/ug1382-smartssd-csd.pdf>`__


Smart SSD Getting Started
=========================
Right now, our Smart SSD is located in an NVMe slot on flubber4. It needs to be installed in a server since it can get quite hot and it requires an NVMe interface.


Current Firmware
================
This section is just for reference, as you should not need to update the firmware on this device.

We compiled the latest XRT from the Github repo so are running XRT 2.14.

 .. code-block::
  
     #Install the firmware for the SmartSSD
     $ dnf -y install xilinx-u2-gen3x4-xdma-gc-2-202110-1-dev-1-3311104.noarch xilinx-u2-gen3x4-xdma-gc-base-2-3311104.noarch.rpm xilinx-u2-gen3x4-xdma-gc-validate-2-3311104.noarch.rpm
     $ ls /opt/xilinx/firmware/u2/gen3x4-xdma-gc/base/
        firmware  license  partition_metadata.json  partition.xsabin  scripts  test
     
     #Find the right BDF to program
     $ xbmgmt examine

      Devices present
      BDF             :  Shell      Platform UUID  Device ID        Device Ready*
      [0000:24:00.0]  :  xilinx_u2  0x0            mgmt(inst=9216)  No
      
     #Program the device with the correct firmware
     $
 
What is the "flat" firmware used for?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
See Appendix H of the User Guide <https://www.xilinx.com/content/dam/xilinx/support/documents/boards_and_kits/accelerator-cards/1_3/ug1382-smartssd-csd.pdf>`__ which refers to the layout of the flat shell, which allows for mixing the static "shell" (PCIe, DRAM controller) and dynamic user logic.
