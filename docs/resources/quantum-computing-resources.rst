Quantum Computing Resources
===========================

*Last updated: May 4, 2022*

While we don’t currently host any quantum hardware, this page lists
resources for common simulators, tutorials, and benchmarks that can be
used with simulators or cloud-based quantum systems.

What fundamentals do you need to get started with quantum computing research?
-----------------------------------------------------------------------------

-  You need a good base knowledge of `linear
   algebra <https://community.qiskit.org/textbook/ch-prerequisites/linear_algebra.html>`__
   and some exposure to `quantum
   mechanics <https://plus.maths.org/content/ridiculously-brief-introduction-quantum-mechanics>`__
   to get started with quantum computing.

   -  University of Waterloo has a `nice
      PDF <https://uwaterloo.ca/institute-for-quantum-computing/sites/ca.institute-for-quantum-computing/files/uploads/files/mathematics_qm_v21.pdf>`__
      by Martin Laforest called “The Mathematics of Quantum Mechanics”
      for their QCSYS summer school that can be used as a high-level
      introduction to what you need to know.

-  Understanding `Dirac
   notation <http://www.hep.manchester.ac.uk/u/stevew/teaching/dirac.pdf>`__
   (also called bra-ket) would also be helpful! `Another
   resource <https://users.physics.ox.ac.uk/~Steane/teaching/Diracnote.pdf>`__
-  Ideally you also need some initial experience with programming in a
   language like Python or C/C++. Most quantum computing APIs use Python
   as their primary language, but some tools like
   `XACC/QCOR <https://xacc.readthedocs.io/en/latest/>`__ use C++ for
   most of their software infrastructure.

What related courses does Georgia Tech offer?
---------------------------------------------

-  `Linear algebra (MATH
   1554) <https://math.gatech.edu/courses/math/1554>`__
-  `Quantum Computing Technologies (PHYS
   4813) <https://parkerlab.gatech.edu/web/research/>`__ - Dr. Colin Parker
-  `Quantum Information and Quantum Computing (PHYS/MATH
   4782) <https://math.gatech.edu/courses/math/4782>`__
-  `Introduction to Quantum Computing
   (CS8803/ECE8803) <https://www.cc.gatech.edu/~moin/>`__ - Dr. Moin
   Qureshi
-  `Quantum computing devices and Hardware
   (CS8863) <https://cpb-us-w2.wpmucdn.com/sites.gatech.edu/dist/8/675/files/2019/03/ECE8863-2019fall.pdf>`__
   - Dr. Asif Khan

What are the “best” resources to get started with?
--------------------------------------------------

Dr. Eugene Dumitrescu at ORNL has suggested the following resources,
which include an accurate mathematical picture of quantum computing.

-  `Nielsen and Chuang’s Quantum Computation and Quantum
   Information <https://www.cambridge.org/core/books/quantum-computation-and-quantum-information/01E10196D0A682A6AEFFEA52D53BE9AE>`__
   - Sometimes referred to as Mike and Ike, this book is still very
   relevant even though it was first published in 2012! Most people
   consider this the most important book on the topic.
-  `Quantum Computing: A Gentle
   Introduction <https://en.wikipedia.org/wiki/Quantum_Computing:_A_Gentle_Introduction>`__
   - recommended by Prof. Moin Qureshi in addition to Nielsen and Chuang
   and has some added info on quantum algorithms
-  `Griffith’s Quantum Mechanics
   book <https://www.goodreads.com/book/show/153908.Introduction_to_Quantum_Mechanics>`__
-  `John Preskill’s notes for Physics
   219 <http://theory.caltech.edu/~preskill/ph219/>`__
-  `Scott Aaronson’s notes for his Intro to Quantum Information Science
   course <https://www.scottaaronson.com/blog/?p=3943>`__
-  `Video lectures from
   CMU <https://www.youtube.com/playlist?list=PLm3J0oaFux3YL5qLskC6xQ24JpMwOAeJz>`__
-  `MIT OpenCourseWare
   (OCW) <https://ocw.mit.edu/courses/mathematics/18-435j-quantum-computation-fall-2003/>`__

Vendor-provided Tutorials
*************************

`IBM’s Circuit Composer and Qiskit
Notebooks <www.quantum-computing.ibm.com>`__

-  `Qiskit textbook <https://community.qiskit.org/textbook/>`__
-  `Qiskit for Educators <community.qiskit.org/education>`__
-  `Hello World with
   Qiskit <https://hackernoon.com/exploring-quantum-programming-from-hello-world-to-hello-quantum-world-109add25305f>`__
   - not designed by IBM

`Microsoft’s Quantum Katas using
Q# <https://github.com/Microsoft/QuantumKatas>`__ - Uses Jupyter
notebooks to introduce simple quantum concepts where each Kata
investigates one technique or idea.

`DWave Tutorials (quantum
annealing) <https://www.dwavesys.com/resources/tutorials>`__

University Tutorials
*************************

`EPiQC Tutorial on Quantum
Computing <https://www.epiqc.cs.uchicago.edu/tutorial>`__: Includes a
Docker image to run all the simulation tools on your local machine.
Based in part on Scaffold compiler tools and Qiskit.

`NC State Quantum Primer for IBM Q and
DWAVE <https://arcb.csc.ncsu.edu/~mueller/qc/qc-tut/>`__

Quantum Algorithms and Survey Papers
************************************

`Next Steps in Quantum Computing: Computer Science’s
Role <https://cra.org/ccc/wp-content/uploads/sites/2/2018/11/Next-Steps-in-Quantum-Computing.pdf>`__

`QDB: From Quantum Algorithms Towards Correct Quantum
Programs <https://quantumarchitectureprinceton.github.io/QuantumArchitecturePrinceton.github.io/publications/QDB-quantum-algorithms.pdf>`__
- this paper from Princeton describes some quantum algorithm/benchmark
implementations using ScaffCC and Qiskit.

`Overview and Comparison of Gate Level Quantum Software
Platforms <https://arxiv.org/abs/1807.02500>`__ - July 2018 paper

Software
*************************

Qiskit
------

-  `Qiskit
   installation <https://qiskit.org/documentation/install.html>`__

QCOR (ORNL)
-----------

-  `Get started quickly with XACC using
   Docker <docker%20run%20--security-opt%20seccomp=unconfined%20--init%20-it%20-p%203000:3000%20qcor/qcor>`__
-  `QCOR
   Examples <https://github.com/ORNL-QCI/qcor/tree/master/examples>`__

XACC (ORNL)
-----------
-  `Get started quickly with XACC using
   Docker <https://xacc.readthedocs.io/en/latest/developers.html#quick-start-with-docker>`__
-  `XACC
   Tutorial <https://xacc.readthedocs.io/en/latest/tutorials.html#pulse-control-tutorial>`__
-  `XACC Python
   Examples <https://github.com/eclipse/xacc/tree/master/python/examples>`__

Quantum Hardware Testbeds and Resources
***************************************

-  `IBM
   Q <https://www.ibm.com/quantum-computing/technology/experience/>`__
-  `Microsoft Azure
   Quantum <https://azure.microsoft.com/en-us/services/quantum/>`__
-  `Rigetti Quantum Cloud Service and Forest
   SDK <https://www.rigetti.com/>`__
-  `DWave Leap (quantum annealing) <https://www.dwavesys.com/take-leap>`__


While the above resources are considered primary resources, the
following links are provided as additional resources.

Introductory videos about quantum computing
*******************************************

These videos might provide a good high-level introduction to quantum
computing and were put together from the IEEE Quantum Computing
Education Effort (to be publicly announced).

-  `Talia Gershon of IBM Explains Quantum Computing in 5 Levels of
   Difficulty (20 min) <https://youtu.be/OWJCfOvochA>`__
-  `Quantum Computing - Top 3 Microsoft Breakthroughs with Krysta Svore
   (25 min) <https://youtu.be/5p2_moQZJWo>`__
-  `Quantum Computers Explained; Limits of Human Technology by
   nova.org.au (7 min) <https://youtu.be/JhHMJCUmq28>`__
-  `John Preskill’s Keynote Lecture at Q2B on 5 Dec 2017 (50
   min) <https://www.youtube.com/watch?v=h4nUyF9cSaw>`__
-  `Quantum Computing for Dummies : A Simple Explanation for Normal
   People by Sean Ong (6
   min) <https://www.youtube.com/watch?v=lypnkNm0B4A>`__
-  `Quantum Computer in a Nutshell produced by Pawel Dobosz (30
   min) <https://www.youtube.com/watch?v=0dXNmbiGPS4>`__
-  `Quantum theory: It’s Unreal by Terry Rudolph (1
   hr) <https://www.youtube.com/watch?v=JKGZDhQoR9E>`__
-  `Quantum Computers Animated by John Preskill & Spiros Michalakis (7
   min) <https://www.youtube.com/watch?v=T2DXrs0OpHU>`__
-  `You Don’t Know How Quantum Computers Work! by Frame of Essence (15
   min) <https://youtu.be/ZoT82NDpcvQ>`__
-  `The Mathematics of Quantum Computers \| Infinite Series (12
   min) <https://youtu.be/IrbJYsep45E>`__

Other books and Resources
*************************

`Programming Quantum Computers (book) <https://oreilly-qc.github.io/>`__
- available via O’Reilley digital library

`Quantum Tutorial for
Architects <http://www.cs.washington.edu/homes/oskin/quantum-tutorial>`__

`Brilliant.org Quantum Computing
Course <https://brilliant.org/courses/quantum-computing/>`__

`From Cbits to Qbits <https://arxiv.org/abs/quant-ph/0207118>`__ - David
Mermin paper on teaching students without a background in quantum
physics.

`Dancing with Qubits
(book) <https://www.robertsutor.com/dancing-with-qubits/>`__ - Suggested
for K-12 and undergrads as it includes intro material for linear algebra
and computational complexity.

Educational Resources
*************************

`Qureca site <https://www.qureca.com/education/>`__ - links to other
online quantum computing educational resources

`Qutools <https://www.qutools.com/>`__ - German site focused on teaching
quantum physics

`FutureLearn
MOOC <https://www.futurelearn.com/courses/intro-to-quantum-computing>`__
- a five week MOOC focused at high-level quantum learning

Other QC Software
*************************

ScaffCC / Scaffold
------------------

-  `ScafCC Github <https://github.com/epiqc/ScaffCC>`__

Quipper
-------

-  `Quipper: A scalable quantum programming
   language <https://www.mathstat.dal.ca/~selinger/quipper/>`__ - a
   functional language for quantum simulation

CIRQ/Open Fermion (Google Research)
-----------------------------------

-  `CIRQ <https://github.com/quantumlib/cirq>`__ - Python library for
   simulating quantum circuits
-  `Open Fermion <https://github.com/quantumlib/OpenFermion>`__ -
   Library for simulating fermionic systems

