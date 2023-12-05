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
===============================================
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

See the `DOCA Compress Programming Guide <https://docs.nvidia.com/doca/sdk/compress-programming-guide/index.html#introduction>`__ for more detailed information.

The DOCA Compress library allows users to execute compression and decompression operations on DOCA buffers using hardware acceleration. These buffers may reside in either DPU or host memory.

For the BlueField-3, this library supports decompress operations using the deflate and LZ4 algorithms.

DOCA is already installed on the ``dash3`` host and BlueField-3 nodes. DOCA comes with a number of example scripts for trying out the Compress capabilities; these can be viewed at the following location:

.. code:: 

  >$ ls /opt/mellanox/doca/samples/doca_compress

To build the ```compress_deflate``` sample:

.. code:: 

  >$ # First, some necessary updates to PATH and PKG_CONFIG_PATH env variables 
  >$ export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/opt/mellanox/doca/lib/aarch64-linux-gnu/pkgconfig:/opt/mellanox/flexio/lib/pkgconfig
  >$ export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/opt/mellanox/dpdk/lib/aarch64-linux-gnu/pkgconfig
  >$ export PATH=${PATH}:/opt/mellanox/doca/tools

  >$ # Building
  >$ cd /opt/mellanox/doca/samples/doca_compress/compress_deflate
  >$ meson ~/compress_build
  >$ ninja -C ~/compress_build

After a successful build, the program can be executed with

.. code::

  >$ ~/compress_build/doca_compress_deflate -p <PCI address of DOCA device> -f <input file> -m <compress/decompress mode> -o <output file>

Example 2 - DOCA RDMA
---------------------

*(TODO)*

DOCA is already installed on the ``dash3`` host and BlueField-3 nodes. DOCA comes with a number of example scripts for trying out the RDMA capabilities; these can be viewed at the following location:

.. code:: 

  >$ ls /opt/mellanox/doca/samples/doca_rdma

To build one of these samples:

.. code:: 

  >$ cd /opt/mellanox/doca/samples/doca_rdma/<sample_name>
  >$ meson build
  >$ ninja -C build

For example, to run and get more information about the ``doca_rdma_write_requester`` sample, we can first build the sample as described above and run ``./build/doca_rdma_write_requester -h`` to print a help synopsis on usage and flags.

