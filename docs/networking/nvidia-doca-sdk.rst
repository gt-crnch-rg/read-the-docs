===============
NVIDIA DOCA SDK
===============

==============
DOCA Resources
==============

======================
Using DOCA Compression
======================

===============
Using DOCA RDMA
===============
The DOCA RDMA library allows the user to directly access the memory of remote machines without CPU interruptions, for fewer context switches for I/O operations. DOCA RDMA consists of two connected sides, and feature the folllowing jobs:

* `Receive <receive_>`_ 
* `Send/Send With Immediate`_
* `Write/Write With Immediate`_
* `Read <read_>`_
* `Atomic Compare and Swap`_
* `Atomic Fetch and Add`_

----
Jobs
----

Each DOCA RDMA job include the following structure as its base:

.. code-block:: cpp

  struct doca_job {
      int type;                   /**< Defines the type of the job. (see `enum doca_rdma_job_types`) */
      int flags;                  /**< Job submission flags (see `enum doca_job_flags`). */
      struct doca_ctx *ctx;       /**< Doca RDMA context targeted by the job. */
      union doca_data user_data;  /**< Job identifier provided by user. Will be returned back on completion. */
  };


.. _receive:

Receive
^^^^^^^  

Used for receiving a message from the remote side. This job is submitted prior to a Send, Send With Immediate, or Write With Immediate job on the remote. 

.. code-block:: cpp

  struct doca_rdma_job_recv {
      struct doca_job base;       /**< Common job data; base.type = DOCA_RDMA_JOB_RECV */
      struct doca_buf *dst_buff;  /**< Destination data buffer,
                                   *  chain len must not exceed recv_buf_chain_len property
                                   */
  };

Note:

* ``dst_buff`` is a pointer to a local memory address, where the received message is appended after the data section in the destination buffer.
* if the corresponding DOCA RDMA job on the remote side is sending an empty job or Write With Immediate, the destination buffer may be NULL.


.. _send:

Send/Send With Immediate
^^^^^^^^^^^^^^^^^^^^^^^^

Used for transferring a message to the remote side, optionally including immediate data. The remote side must submit a Receive job. 

.. code-block:: cpp
  struct doca_rdma_job_send {
      struct doca_job base;                           /**< Common job data; base.type = DOCA_RDMA_JOB_SEND or DOCA_RDMA_JOB_SEND_IMM */
      struct doca_buf const *src_buff;                /**< Source data buffer */
      doca_be32_t immediate_data;                     /**< Immediate data (only for SEND_IMM job type) */
      struct doca_rdma_addr const *rdma_peer_addr;    /**< Optional: For RDMA context of type UD or DC */
  };

Note:

* When executing a Send With Immediate job, an immediate value is also specified. The ``immediate_data`` is a 32-bit value sent to the remote side, out-of-band, and should be in Big-Endian format. This value is only received at the remote side if the Receive job completes successfully.


.. _write:

Write/Write With Immediate
^^^^^^^^^^^^^^^^^^^^^^^^^^

Used for writing data to the remote system's memory. Unlike Send jobs, this operation does not have to be paired with a corresponding Receieve job. 

.. code-block:: cpp

  struct doca_rdma_job_read_write {
      struct doca_job base;                           /**< Common job data; base.type = DOCA_RDMA_JOB_WRITE or base.type = DOCA_RDMA_JOB_WRITE_IMM */
      struct doca_buf *dst_buff;                      /**< Destination data buffer */
      struct doca_buf const *src_buff;                /**< Source data buffer */
      doca_be32_t immediate_data;                     /**< Immediate data for write with imm (Ignored in READ job type) */
      struct doca_rdma_addr const *rdma_peer_addr;    /**< Optional: For RDMA context of type DC */
  };

Note:

* ``dst_buff`` points to a remote memory address to which the read data is appended.
* ``src_buff`` points to a local memory address from which the data is read.
* On Write With Immediate jobs, ``immediate_data`` is a 32-bit value sent to the remote side, out-of-band, and in Big-Endian format. 


.. _read:

Read
^^^^^^^^^^^^^^^^^^^^^^^^

Used for reading data from the remote system's memory. Unlike Receive jobs, this operation does not have to be paired with a corresponding Send job. 

.. code-block:: cpp

  struct doca_rdma_job_read_write {
      struct doca_job base;                           /**< Common job data; base.type = DOCA_RDMA_JOB_READ */
      struct doca_buf *dst_buff;                      /**< Destination data buffer */
      struct doca_buf const *src_buff;                /**< Source data buffer */
      doca_be32_t immediate_data;                     /**< Immediate data for write with imm (Ignored in READ job type) */
      struct doca_rdma_addr const *rdma_peer_addr;    /**< Optional: For RDMA context of type DC */
  };

Note:

* ``dst_buff`` points to a local memory address to which the read data is appended.
* ``src_buff`` points to a remote memory address from which the data is read.


.. _compare:

Atomic Compare and Swap
^^^^^^^^^^^^^^^^^^^^^^^

Used for performing an atomic comparison of a provided 64-bit value with a value present in the remote system's memory. If the compared values are equal, the destination value is swapped with a provided swap value; otherwise, the destination value remains unchanged.

.. code-block:: cpp

  struct doca_rdma_job_atomic {
      struct doca_job base;                           /**< Common job data; base.type = DOCA_RDMA_JOB_ATOMIC_CMP_SWP */
      struct doca_buf *cmp_or_add_dest_buff;          /**< Destination data buffer */
      struct doca_buf *result_buff;                   /**< Result of the atomic operation:
                                                       *  remote original data before add, or remote original data
                                                       *  before compare
                                                       */
      uint64_t swap_or_add_data;                      /**< For add, the increment value
                                                       *  for cmp, the new value to swap
                                                       */
      uint64_t cmp_data;                              /**< Value to compare for compare and swap */
      struct doca_rdma_addr const *rdma_peer_addr;    /**< Optional: For RDMA context of type DC */
  };

Note:

* Only the first 8 bytes following the data address in the remote memory destination buffer are considered for atomic operations.
* The destination buffer ``cmp_or_add_dest_buff`` points to a remote memory address, and only the first 64-bits following the beginning of the data section of the buffer are considered for comparison.
* The result buffer ``result_buff`` points to a local memory address to which the original value of the destination buffer (before comparison) is written.


.. _fetch:

Atomic Fetch and Add
^^^^^^^^^^^^^^^^^^^^

Used for performing an atomic addition of a provided 64-bit value to a value present in the remote system's memory. 

.. code-block:: cpp

  struct doca_rdma_job_atomic {
      struct doca_job base;                           /**< Common job data; base.type = DOCA_RDMA_JOB_ATOMIC_CMP_SWP */
      struct doca_buf *cmp_or_add_dest_buff;          /**< Destination data buffer */
      struct doca_buf *result_buff;                   /**< Result of the atomic operation:
                                                       *  remote original data before add, or remote original data
                                                       *  before compare
                                                       */
      uint64_t swap_or_add_data;                      /**< For add, the increment value
                                                       *  for cmp, the new value to swap
                                                       */
      uint64_t cmp_data;                              /**< Value to compare for compare and swap */
      struct doca_rdma_addr const *rdma_peer_addr;    /**< Optional: For RDMA context of type DC */
  };

Note:

* Only the first 8 bytes following the data address in the remote memory destination buffer are considered for atomic operations.
* The destination buffer ``cmp_or_add_dest_buff`` points to a remote memory address.
* The result buffer ``result_buff`` points to a local memory address to which the original value of the destination buffer (before addition) is written.
* ``cmp_data`` is ignored for this operation.

---------
Debugging
---------

Job Result

State

-------------------------
Environment Configuration
-------------------------

Section 5 usage

--------
Examples
--------

To be completed
