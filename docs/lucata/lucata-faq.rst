*Last updated: 9/08/2021*

Lucata Pathfinder FAQs
============
This page details answers to some commonly asked questions about the Lucata Pathfinder system. 

What are the detailed specs for GT's Pathfinder systems?
======================================================
GT currently hosts a two-chassis Pathfinder system which has 16 nodes in total with 8 in each chassis. The nodes are connected directly via RapidIO links. 

* Stationary cores per node/chassis: 1/8
* Memory-side processors per node/chassis: 8/64
* Memory channel width: 16 bit
* Memory per node/chassis: 64 GB/512 GB
* Gossamer Cores or Lucata Compute Elements (LCE) per node/chassis: 24/192
* LCE clock speed: 
* Maximum number of concurrent threads per node/chassis: 1536/12,288 (additional spawned threads sit in the run queue)
* Power usage per chassis: ~2KW max although likely lower in practice
* System node CPUs are PowerPC e6500 T2080 CPUs with 8 cores, running at 1.8 GHz
