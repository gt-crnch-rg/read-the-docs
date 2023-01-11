==========
Power Monitoring
==========

On-board Power Measurement Tools
================================

-  `FPGA Power
   Measurement <https://gt-crnch-rg.readthedocs.io/en/latest/reconfig/fpga_power_measurement.html>`__
- `NVIDIA GPU <>`__
- `AMD GPU with ROCm-SMI <https://rocmdocs.amd.com/en/latest/ROCm_System_Managment/ROCm-System-Managment.html#energy>`__
   
For Bluefield cards, we think we should be using `IPMI <https://docs.mellanox.com/pages/viewpage.action?pageId=47034628>`__ to measure power (details forthcoming).

External Power Measurement Tools
================================

These tools use a physical measurement device like a BeagleBoard along
with a custom current measurement harness to measure the dynamic current
of an attached device. Generally this current is then multiplied by the
supply voltage to get the power usage of the device. As an example, a
Jetson TX2 board might be supplied by a ``12 Volt`` supply input - if we
can measure that that input current is ``1.32 Amps`` we can then
determine that the current instantaneous power usage is ``15.84 Watts``.

There are several different devices that have been proposed for
measuring power externally shown in the table below along with links to
papers for each device. PowerInsight was productized by `Penguin
Computing <https://www.penguincomputing.com/company/press-releases/penguin-computing-releases-new-power-monitoring-device/>`__
and WattProf has been produced by
`RNET <http://www.rnet-tech.com/index.php/projects/18-pwr-mon-proj>`__.

Sampling Frequencies
--------------------

This specifies how fast a particular device can sample input currents
and voltages. While there is also potentially some latency (e.g., data
being reported via USB) in reporting this to the host, this indicates
how granular the results are for instantaneous power usage. This table
provides a rough estimate of current power monitoring solutions we are
aware of.

+-----------------------+-----------------------+-----------------------+
| Device                | Type                  | Sampling Frequency    |
|                       |                       | (KHz)                 |
+=======================+=======================+=======================+
| `PowerMon             | External              | 1 per channel with 3  |
| 2 <https://renci.org/ |                       | channels              |
| technical-reports/tr- |                       |                       |
| 09-04/>`__            |                       |                       |
+-----------------------+-----------------------+-----------------------+
| `PowerInsight <https: | External              | 1                     |
| //old-www.sandia.gov/ |                       |                       |
| ~jhlaros/Laros_23_Pow |                       |                       |
| erInsight.pdf>`__     |                       |                       |
+-----------------------+-----------------------+-----------------------+
| `WattProf <https://dl | External              | 1-10                  |
| .acm.org/doi/10.1109/ |                       |                       |
| CLUSTER.2015.121>`__  |                       |                       |
+-----------------------+-----------------------+-----------------------+
| `Intel S10            | On-board              | 10-1000               |
| FPGAs <https://www.in |                       |                       |
| tel.com/content/www/u |                       |                       |
| s/en/programmable/doc |                       |                       |
| umentation/bvk1543945 |                       |                       |
| 927773.html#agp157248 |                       |                       |
| 3278309>`__           |                       |                       |
+-----------------------+-----------------------+-----------------------+
| NVIDIA GPU (using     | On-board              | 1-3                   |
| NVML)                 |                       |                       |
+-----------------------+-----------------------+-----------------------+

Related Work
------------

-  `Karamati, et al., An Energy-Efficient Single-Source Shortest Path
   Algorithm, IPDPS
   2018 <https://ieeexplore.ieee.org/abstract/document/8425261/>`__ -
   uses PowerMon2

-  `DeBonis, et al., Qualification for PowerInsight Accuracy of Power
   Measurements,
   2013 <https://cfwebprod.sandia.gov/cfdocs/CompResearch/docs/piqual_sand.pdf>`__
   - compares PowerMon2 and PowerInsight
