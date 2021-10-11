============
Rogues Gallery Filesystems
============

*Note*: We strongly encourage you to do compilation (especially for
FPGAs) using ``/netscratch`` and back up your project files to the
backed up "nethome" or ``/home/<username`` directory. Code should
additionally be backed up to a Github repo - remember the policy of
keeping two separate copies of all important code/data!

Quotas and Data Retention Policies
==================================

Quotas
------

We have the following quotas for users, subject to future modifications:

-  ``/home`` - 50 GB is provided to each user and is backed up using ZFS
   snapshots and RAID.

-  ``/project`` - Quotas vary but are typically in the 200 GB range
   depending on how many users are using a shared project.

-  ``/netscratch`` - no quota limits but please note the lack of backups
   and data retention policies below.

Data retention policies
-----------------------

-  Backups are provided via a standard fileserver with RAID and ZFS
   snapshot backups. *However*, we do not guarantee data backups and we
   recommend you use Github or GT Github for code backups and `GT's Box
   service <https://gatech.account.box.com/login>`__ or `PACE-provided
   storage <https://docs.pace.gatech.edu/storage/storage_guide/>`__ for
   large data backups.

-  Deactivated accounts will have their data kept for 180 days (~6
   months) and it will then be archived and removed at the discretion of
   the testbed maintainers.

-  Scratch data will be *purged* after 120 days without user
   modification from both ``/localscratch`` and ``/netscratch``. Note
   that scratch explicitly is not backed up, and we cannot restore
   deleted files.

Storage on CRNCH Systems
========================

Shared home
-----------

Each user has **50 GB** of shared storage space mounted under
``/nethome/<user>`` that is backed up via our data server (RAID 10) and
that is served up via NFS. This storage is relatively stable and is
meant for users to keep files consistent across Rogues Gallery
resources. **NOTE:** We still strongly encourage users to back up their
code using a git repo, such as those provided for free via Georgia
Tech's github.gatech.edu.

Shared tools
------------

The Rogues Gallery VMs and physical resources are served by a shared
``/tools/`` directory that contains common tools for each architecture
and that is shared via NFS to all available login, development, and
experimental nodes.

Shared project space
--------------------

Individual users may also request joint project space by emailing the
admins at crnch-rg-help@cc.gatech.edu. These are served under
/projects/ and include space for data sets /projects/bigdata and other
lab-based project groups.

Net scratch space 
------------------

Speedforce.crnch.gatech.edu provides 47 TB of RAID 5 NVMe-backed storage
that is mounted at ``/netscratch`` on each VM and CRNCH node. Please
create a directory for your username and keep your data within this
file. Note the data retention policies listed above that is enforced by
modification time and cron job scripts. Any unmodified data older than
**120 days** is subject to deletion, and users with very large data
requirements may be asked to help purchase project-specific storage.

Local scratch space
-------------------

Note that physical resources like ``flubber`` typically have their own
fast scratch space, usually mounted at ``/localscratch``. These are
local scratch storage locations that are **not backed up** and are meant
for temporary output that is then placed under a project or nethome
folder. VMs also typically will have a ``/localscratch`` that is just
using extra HD space in the VM that is a bit faster than the backed up
``/nethome`` but that is slower than ``/netscratch``.

We recommend that you use ``/netscratch`` instead of local scratch as
this is shared across all machines. Both types of scratch have the same
data retention policies.
