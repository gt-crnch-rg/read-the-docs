================================
GPU Power and Thermal Monitoring
================================

NVIDIA GPUs
===========

NVIDIA provides two frameworks for measuring power and thermal information on datacenter-grade GPUs.

- `NVIDIA Management Library (NVML) <https://developer.nvidia.com/management-library-nvml>`__ - a C-based API you can use in programs to measure statistics from datacenter GPUs
- `Datacenter GPU Management <https://docs.nvidia.com/datacenter/dcgm/latest/user-guide/index.html>`__ - a user space library that allows for monitoring and updating some settings on NVIDIA GPUs

Using NVML
~~~~~~~~~~

NVML is a powerful library for programmatically accessing various GPU metrics, including power and temperature. You can find a more comprehensive example of using NVML to measure temperature in our internal documentation: ``/projects/thermal_testing/scripts/nvml_thermal_measurement/nvml_measure_gpu_temps``.

Here's a shortened version of the C code that demonstrates how to retrieve GPU temperatures using NVML:

.. code-block:: c

   #include <nvml.h>
   #include <stdio.h>

   int main() {
     nvmlReturn_t result;
     unsigned int device_count, i, temperature;
     nvmlDevice_t device;

     // Initialize NVML
     result = nvmlInit();
     // ... error checking ...

     // Get device count
     result = nvmlDeviceGetCount(&device_count);
     // ... error checking ...

     for (i = 0; i < device_count; i++) {
       // Get device handle
       result = nvmlDeviceGetHandleByIndex(i, &device);
       // ... error checking ...

       // Get temperature
       result = nvmlDeviceGetTemperature(device, NVML_TEMPERATURE_GPU, &temperature);
       // ... error checking ...

       printf("GPU %u: Temperature = %u°C\n", i, temperature);
     }

     // Shutdown NVML
     result = nvmlShutdown();
     // ... error checking ...

     return 0;
   }

This code snippet demonstrates the basic steps involved in using NVML to retrieve GPU temperatures:

1.  **Initialize NVML:** `nvmlInit()` initializes the NVML library.
2.  **Get Device Count:** `nvmlDeviceGetCount()` retrieves the number of NVIDIA GPUs in the system.
3.  **Iterate Through GPUs:** The code iterates through each GPU.
4.  **Get Device Handle:** `nvmlDeviceGetHandleByIndex()` retrieves a handle to the GPU.
5.  **Get Temperature:** `nvmlDeviceGetTemperature()` retrieves the GPU's temperature.
6.  **Shutdown NVML:** `nvmlShutdown()` shuts down the NVML library.

You can also find a complete working example of this code in the script located at ``/projects/thermal_testing/scripts/nvml_thermal_measurement/nvml_measure_gpu_temps``. This script can be compiled and executed to display the temperatures of the NVIDIA GPUs in your system.

Using DCGM
~~~~~~~~~~

DCGM offers a higher-level interface for GPU monitoring and management. DCGM is often integrated into workload management systems like Slurm to automatically collect GPU monitoring data for jobs. This is commonly done using Slurm prolog and epilog scripts, which are executed by Slurm before and after a job runs, respectively. The Slurm prolog script initializes DCGM monitoring at the beginning of a job, and the epilog script stops monitoring and saves the collected data at the end of the job.
The output of the DCGM monitoring is then saved to files.

**Prolog Script Examples:**

* **Creating a DCGM Group:**

    ```bash
    dcgmi group -c j$SLURM_JOB_ID
    ```

    This command creates a DCGM group associated with the Slurm job ID. This allows for collecting statistics specific to that job.

* **Adding GPUs to a DCGM Group:**

    ```bash
    dcgmi group --group $groupid --add $SLURM_JOB_GPUS
    ```

    This command adds the GPUs allocated to the Slurm job (`$SLURM_JOB_GPUS`) to the previously created DCGM group (`$groupid`).

* **Enabling Statistics Collection:**

    ```bash
    dcgmi stats --group $groupid --enable
    ```

    This command enables the collection of statistics for the specified DCGM group.

* **Starting Job Statistics:**

    ```bash
    dcgmi stats --group $groupid --jstart $SLURM_JOBID
    ```

    This command marks the start of statistics collection for the DCGM group, associating it with the Slurm job ID.

**Epilog Script Examples:**

* **Stopping Job Statistics:**

    ```bash
    dcgmi stats --jstop $SLURM_JOBID
    ```

    This command marks the end of statistics collection for the Slurm job.

* **Retrieving Statistics:**

    ```bash
    dcgmi stats --verbose --job $SLURM_JOBID
    ```

    This command retrieves the collected statistics for the specified Slurm job.

* **Saving Statistics to a File:**

    ```bash
    dcgmi stats --verbose --job $SLURM_JOBID | \
    sudo -u $SLURM_JOB_USER tee /nethome/${SLURM_JOB_USER}/dcgm-gpu-stats-$HOSTNAME-$SLURM_JOBID.out
    ```

    This command retrieves the statistics and saves them to a file in the user's home directory. The filename includes information such as the hostname and Slurm job ID.

These examples illustrate how DCGM commands are used within the prolog and epilog scripts to manage GPU monitoring for Slurm jobs. For detailed information on these and other DCGM commands, refer to the official DCGM documentation.

AMD GPUs
========

Measuring power and thermal information on AMD GPUs can be done using various tools.

Using rocm-smi
~~~~~~~~~~~~~~

The `rocm-smi` utility is part of the ROCm (Radeon Open Compute) software stack and provides a command-line interface for monitoring and managing AMD GPUs. To measure the power consumption of an AMD GPU on `instinct.crnch`, you can use a command like the following:

.. code-block:: bash

   rocm-smi --showpower
   rocm-smi --showtemp

You can script `rocm-smi` outputs or use its Python bindings via ROCm tools.

Using uProf
~~~~~~~~~~~

AMD's uProf (Unified Profiler) is a more comprehensive profiling tool that can also be used to measure power consumption along with other performance metrics. For detailed information on how to use uProf for power analysis on AMD GPUs, please refer to the official uProf documentation: `<https://www.amd.com/en/developer/uprof.html>`.

Intel GPUs
==========

Measuring power on Intel GPUs can be done using the `xpu-smi` utility.

Using xpu-smi
~~~~~~~~~~~~~

The `xpu-smi` tool is used to manage and monitor Intel data center GPUs. To measure the power consumption of an Intel GPU on `dash3`, you can use a command similar to this:

.. code-block:: bash

   xpu-smi metrics -g all | grep "Power"

This command will likely output various power-related metrics for all Intel GPUs in the system. You might need to adjust the `grep` filter depending on the specific output of `xpu-smi`.

Using intel-smi
~~~~~~~~~~~~~~~

Consider using intel-smi for Intel GPU power reporting on the dash nodes which have Intel GPUs. The intel-smi tool is another command-line utility for managing and monitoring Intel GPUs. You can find more information about it here: https://github.com/nicejunjie/intel-smi and request access via a help ticket.
