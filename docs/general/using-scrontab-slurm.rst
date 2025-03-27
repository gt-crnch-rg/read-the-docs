=========================
Using Scrontab with Slurm 
=========================

What is Scrontab?
-----------------
`Scrontab <https://slurm.schedmd.com/scrontab.html>`__ is an extension of Linux's `cron <https://www.redhat.com/sysadmin/linux-cron-command>`__ functionality that allows you to schedule Slurm jobs at regular intervals. For instance, maybe you want a slurm job to run and process data each day at a specific time - scrontab can help you set that up as follows in your `scrontab`:

Running ``scrontab`` in the terminal opens the editor. The directives are ``SCRON`` followed by configurations and a cron command, it will run the provided command based on the cron schedule.

For example the following snippet that runs ``myslurmtask.job`` at 11:00 AM every day for 2 nodes.

.. code:: shell
    #SCRON --ntasks-per-node=2
    0 11 * * * $HOMEDIR/myslurmtask.job

This runs ``myslurmtask.job`` every 2 minutes.

.. code:: shell
    #SCRON --ntasks-per-node=2
    */2 * * * * $HOMEDIR/myslurmtask.job

Note that the scrontab format follows that of crontab and cron. You can use sites like `crontab.guru <https://crontab.guru/>`__ to help define your scrontab rules.


Scrontab Quickstart
-------------------

Scrontab vs. sbatch Job IDs
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Scrontab reuses the same job ID for repeated tasks, unlike sbatch which generates a unique job ID for each submission.
This design flaw means that if your command writes output to a fixed file, it will overwrite the previous output unless you explicitly configure it to append or use unique filenames.

Job Execution and Interruption
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If a job is still running when the next scheduled instance is triggered, the running job is forcefully terminated to allow the new job to start.
This can lead to incomplete tasks and data corruption if not properly managed.

Resource Contention Handling
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
When the necessary resource is busy, scrontab doesn't fail silently — it sets a minimum start time for the job and queues it.
However, this queuing behavior might delay execution in unexpected ways, so it's critical to ensure that your resource availability is well planned.

Scrontab File Location and TMP Directory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
For scrontab to be detected and executed, the scrontab file must reside in the user directory, typically as ``$HOME/scrontab`` or ``$HOME/.scrontab``. Placing it elsewhere can result in silent failures.
Similarly, you must define a proper temporary directory (e.g., ``$TMPDIR`` or ``$HOME/tmp``) for temporary files or logs. Neglecting this can cause permission issues or clutter your filesystem with unmanaged files.

Verification
~~~~~~~~~~~~
Run ``scrontab -l`` to list the current entries. A non-empty output confirms that scrontab is active and correctly set up.