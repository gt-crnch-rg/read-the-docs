===============
NVIDIA DOCA SDK
===============

==============
DOCA Resources
==============

Note that the DOCA code samples get installed with the DOCA SDK on the host device and on the BlueField itself and can be found under `/opt/mellanox/doca/samples`.

.. code:: 

  >$ ls /opt/mellanox/doca/samples/
  common.c  doca_apsh          doca_common    doca_dma  doca_dpi             doca_flow  doca_regex  doca_telemetry
  common.h  doca_comm_channel  doca_compress  doca_dpa  doca_erasure_coding  doca_rdma  doca_sha    flexio

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
^^^^^^^^^^

The user can retrieve the result of an RDMA job using ``doca_workq_progress_retrieve()``. The user must provide a ``doca_event`` struct with a ``result.ptr`` field pointing to an allocated ``doca_rdma_result``, as seen below.

.. code-block:: cpp

  struct doca_event event = {0};
  struct doca_rdma_result rdma_result;
  memset(&rdma_result, 0, sizeof(rdma_result)); 

  event.result.ptr = (void *)(&rdma_result);
  doca_workq_progress_retrieve(workq, &event, DOCA_WORKQ_RETRIEVE_FLAGS_NONE);

More information about the workq operating modes can be seen in the `documentation <https://docs.nvidia.com/doca/sdk/rdma-programming-guide/index.html#waiting-for-job-completion>`_.

Once the RDMA job progress is retrieved, the ``doca_rdma_result`` struct is populated with information on the job:

* ``result`` holds a ``doca_error_t`` representing the job result.
* ``opcode`` holds the opcode of the corresponding job for a completed receive job (e.g. Write, Send).
* ``immediate_data`` holds the 32-bit immediate data send from the remote side in the case of a ``opcode`` of a Send With Immediate or Write With Immediate job (``DOCA_RDMA_OPCODE_RECV_SEND_WITH_IMM, DOCA_RDMA_OPCODE_RECV_WRITE_WITH_IMM``).

State
^^^^^

The DOCA RDMA library also provides the following values to describe the state of the RDMA instance, allowing the user to determine the connection status of the RDMA instances and errors.

.. code-block:: cpp

  enum doca_rdma_state {
      DOCA_RDMA_STATE_RESET = 0,
      DOCA_RDMA_STATE_INIT,
      DOCA_RDMA_STATE_CONNECTED,
      DOCA_RDMA_STATE_ERROR,
  };

-------------------------
Environment Setup
-------------------------

Configuring DOCA RDMA Instances
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Prior to executing RDMA jobs, the RDMA context must be properly configured:

#. First ensure the device is suitable for the RDMA job type to be executed. This can be done using ``doca_devinfo_list_create()`` to see all DOCA devices, and querying for their capabilities using ``doca_rdma_get_*(struct doca_devinfo *, ...)`` or using ``doca_rdma_job_get_supported()`` to determine compatibility with RDMA job types.
#. An RDMA instance must be created using ``doca_rdma_create()``, which will have a context obtained by ``doca_rdma_as_ctx()``. Optionally, the default properties of the instance can be modified using ``doca_rdma_set_<property>()`` and ``doca_rdma_get_<property>(struct doca_rdma *, …)`` functions. 
#. The chosen device must be added to the RDMA context using ``doca_ctx_dev_add()``.
#. Use ``doca_ctx_start()`` to start the RDMA context, which updates the instance to the ``DOCA_RDMA_STATE_INIT`` state.
#. Export each RDMA instance to the remote side to a blob by using ``doca_rdma_export()``.
#. Transfer the blob to the opposite side out-of-band (OOB) and provide it as input to the ``doca_rdma_connect()`` function on that side. Once connected, the state of the RDMA instance updates to ``DOCA_RDMA_STATE_CONNECTED`` and it is ready to start running jobs. 


Configuring DOCA Core Objects
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Using DOCA RDMA requires initializing a few DOCA Core objects as well.

* Executing any RDMA job requires a workq. This can be created using ``doca_workq_create()`` and subsequently added to the RDMA context using ``doca_ctx_workq_add()``. More information on the workq's event-driven and polling modes can be seen `here <https://docs.nvidia.com/doca/sdk/rdma-programming-guide/index.html#workq>`_.
* Any job in which data is passed between devices requires a memory map to be created on each side using ``doca_mmap_create()``. To configure the memory map (MMAP), perform the following:

  #. Add the chosen device to the memory map using ``doca_mmap_dev_add()``.
  #. The relevant memory map properties must be set. For example, setting the memory range of the MMAP is mandatory and can be done using ``doca_mmap_set_memrang()``.
  #. Set the MMAP's permissions according to the required permissions for RDMA operations using ``doca_mmap_set_permissions()``. See the below section on permissions for further details. Note that executing RDMA operations requires the memory map's permissions to include ``DOCA_ACCESS_LOCAL_READ_WRITE`` (from ``enum doca_access_flags``); to allow remote access to the memory region of the memory map, the relevant RDMA permission from the ``enum doca_access_flags`` must be set according to the RDMA jobs to be executed.
  #. Start the MMAP so it is ready to use by calling ``doca_mmap_start()``.

* To allow remote memory access for the memory map, it must be exported using ``doca_mmap_export_rdma()`` and passed to the remote side (the side requesting the remote RDMA operation). The remote side must also create an MMAP from the exported blob (referred to as remote MMAP from here on) using ``doca_mmap_create_from_export()``.
* Executing jobs in which data is passed between devices also requires the requester to create a buffer inventory using ``doca_buf_inventory_create()``, which can be started using ``doca_buf_inventory_start()``.

Permissions
^^^^^^^^^^^

Executing various RDMA jobs require different permissions on both sides of the connection. See `here <https://docs.nvidia.com/doca/sdk/rdma-programming-guide/index.html#summary-of-necessary-permissions-for-rdma-operations>`_ for a summary of the required permissions for various operations.

RDMA Job Cycle and Clean Up
^^^^^^^^^^^^^^^^^^^^^^^^^^^

After initializing the objects and connection as described above, RDMA jobs can be executed on the instance. See `this link <https://docs.nvidia.com/doca/sdk/rdma-programming-guide/index.html#rdma-job-cycle>`_ for further information on the job cycle of RDMA jobs. 

After all jobs have been executed, follow `these steps <https://docs.nvidia.com/doca/sdk/rdma-programming-guide/index.html#clean-up>`_ for freeing up the allocated resources for the RDMA instance.

--------
Examples
--------

To be completed
