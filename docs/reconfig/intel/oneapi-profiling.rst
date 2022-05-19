========
OneAPI for FPGA Profiling
========


Intel DevCloud Links
--------------------
https://github.com/intel/FPGA-Devcloud/tree/master/main/Devcloud_Access_Instructions#devcloud-access-instructions

https://devcloud.intel.com/oneapi/documentation/shell-commands/#graphics-usage-on-the-fpga-devcloud


VTune
----------

Compiling your application for profiling
~~~~~~~~~

Make sure to add the `-XSProfile` flag when compiling your bitstream.

~~~~~~~~~
https://www.intel.com/content/www/us/en/develop/documentation/vtune-help/top/command-line-interface/running-command-line-analysis.html


vtune -collect fpga-interaction -knob enable-stack-collection=true -- /home/test/myApplication

OpenCL Interaction
----------
