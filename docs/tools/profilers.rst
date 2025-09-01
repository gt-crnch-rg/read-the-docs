============
Profilers
============

Profiling code is an important part of the optimization process for running new applications on novel architectures. While profilers typically target more mature architectures, there are a wide variety of Linux-based tools that can be used to evaluate the performance of your code, find bottlenecks, and optimize the execution of your code.  

General
==================================

Performance profiling in SLURM environments involves analyzing the behavior and resource usage of applications running on high-performance computing (HPC) clusters managed by the SLURM workload manager.
Profiling helps identify bottlenecks in CPU, memory, I/O, and communication, enabling developers to optimize code and improve efficiency.
Tools such as HPCToolkit, NVIDIA Nsight, Intel VTune, Likwid, PAPI, and Perf are commonly integrated with SLURM job scripts using srun or mpirun commands.
Profiling can be applied to both serial and parallel jobs, and SLURM's environment variables and job monitoring utilities assist in gathering and organizing performance data.

.. note::
   Proper profiling in SLURM also requires careful resource allocation and minimal interference with other jobs, often using isolated nodes or job-specific environments.
   Using flags `--exclusive` and `--mem=0` ensures that the session reserves all resources, including both computing resources (CPU, GPU, etc.) and memory.

HPCToolkit
==================================

`HPCToolkit <https://hpctoolkit.org>`__ is an integrated suite of tools for measurement and analysis of program performance on computers ranging from multicore desktop systems to GPU-accelerated supercomputers.
By using statistical sampling of timers and hardware performance counters on CPUs, HPCToolkit collects accurate measurements of a program's CPU work, resource consumption,
and inefficiency and attributes them to the full calling context in which they occur. By monitoring GPU operations, gathering instruction-level metrics within GPU kernels,
and attributing the costs of GPU work to heterogeneous calling contexts. HPCToolkit provides insight into the performance of GPU-accelerated codes.
HPCToolkit works with multilingual, fully optimized applications that are statically or dynamically linked. HPCToolkit is designed for use on large parallel systems.
HPCToolkit's presentation tools enable rapid analysis of a program's execution costs, inefficiency, and scaling characteristics both within and across nodes of a parallel system.
HPCToolkit supports measurement and analysis of serial codes, threaded codes (e.g. pthreads, OpenMP), MPI, and hybrid (MPI+threads) parallel codes, as well as GPU-accelerated codes that offload computation to AMD, Intel, or NVIDIA GPUs.

NVIDIA Nsight
==================================

`NVIDIA Nsight™ Systems <https://developer.nvidia.com/nsight-systems>`__ is a system-wide performance analysis tool designed to visualize an application's algorithms, identify the largest opportunities to optimize,
and tune to scale efficiently across any quantity or size of CPUs and GPUs, from large servers to our smallest systems-on-a-chip (SoCs).

`NVIDIA Nsight™ Compute <https://developer.nvidia.com/nsight-compute>`__ is an interactive profiler for CUDA® and NVIDIA OptiX™ that provides detailed performance metrics and API debugging via a user interface and command-line tool.
Users can run guided analysis and compare results with a customizable and data-driven user interface, as well as post-process and analyze results in their own workflows.

Intel's VTune
==================================

`Intel® VTune™ <https://gt-crnch-rg.readthedocs.io/en/main/tools/vtune-profiler.html>`__ Profiler optimizes application performance, system performance, and system configuration for AI, HPC, cloud, IoT, media, storage, and more.

* CPU, GPU, and NPU: Tune the entire application's performance―not just the accelerated portion.
* Multilingual: Profile SYCL*, C, C++, C#, Fortran, OpenCL™ code, Python*, Google Go* programming language, Java*, .NET, Assembly, or any combination of languages.
* System or Application: Get coarse-grained system data for an extended period or detailed results mapped to source code.
* Power: Optimize performance while avoiding power- and thermal-related throttling.

Likwid
==================================

`Likwid <https://github.com/RRZE-HPC/likwid>`__ is a simple to install and use toolsuite of command line applications and a library for performance oriented programmers.
It works for Intel, AMD, ARMv8 and POWER9 processors on the Linux operating system.
There is additional support for Nvidia and AMD GPUs.
There is support for ARMv7 and POWER8/9 but there is currently no test machine in our hands to test them properly.

PAPI
==================================

`The Performance Application Programming Interface (PAPI) <https://github.com/icl-utk-edu/papi/wiki/>`__ provides tool designers and application engineers with a consistent interface and methodology
for the use of low-level performance counter hardware found across the entire compute system (i.e. CPUs, GPUs, on/off-chip memory, interconnects, I/O system, energy/power, etc.).
PAPI enables users to see, in near real time, the relations between software performance and hardware events across the entire computer system.

Perf
==================================

`Perf <https://perfwiki.github.io/main/>`__, also called perf_events, can instrument CPU performance counters, tracepoints, kprobes, and uprobes (dynamic tracing).
It is capable of lightweight profiling. It is also included in the Linux kernel, under `tools/perf`, and is frequently updated and enhanced.
