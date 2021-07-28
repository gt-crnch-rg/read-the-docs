============
FPGA Power Measurement
============

One of the big benefits of using an FPGA to accelerate computation is
the potential power savings that can be realized over another
accelerator like a GPU. However, it's important to be able to measure
the power usage of your device while executing a workload.

Intel Power Measurement
=======================

Intel provides a few tools to predict power usage during the compilation
flow including the `Early Power
Estimator <https://www.intel.com/content/www/us/en/programmable/support/support-resources/operation-and-testing/power/pow-powerplay.html>`__
(Arria 10 only) and the newer `Intel Power and Thermal
Calculator <https://www.intel.com/content/www/us/en/programmable/documentation/mdj1572270584041.html#nzb1572267650974>`__
(Stratix 10 and Agilex boards). The newer tools are integrated into
Quartus Prime and can be used to estimate power usage before place and
route and once a design is fully routed for the platform.

Additionally, some devices like the Programmable Accelerator Cards (PAC)
report power and thermal information using their Bus Management
Controller interfaces. As shown in the example below, the
``fpgainfo power`` can be used to sample the current and voltage values
for various on-board components. 

According to `the BMC guide for Stratix
10 <https://www.intel.com/content/www/us/en/programmable/documentation/bvk1543945927773.html#agp1572483278309>`__,
this sampling uses the PCIe SMBus to transfer data using a slave I2C
interface at a rate from 10 KHz to 1 MHZ. This compares reasonably well with other external measurement solutions.

Output from D5005 Stratix 10 PAC card
-------------------------------------

.. code:: 

   .. example-code::
     .. code-block:: JSON
     []$ fpgainfo power
     Board Management Controller, microcontroller FW version 2.0.12, RTL version 2.0.6
     //****** POWER ******//
     Object Id                           : 0xEC00000
     PCIe s:b:d:f                        : 0000:89:00:0
     Device Id                           : 0x0B2B
     Ports Num                           : 01
     Bitstream Id                        : 0x202000200000237
     Bitstream Version                   : 2.0.2
     Pr Interface Id                     : 9346116d-a52d-5ca8-b06a-a9a389ef7c8d
     MAC address                         : 64:4c:36:11:cc:f8
     ( 2) 12v Backplane Current          : 3.02 Amps
     ( 3) 12v Backplane Voltage          : 12.27 Volts
     ( 6) 1.8v Voltage                   : 1.80 Volts
     ( 7) 1.8v Current                   : 8.06 Amps
     ( 8) 3.3v Voltage                   : 3.30 Volts
     ( 9) 3.3v Current                   : 2.37 Amps
     (10) FPGA Core Voltage              : 0.88 Volts
     (11) FPGA Core Current              : 28.20 Amps
     (18) VCCR Voltage                   : 1.12 Volts
     (19) VCCT Voltage                   : 1.12 Volts
     (20) VCCR Current                   : 7.54 Amps
     (21) VCCT Current                   : 2.50 Amps
     (24) 12v AUX Current                : 2.46 Amps
     (25) 12v AUX Voltage                : 12.31 Volts
     (30) VCCERAM Current                : 3.06 Amps
     (31) VCCERAM Voltage                : 0.90 Volts

    []$ fpgainfo temp
     Board Management Controller, microcontroller FW version 2.0.12, RTL version 2.0.6
     //****** TEMP ******//
     Object Id                           : 0xEC00000
     PCIe s:b:d:f                        : 0000:89:00:0
     Device Id                           : 0x0B2B
     Ports Num                           : 01
     Bitstream Id                        : 0x202000200000237
     Bitstream Version                   : 2.0.2
     Pr Interface Id                     : 9346116d-a52d-5ca8-b06a-a9a389ef7c8d
     MAC address                         : 64:4c:36:11:cc:f8
     (12) FPGA Core Temperature          : 83.50 °C
     (26) 12v AUX Temperature            : 32.00 °C
     (27) 12v Backplane Temperature      : 41.00 °C
     (28) 3.3v Temperature               : 41.50 °C
     (29) 1.8v Temperature               : 42.00 °C
     (32) VCCERAM Temperature            : 48.50 °C
     (33) VCCR Temperature               : 59.50 °C
     (34) FPGA Transceiver Temperature   : 71.50 °C
     (35) Board Inlet Air Temperature    : 31.00 °C
     (36) Board Exhaust Air Temperature  : 39.00 °C
     (39) RDIMM0 Temperature             : 44.00 °C
     (40) RDIMM1 Temperature             : 38.50 °C
     (41) RDIMM2 Temperature             : 42.50 °C
     (42) RDIMM3 Temperature             : 37.50 °C
     (43) VCCT Temperature               : 59.00 °C

Output from Arria 10 PAC card
-----------------------------

.. code:: 

   []$ fpgainfo power
   Board Management Controller, microcontroller FW version 26895
   Last Power Down Cause: POK_CORE
   Last Reset Cause: None
   //****** POWER ******//
   Object Id                     : 0xEB00000
   PCIe s:b:d:f                  : 0000:3D:00:0
   Device Id                     : 0x09C4
   Socket Id                     : 0x00
   Ports Num                     : 01
   Bitstream Id                  : 0x124000200000367
   Bitstream Version             : 1.2.4
   Pr Interface Id               : 38d782e3-b612-5343-b934-2433e348ac4c
   Boot Page                     : user
   ( 0) Total Input Power        : 22.00 Watts
   ( 1) PCIe 12V Current         : 1.77 Amps
   ( 2) PCIe 12V Voltage         : 12.00 Volts
   ( 3) 1.2V Voltage             : 1.22 Volts
   ( 4) 1.2V Current             : 2.66 Amps
   ( 5) 1.8V Voltage             : 1.81 Volts
   ( 6) 1.8V Current             : 2.54 Amps
   ( 7) 3.3V Mgmt Voltage        : 3.31 Volts
   ( 8) 3.3V Current             : 0.72 Amps
   ( 9) FPGA Core Voltage        : 0.90 Volts
   (10) FPGA Core Current        : 7.29 Amps
   (13) QSFP P3V3                : No reading (reading state unavailable)
   (16) Core Supply Temp Input   : 0.54 Volts
   (17) VCCR Voltage             : 1.04 Volts
   (18) VCCT Voltage             : 1.04 Volts
   (19) VCCR Current             : 1.18 Amps
   (20) VCCT Current             : 0.12 Amps
   (21) VPP Voltage              : 2.56 Volts
   (22) VTT Voltage              : 0.60 Volts

Intel Power and Thermal Resources
---------------------------------

-  `Answer Note 787 S10 Thermal Modeling and Management with
   EPE <https://www.intel.com/content/www/us/en/programmable/documentation/xwd1478641753484.html>`__

-  `Stratix10 D5005 Data
   Sheet <https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/ds/ds-pac-d5005.pdf>`__
   - discusses the features of this board and the included BMC, used to
   gather power and thermal information

-  `Stratix10 BMC User
   Guide <https://www.intel.com/content/www/us/en/programmable/documentation/bvk1543945927773.html#agp1572483278309>`__
   - details general BMC options as well as low-level flags used to
   gather power and other information. Most of this can be accessed
   using ``fpgainfo <command>``

-  `Stratix 10 Power Management
   Guide <https://www.intel.com/content/www/us/en/programmable/documentation/wtw1443764386078.html>`__
   - talks about SmartVID as well as options for power gating
