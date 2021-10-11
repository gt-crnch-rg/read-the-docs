=======================
Rogues Gallery Hardware
=======================

The Rogues Gallery testbed is composed of both "virtual" resources and
"physical" servers and test platforms. The figure below shows the Rogues
Gallery resources at a high level with suggested paths from development
VMs to the actual hardware. Discussion of the filesystems you have
access to can be found `here <RG-Filesystems>`__.

For instance, if you're able to test your compilation and do debugging
on the rg-fpga-dev VMs, you can then use the same code on the physical
"flubber" boxes to test your code with a PCI Express-based FPGA. We
currently have three pairs of development VMs that map to physical
hardware, as described more in the tables below.

.. figure:: ../figures/general/rg-machine-overview.png
   :alt: Rogues Gallery Hardware

RG Virtual Machines
===================

Note that VMs are meant as development resources since we may need to
reboot physical hardware often to apply new drivers or reconfigure for
specific experiments. These VMs have limited CPU cores and memory, but
we can reconfigure them as needed or provide additional resources for
long-running simulations. Local storage refers to space hosted within
the VM for /localscratch. Except where noted, all machines are running
Ubuntu 18.04 LTS.

+----------------+-------------+-------------+-------------+-------------+
| Resource       | CPU         | Memory(GB)  | Local       | Software    |
|                |             |             | Storage     | and         |
|                |             |             | (GB)        | Features    |
+================+=============+=============+=============+=============+
| octavius-login | 4 core,     | 32          | 340         | Login for   |
|                | Broadwell   |             |             | the A64FX   |
|                |             |             |             | cluster     |
+----------------+-------------+-------------+-------------+-------------+
| rg-login       | 4 core,     | 8           | 650         | Login node  |
|                | E312xx      |             |             |             |
+----------------+-------------+-------------+-------------+-------------+
| rg-emu-dev     | 4 core,     | 4           | 33          | Emu         |
|                | E312xx      |             |             | simulator   |
|                |             |             |             | and tools   |
+----------------+-------------+-------------+-------------+-------------+
| rg-fpga-dev    | 4 core,     | 8           | 250         | Ubuntu 18,  |
| -<1-6>         | E312xx      |             |             | use for     |
|                |             |             |             | FPGA tools  |
+----------------+-------------+-------------+-------------+-------------+
| rg-neuro-dev   | 4 core,     | 8           | 450         | ROS, FPAA   |
|                | Broadwell   |             |             | tools       |
+----------------+-------------+-------------+-------------+-------------+
| rg-quantum-dev | 4 core,     | 8           | 130         | XACC,       |
|                | Broadwell   |             |             | Qiskit      |
+----------------+-------------+-------------+-------------+-------------+

RG Physical Machines
====================

.. table:: Physical Resources
	:widths: auto
	====
	Queue
	=====
	TBD
	=====

.. table:: Physical Resources
	:widths: auto
	=====  =====  ======   ======   ======   ======   ======
	Queue  Resource CPU    "Memory (GB)"  "Network" "Cards" "Notes"
	=====  =====  ======   ======   ======   ======   ======
	TBD   flubber1
	=====  =====  ======   ======   ======   ======   ======


"flubber1", "Intel", "256 DDR4, 2133GHz", "32 GB Samsung DIMMs", "10GE", "1x Alveo U280, Coral TPU", 
   

+---------+----------+---------+---------+---------+---------+---------+
| Queue   | Resource | CPU     | Memory  | Network | Cards   | Notes   |
|         |          |         | (GB)    |         |         |         |
+=========+==========+=========+=========+=========+=========+=========+
| TBD     | flubber1 | 2x      | 256     | 10GE    | 2x      |         |
+---------+----------+---------+---------+---------+---------+---------+
|         |         | `Intel  | DDR4,   |         | Alveo   |         |
|         |         | E5-2630 | 2133GHz |         | U280,   |         |
|         |         |  <https | ,       |         | Coral   |         |
|         |         | ://ark. | 32 GB   |         | TPU     |         |
|         |         | intel.c | Samsung |         |         |         |
|         |         | om/cont | DIMMs   |         |         |         |
|         |         | ent/www |         |         |         |         |
|         |         | /us/en/ |         |         |         |         |
|         |         | ark/pro |         |         |         |         |
|         |         | ducts/9 |         |         |         |         |
|         |         | 2981/in |         |         |         |         |
|         |         | tel-xeo |         |         |         |         |
|         |         | n-proce |         |         |         |         |
|         |         | ssor-e5 |         |         |         |         |
|         |         | -2630-v |         |         |         |         |
|         |         | 4-25m-c |         |         |         |         |
|         |         | ache-2- |         |         |         |         |
|         |         | 20-ghz. |         |         |         |         |
|         |         | html>`_ |         |         |         |         |
|         |         | _       |         |         |         |         |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | flubber | 2x      | 384 GB  | 10GE    | Arria   |         |
|         | 2       | `Intel  | DDR4,   |         | 10 PAC, |         |
|         |         | Gold    | 2666GHz |         | Bittwar |         |
|         |         | 6226R < | ,       |         | e       |         |
|         |         | https:/ | 32 GB   |         | 385A-So |         |
|         |         | /ark.in | Micron  |         | C,      |         |
|         |         | tel.com | DIMMs   |         | `Bluefi |         |
|         |         | /conten |         |         | eld-1   |         |
|         |         | t/www/u |         |         | NIC <ht |         |
|         |         | s/en/ar |         |         | tps://g |         |
|         |         | k/produ |         |         | ithub.g |         |
|         |         | cts/199 |         |         | atech.e |         |
|         |         | 347/int |         |         | du/crnc |         |
|         |         | el-xeon |         |         | h-rg/ro |         |
|         |         | -gold-6 |         |         | gues-do |         |
|         |         | 226r-pr |         |         | cs/wiki |         |
|         |         | ocessor |         |         | /%5BNet |         |
|         |         | -22m-ca |         |         | working |         |
|         |         | che-2-9 |         |         | %5D-Mel |         |
|         |         | 0-ghz.h |         |         | lanox-B |         |
|         |         | tml>`__ |         |         | lueFiel |         |
|         |         |         |         |         | d-Resou |         |
|         |         |         |         |         | rces>`_ |         |
|         |         |         |         |         | _       |         |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | flubber | 2x      | 384 GB  | 10GE,   | Alveo   |         |
|         | 3       | `Intel  | DDR4,   | EDR IB  | U280,   |         |
|         |         | Gold    | 2666GHz |         | Arria   |         |
|         |         | 6226R < | ,       |         | 10 PAC, |         |
|         |         | https:/ | 32 GB   |         | Bittwar |         |
|         |         | /ark.in | Micron  |         | e       |         |
|         |         | tel.com | DIMMs   |         | 385A,   |         |
|         |         | /conten |         |         | Bittwar |         |
|         |         | t/www/u |         |         | e       |         |
|         |         | s/en/ar |         |         | 520N,   |         |
|         |         | k/produ |         |         | `Bluefi |         |
|         |         | cts/199 |         |         | eld-1   |         |
|         |         | 347/int |         |         | NIC <ht |         |
|         |         | el-xeon |         |         | tps://g |         |
|         |         | -gold-6 |         |         | ithub.g |         |
|         |         | 226r-pr |         |         | atech.e |         |
|         |         | ocessor |         |         | du/crnc |         |
|         |         | -22m-ca |         |         | h-rg/ro |         |
|         |         | che-2-9 |         |         | gues-do |         |
|         |         | 0-ghz.h |         |         | cs/wiki |         |
|         |         | tml>`__ |         |         | /%5BNet |         |
|         |         |         |         |         | working |         |
|         |         |         |         |         | %5D-Mel |         |
|         |         |         |         |         | lanox-B |         |
|         |         |         |         |         | lueFiel |         |
|         |         |         |         |         | d-Resou |         |
|         |         |         |         |         | rces>`_ |         |
|         |         |         |         |         | _       |         |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | karrawi | PowerPC | 400     |         |         | Each of |
|         | ngi-log | e5500   |         |         |         | the 8   |
|         | in      |         |         |         |         | nodes   |
|         |         |         |         |         |         | has the |
|         |         |         |         |         |         | same    |
|         |         |         |         |         |         | CPU as  |
|         |         |         |         |         |         | a       |
|         |         |         |         |         |         | station |
|         |         |         |         |         |         | ary     |
|         |         |         |         |         |         | core    |
|         |         |         |         |         |         | and 400 |
|         |         |         |         |         |         | GB of   |
|         |         |         |         |         |         | memory  |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | pathfin | PowerPC |         |         | Lucata  |         |
|         | der<1-2 | e5500   |         |         | Pathfin |         |
|         | >       |         |         |         | der     |         |
|         |         |         |         |         | system  |         |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | brainar | TBD     | TBD     |         |         |         |
|         | d       |         |         |         |         |         |
+---------+---------+---------+---------+---------+---------+---------+
| arm-\*  | octaviu | A64FX   | 32      | HDR IB  |         |         |
|         | s<1-16> |         |         |         |         |         |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | rg-neur | 4 core, | 8       | 1GE     | FPAA    | Raspber |
|         | o-host  | Armv7   |         |         | v1.0    | ry      |
|         |         |         |         |         |         | Pi      |
|         |         |         |         |         |         | Model   |
|         |         |         |         |         |         | 3B host |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | noteboo | 4x      | 1 TB    | 1GE     |         | Used    |
|         | k/hawks | E7-4820 |         |         |         | for     |
|         | bill    |         |         |         |         | noteboo |
|         |         |         |         |         |         | ks      |
|         |         |         |         |         |         | and     |
|         |         |         |         |         |         | simulat |
|         |         |         |         |         |         | ions    |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | flatbac | 2x      | 512 GB  | 1GE     |         | Used    |
|         | k       | E7-4820 |         |         |         | for     |
|         |         |         |         |         |         | noteboo |
|         |         |         |         |         |         | ks      |
|         |         |         |         |         |         | and     |
|         |         |         |         |         |         | simulat |
|         |         |         |         |         |         | ions    |
+---------+---------+---------+---------+---------+---------+---------+
| TBD     | frozone |         |         | 10GE,   |         |         |
|         | <1-4>   |         |         | Omnipat |         |         |
|         |         |         |         | h-100   |         |         |
+---------+---------+---------+---------+---------+---------+---------+
