GraphBLAS Resources
============================

Why Bother using Linear Algebra packages?
-----------------------------------------
So why go through the effort of installing the library, figuring out how to link, and dealing withC/Fortran issues?The libraries are tuned and optimized. Users can focus on their code details by reducing the amount of code to produce/debug, and more options to switch methods if necessary.In the case of matrix multiplication, for example, the time complexity of the best implementationusing a triple loop does not compare with the best parallel and vector implementation using saidlibraries. The performance is better by a factor of about 4-5.

What is BLAS?
-------------
Basic Linear Algebra Subprograms (BLAS) is a specification that prescribes a set of low-level routines for performing common linear algebra operations such as vector addition, scalar multiplication, dot products, linear combinations, and matrix multiplication. They are the de facto standard low-level routines for linear algebra libraries; Many highly tuned implementations exist for various problems that can be cast into  (Atlas, Flame, LAPACK, etc... ) 


- `Jack Dongarra - Adaptive Linear Solvers <https://www.youtube.com/watch?v=TPP5LavGEiI>`__ - a nice high-level overview of BLAS-style approaches to solving linear systems. (1 hr, ATPESC 2019)
- `BLAS Tutorial <https://www.cse-lab.ethz.ch/wp-content/uploads/2019/10/hpcseI-tutorial2-blas.pdf>`__ 
- `SciNet HPC BLAS and LAPACK <https://www.youtube.com/watch?v=jhxbk6AlCps>`__


Why do we need a BLAS for Graphs? 
---------------
Graph problems are challenging to program due to irregular access patterns, poor locality, and difficulty in caching and parallelization.
Further, contemporary computer architectures are good at processing linear and hierarchical data structures, such as lists, stacks, or trees, and a massive amount of random data access is required, CPU has frequent cache misses, and implementing parallelism is difficult.

Graph algorithms have a high communication-to-computation ratio. This means that standard latency hiding techniques break down, e.g. pre-fetching and branch prediction provide little benefit.


What is GraphBLAS?
------------------
GraphBLAS is a graph-oriented version of linear algebra routines. 

s an API specification that defines standard building blocks for graph algorithms in the language of linear algebra.GraphBLAS is built upon the notion that a sparse matrix can be used to represent graphs as either an adjacency matrix or an incidence matrix. The GraphBLAS specification describes how to graph operations (e.g. traversing and transforming graphs) can be efficiently implemented via linear algebraic methods (e.g. matrix multiplication) over different semirings.

It is believed that the state of the art in constructing a large collection of graph algorithms in terms of linear algebraic operations is mature enough to support the emergence of a standard set of primitive building blocks.

A key insight behind this work is that when a graph is represented by a sparse incidence or adjacency matrix, sparse matrix-vector multiplication is a step of breadth-first search. By generalizing the pair of scalar operations involved in the linear algebra computations to define a semiring, we can extend the range of these primitives to support a wide range of parallel graph algorithms.

In the implementation of GraphBLAS, graphs are encoded as sparse adjacency matrices and use vector/matrix operations to express graph algorithms.

How should I get started learning about GraphBLAS?
----------------------
There are a wide variety of resources `GraphBLAS-Pointers repo <https://github.com/GraphBLAS/GraphBLAS-Pointers>`__. The following listed resources (with stars) are likely the best place to start. We suggest the videos followed by Gábor's tutorial. 

Suggested Videos
^^^^^^^^^^^^^^^^
- `Graph Analytics: A Foundational Building Block for the Data Analytics World, Tim Mattson, Henry Gabb <https://techdecoded.intel.io/big-picture/graph-analytics-a-foundational-building-block-for-the-data-analytics-world/>`__ - a short 13 minute video introducing GraphBLAS
- `GraphBLAS: A linear algebraic approach for high-performance graph algorithms <https://archive.fosdem.org/2020/schedule/event/graphblas/>`__

Tutorials
^^^^^^^^^
- `Introduction to GraphBLAS: A linear algebraic approach for concise, portable, and high-performance graph algorithms <https://zenodo.org/record/4318870>`__ - this is just the slides for the longer version of the above video talk.  by Gábor Szárnyas
- `HPEC 2021 Hand-on Tutorial Using Docker <https://github.com/GraphBLAS-Tutorials/HPEC21-Tutorial>`__ - this tutorial allows you to run on your laptop and follow along. 

Other Suggested Papers/Talks
^^^^^^^^^
- GraphBLAS Wikipedia page
- `Lucata GraphBLAS introduction <https://www.slideshare.net/jasonriedy/lagraph-20211013>`__

What should I do now that I know more about GraphBLAS?
----------------
We suggest that you use this new GraphBLAS expertise with the Lucata Pathfinder system. Please see this page for specific information on running GraphBLAS with the Pathfinder. 
