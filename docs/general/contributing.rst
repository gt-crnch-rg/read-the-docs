Contributing to this Documentation
==================================

We welcome and appreciate your comments and contributions to this documentation. Often, we rely on a mix of vendor support and community support for novel architectures and in many cases *you* are the expert just by starting to work with this new, novel architecture or software stack. This page presents some suggestions for contributing your own documentation. 

What is the process for contributing documentation?
########
To contribute documentation, you should write an rst-formatted file related to your topic and submit it via `pull request to this repository <https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request>`_. We will also eventually have a form where you can upload and submit new documentation to be posted in a simplified fashion.

All read-the-docs documentation uses `Restructered Text <https://sublime-and-sphinx-guide.readthedocs.io/en/latest/glossary_terms.html#term-rst>`_, so we ask that you write documentation in this format or convert Markdown files for your pull requests. 

Current Topic Areas:
------------

-  Emu
-  Getting Started - general topics needed to get started with RG
-  Miscellaneous
-  Networking - in-network computing, 5G, and edge.
-  Neuromorphic and Novel Systems for ML
-  Reconfig - all FPGA-related documentation
-  Quantum
-  Related - all related work

How do I update existing documentation?
---------------------------------------

| 1) Fork this repo. 
| 2) Find the page you are looking to update and make your edits.
| 3) Commit *and* push to your fork and initiate a pull request. 

How do I contribute new documentation?
--------------------------------------

| 1) Fork this repo. 
| 2) Find the folder you are looking to update and create a new page
  with the following titleformat: *[Topic
  Area]-my-new-documentation-page*. 
|  \* As an example, creating a new page for reconfigurable resources
  might have a title like: *[Reconfig]-Using-Vitis-for-AI.rst*
|  \* Note that you may need to create your page with the appropriate
  .rst suffix name and then edit it to get appropriate
  formatting in the browser. You can check basic format of commits in the Github web interface.
| 3) Commit *and* push to your fork and initiate a pull request. 

What should my documentation contain?
########

| 1) A useful title
* Ex: "Compiling ROS for the AC701 FPGA platform"
| 2) A brief description of the problem you're trying to solve.
| \* Ex: "This documentation details how to compile ROS for AC701 using the flubber server".
| 3) Code snippets that demonstrate proper execution of a technique or application for the topic in question. See the suggested format for code snippets below.
| 4) References to relative links from official documentaiton or examples, if they are relevant.

Where should I add new files?
########
Ideally, your file should go under a directory related to your given topic. Please name your file with hyphens if it is a long filename, e.g., `reconfig-new-quartus-tools.rst` and place it under the correct folder in your commit. If you're not totally sure where a file should go, feel free to submit a pull request and we can help you format and find the right place for your file. 

How to convert MarkDown files to RST
########
While there are many nice GUI-based editors for MarkDown files, there are not that many editors for Restructered Text. One approach to contributing documentation would be to write it in Markdown and then convert it with Pandoc. `This URL <https://avilpage.com/2014/11/pandoc-best-way-to-convert-markdown-to.html>`_ shows a simple example that we have repeated below. 

.. code:: 

  pandoc rg-overview.md --from markdown --to rst -s -o rg-overview.rst

You can use this simple script to convert a MarkDown file to RST, but you may then want to check that the links and figure links get populated correctly. You can also use editors like `Typora <https://typora.io/>`_ to edit Markdown and then export an RST file. Note that Typora uses pandoc behind the scenes to do this conversion!

You can also use Python tools like _`m2r <https://github.com/miyakogi/m2r>`__ which may provide a better translation capability than pandoc. 


Style Guide Suggestions
#######################

How do I add a figure?
----------------------

| 1) Add your figure to the ``docs/figures`` directory with a reasonable title. As an example, the overview page uses the figure  ``RG_CCRI_Infrastructure_Overview.png``. 
| 2) Use RST syntax to add it the appropriate page. 

.. code:: 

   #Adds the image with a relative path to the figure directory.
   #Alt tag is nice to have if the image does not load correctly
   .. figure:: ../figures/general/RG_CCRI_Infrastructure_Overview.png
   :alt: RG CCRI Infrastructure Overview
   
3) Commit your change and check the hosting page to see if it looks reasonable (placement, height, width, etc.). Proceed with the pull request as normal.

How do I add code snippets?
----------------------

You can use either two `` to delineate small segments of RST code or the ".. code::" tag to add indented code blocks. Check the figure instructions above for an example!

Questions?
##########
Please email us via our ticketing system crnch-help@cc.gatech.edu with any questions or please feel free to ask on our CRNCH Rogues Gallery MS Teams
group.
