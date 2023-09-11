=============-===========
Using Scrontab with Slurm 
=========================

What is Scrontab?
-----------------
`Scrontab <https://slurm.schedmd.com/scrontab.html>`__ is an extension of Linux's `cron <https://www.redhat.com/sysadmin/linux-cron-command>`__ functionality that allows you to schedule Slurm jobs at regular intervals. For instance, maybe you want a slurm job to run and process data each day at a specific time - scrontab can help you set that up as follows in your `scrontab`:

.. code:: shell

    0 11 * * * $HOMEDIR/myslurmtask.job
    
Note that the scrontab format follows that of crontab and cron. You can use sites like `crontab.guru <https://crontab.guru/>`__ to help define your scrontab rules.

TBD
---
- note where scrontab has to live in user directory and any tmp directory suggestions
- any scrontab limitations
- how do we know if scrontab is enabled?
- design an example of using scrontab to pull data from a site like IBM's Q Experience.
