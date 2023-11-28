===============
NVIDIA DOCA SDK
===============

This page points to some of the more useful DOCA SDK examples and sample codes. We encourage you to check out the DOCA resources below for full guidance on how to use DOCA-specific features. 

Key Resources
=============
- Demystifying DOCA `blog post <https://developer.nvidia.com/blog/demystifying-doca/>`__ and `video <https://www.youtube.com/watch?v=iaFN0F53L6w>`__
- `DOCA Documentation <https://docs.nvidia.com/doca/sdk/index.html>`__ - main landing page with pointer to Quick Start Guide, Programmer's Guide, and API
- `DOCA Programming Guides <https://docs.nvidia.com/doca/sdk/programming-guides-overview/index.html>`__ - main programming guide page

Using DOCA Development Containers from the Host
=================================
TBD


DOCA Sample Codes
=================

DOCA code samples get installed with the DOCA SDK on the host device and on the BlueField itself and can be found under `/opt/mellanox/doca/samples`.

.. code:: 

  >$ ls /opt/mellanox/doca/samples/
  common.c  doca_apsh          doca_common    doca_dma  doca_dpi             doca_flow  doca_regex  doca_telemetry
  common.h  doca_comm_channel  doca_compress  doca_dpa  doca_erasure_coding  doca_rdma  doca_sha    flexio

There are also a set of applications that make use of DOCA on the DPU under `/opt/mellanox/doca/applications/`. Read more about them under the `Reference Applications section <https://docs.nvidia.com/doca/sdk/index.html#reference-applications>`__.

.. code:: 

  >$ ls /opt/mellanox/doca/applications/
  VERSION                  dma_copy                      file_scan          l4_ovs_firewall    secure_channel
  allreduce                dns_filter                    firewall           meson.build        simple_fwd_vnf
  app_shield_agent         east_west_overlay_encryption  ips                meson_options.txt  switch
  application_recognition  file_compression              ipsec_security_gw  nat                url_filter
  common                   file_integrity                l2_reflector       pcc                yara_inspection


Example 1 - DOCA Compression
----------------------------

TBD

Example 2 - DOCA RDMA
---------------------

TBD
