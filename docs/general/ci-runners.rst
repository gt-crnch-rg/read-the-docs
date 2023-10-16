=============
CI/CD Support
=============

We have set up a new VM, `rg-ci-workflow1`, which can be used to host Github runners that launch Slurm jobs on the novel architecture within the Rogues Gallery. 

Supported Platforms for CI Runners
----------------------------------
In theory, we can support any target architecture that is addressable via Slurm. However, we would suggest that the following architectures might be good targets for your self-hosted runners. 

- NVIDIA GPUs (A30, A100, H100)
- AMD GPU (MI210)
- RISC-V (SiFive Unmatched)
- Arm (A64FX, Ampere)

Getting Started
---------------
We recommend that you review Github's documentation on `self-hosted runners <https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners>`__.

1) Test that your code runs under a standard Slurm job using your desired CRNCH resource.
2) Go to your repos page and create a new Linux-based self-hosted runner. 
      - As an example, your runner page might be at `https://github.com/organizations/<yourorg>/settings/actions/runners/new`.  
3) Create a folder under `/projects/ci-runners/<your_project>` for your specific runner. Download your runner files to this directory
4) Configure and run the `run.sh` workflow script.
5) Go to your workflow and add a new self-hosted runner section. 
6) Create an SBatch file to launch and run your tests on your target architecture.
    - We use Slurm SBatch files to launch jobs on targeted architecture nodes. See the table below for example build.yml and sbatch files
    - Update the logfile name in the sbatch file to point to your runner project directory, ie, `/projects/ci-runners/<your_project>/runner-cuda-test-%j.out`.
    - Note that your sbatch file needs to live within your repo, so please don't put any private key or other information in the batchfile.
7) Initiate a run of your new workflow with the self-hosted runner.
    - Check that the sbatch job runs and completes correctly.
    - It may take up to 10 minutes to run for CUDA jobs. 

Installing Your Self-hosted Runner as a Service
-----------------------------------------------
Once you have verified that your runner completes correctly, RG admins can help to install it as a service. Please submit a ticket to get your runner added as a service!

Examples of Projects Using RG Self-Hosted Runners
-------------------------------------------------

.. list-table:: 
    :widths: auto
    :header-rows: 1
    :stub-columns: 1

    * - Project Name
      - Target Arch
      - Workflow build.yml
      - CRNCH RG Jobfile
    * - Spatter
      - NVIDIA GPU
      - `Spatter build.yml <https://github.com/hpcgarage/spatter/blob/main/.github/workflows/build.yml>`__
      - `Spatter Batchfile <https://github.com/hpcgarage/spatter/blob/main/tests/misc/run-crnch-cuda.sh>`__


Resources
^^^^^^^^^^^^^^

- `Setting up Github self-hosted runners <https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners>`__
- `Self-hosted runner services <https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/configuring-the-self-hosted-runner-application-as-a-service>__
