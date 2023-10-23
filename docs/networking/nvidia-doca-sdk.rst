===============
NVIDIA DOCA SDK
===============

DOCA Resources
--------------

Using DOCA Compression
----------------------

Using DOCA RDMA
---------------
The DOCA RDMA library allows the user to directly access the memory of remote machines without CPU interruptions, for fewer context switches for I/O operations. DOCA RDMA consists of two connected sides, and feature the folllowing operations:

* Receive 
* Send
* Send with immediate
* Write
* Write with immediate
* Read
* Atomic Compare and Swap
* Atomic Fetch and Add



Each DOCA RDMA job include the following structure as its base:

.. code-block:: cpp

  struct doca_job {
      int type;                   /**< Defines the type of the job. (see `enum doca_rdma_job_types`) */
      int flags;                  /**< Job submission flags (see `enum doca_job_flags`). */
      struct doca_ctx *ctx;       /**< Doca RDMA context targeted by the job. */
      union doca_data user_data;  /**< Job identifier provided by user. Will be returned back on completion. */
  };

_______
Receive
_______  

.. code-block:: cpp

  struct doca_rdma_job_recv {
      struct doca_job base;       /**< Common job data; base.type = DOCA_RDMA_JOB_RECV */
      struct doca_buf *dst_buff;  /**< Destination data buffer,
                                   *  chain len must not exceed recv_buf_chain_len property
                                   */
  };

Notes:

* dst_buff is a pointer to a local memory address, where the received message is appended after the data section in the destination buffer.
* if the corresponding DOCA RDMA job on the remote side is "write with immediate," the destination buffer may be NULL.

