Using GUI Applications with VNC
==================================

**NOTE:**\ Please also see our `page on using
X2Go <%5BMisc%5D-Using-GUI-applications-with-X2Go>`__ as this is a
little bit simpler to set up than VNC.

Here we cover how to use a VNC server on the CRNCH Rogues Gallery
machines to access and manipulate GUI-based applications. We typically
have *TightVNC servers* set up in conjunction with the *xfce4 desktop*
as this allows for a low-latency but somewhat standardized and
open-source setup.

Table of Contents
-----------------

-  `Quick Start <#quick-start>`__

-  `What is VNC? <#what-is-vnc>`__

   -  `How does VNC differ from X11
      forwarding? <#how-does-vnc-differ-from-x11-forwarding>`__

   -  `How does VNC differ from NX? <#how-does-vnc-differ-from-nx>`__

   -  `How does VNC differ from Remote
      Desktop? <#how-does-vnc-differ-from-remote-desktop>`__

-  `VNC Clients <#vnc-clients>`__

-  `Setting up a VNC server <#setting-up-a-vnc-server>`__

   -  `Ubuntu <#ubuntu>`__

   -  `RHEL <#rhel>`__

-  `Setting up and using your VNC client (GT Network or
   VPN) <#setting-up-and-using-your-vnc-client-gt-network-or-vpn>`__

   -  `Using SSH jump hosts (VNC without the GT
      VPN) <#using-ssh-jump-hosts-vnc-without-the-gt-vpn>`__

   -  `Securing VNC Server <#securing-vnc-server>`__

   -  `Killing a VNC server instance <#killing-a-vnc-server-instance>`__

-  `Using GUI jobs with the other GT Resources (PACE
   tips) <#using-gui-jobs-with-the-other-gt-resources-pace-tips>`__

-  `Advanced tips <#advanced-tips>`__

-  | `Common Errors <#common-errors>`__
   | 

.. _a-idquick-startatldr---how-do-i-quickly-get-started-using-vnc-on-crnch-resources:

TLDR - How do I quickly get started using VNC on CRNCH resources?
-----------------------------------------------------------------

This guide goes into great details on the how and why of using VNC. If
you have questions, please refer to the following sections for more
information. As a baseline just to get started you need to do the
following:

1. Select and install a VNC viewing client on your local workstation. We
   recommend TightVNC for Windows or `RealVNC
   Viewer <https://www.realvnc.com/en/connect/download/viewer/macos/>`__
   for Mac OSX.

2. Connect to your destination server using SSH jumphosts and port
   forwarding. Here we use a jumphost to ssh to our destination server.

.. code:: 

   ssh -L 5901:localhost:5901 -C -J <yourGTusername>@rg-login.crnch.gatech.edu <yourGTusername>@flubber1.crnch.gatech
   .edu

1. Start the remote VNC server. On the first time you start this, you
   will need to enter a new password.

.. code:: 

   vncserver
   #Enter your 6 character password on first use.

1. Using your local VNC viewer client connect to "localhost::5901" using
   your password. You then should be able to launch the web browser and
   apps.

2. Once you are done, please kill your VNC session in the terminal
   before logging out.

.. code:: 

   #Usually you will kill instance #1
   vncserver -kill :1
   #Check with ps aux to see if you have any VNC sessions open and kill these
   ps aux | grep <yourGTusername> 
   kill <any pids for xtightvnc>

There is a `script,
crnch_client_vnc_login.sh <https://github.gatech.edu/crnch-rg/rogues-docs/blob/master/general/login_scripts/crnch_client_vnc_login.sh>`__
in the rogues-docs repository that you can use for the initial port
forwarding setup from your local machine.

What about running GUI applications on Windows Subsystem for Linux?
-------------------------------------------------------------------

This uses X forwarding and is described more in this
`page <https://techcommunity.microsoft.com/t5/windows-dev-appconsult/running-wsl-gui-apps-on-windows-10/ba-p/1493242>`__.

.. _a-idwhat-is-vncawhat-is-vnc:

What is VNC?
------------

While there is a lot of good information about "virtual network
computing (VNC)"
`online <https://en.wikipedia.org/wiki/Virtual_Network_Computing>`__,
the main keys to remember are that VNC consists of a server running on
the remote machine, a client running on your local host, and graphical
updates and keystrokes are exchanged via a protocol called Remote Frame
Buffer (RFB). There are many different optimizations for serving and
updating a graphical environment using RFB with optimizations to only
transfer data when a particular "square" of the served application
changes.

How does VNC differ from X11 forwarding?
----------------------------------------

Using ``ssh -X`` or ``ssh -Y`` will allow you to use "X forwarding" to
forward one application to your desktop. The main difference between X
forwarding and VNC is that X forwarding typically only forwards one
application at a time while VNC will forward a *session*, including the
application and a desktop environment.

VNC sessions also typically survive a disconnection because they are
running remotely on the VNC server rather than being forwarded to your
local X server. This also means that VNC requires more resources on the
server while X forwarding typically requires a faster client. VNC is
also optimized to have lower latency which may make your session seem
more responsive.

X11 sessions may handle multi-layered windows (think Matlab with an
output figure) better than VNC because it will spawn multiple windows
rather than just showing the graphical region that has been changed, as
with VNC. This is a trade-off in terms of performance and usability.

For more differences please check out these links:

-  A brief 2009
   `post <http://www.linuxtechie.net/2009/11/vnc-vs-x11-forwarding.html>`__

-  Ars Technica 2010
   `post <https://arstechnica.com/civis/viewtopic.php?t=1155637>`__

How does VNC differ from NX?
----------------------------

NX is a similar protocol to RFB that is further optimized for
low-bandwidth connections and that supports more options for secure
connections (i.e. Kerberos, SSH keys). The NX protocol is proprietary
and is created by the Belgian company NoMachine. However, free
implementations of NX like FreeNX are available.

-  `Wikipedia - NX
   Overview <https://en.wikipedia.org/wiki/NX_technology>`__

-  `Ubuntu - What is
   FreeNX? <https://help.ubuntu.com/community/FreeNX>`__

-  `Linux Journal 2005 article on
   NX <https://www.linuxjournal.com/article/8477>`__

How does VNC differ from Remote Desktop?
----------------------------------------

The main difference is that Remote Desktop is typically an OS-dependent
tool that has slightly better integration with the video driver stack.
Microsoft's remote desktop has been around since the early 2000s, and
Apple's Remote Desktop is a more recent innovation. Both of these tools
are typically used in an IT setting for "remote assistance".

-  `MS Remote Desktop vs
   VNC <https://blog.codinghorror.com/vnc-vs-remote-desktop/>`__

-  `Apple Remote Desktop vs
   VNC <https://www.techrepublic.com/article/vnc-vs-ard-which-is-better-for-remote-administration/>`__

VNC Clients
-----------

A master list of remote desktop client comparisons can be found on
`Wikipedia <https://en.wikipedia.org/wiki/Comparison_of_remote_desktop_software>`__.

-  TightVNC

-  UltraVNC

-  TigerVNC - Supports Mac

-  NoMachine (NX)

-  VNCViewer

-  TurboVNC - Recommended by PACE

Setting up a VNC server
-----------------------

We suggest using xfce4 as the desktop environment because it is a bit
more full-featured than standard X11 but still lightweight.

Ubuntu
~~~~~~

Install the following:

.. code:: 

   sudo apt install tightvncserver xfce4 xfce4-terminal firefox autocutsel -y

RHEL
~~~~

.. code:: 

   sudo dnf install tigervnc-server xfdesktop xfce4-terminal xfce4-session

Setting up and using your VNC client (GT Network or VPN)
--------------------------------------------------------

This
`guide <https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-18-04>`__
has a great introduction to setting up both a VNC server and your local
client.

1. Set up your local VNC viewer client from the list above.

2. Connect to the remote server using the appropriate SSH port
   forwarding command. If you are connecting to a node *other* than
   rg-login or hawksbill, you will either need to be on the GT network
   (LAWN) or connected to the campus network with VPN.

.. code:: 

   # -L specifies which port to forward from the remote machine to the local machine
   # -C specifies to use compression. This is usually useful for X sessions or VNC!
   # Here we want to forward the GUI from rg-login to our local machine. We assume that the user is on GT network or connected to the VPN. 
   ssh -L 5901:localhost:5901 -C gtburdell@rg-login.crnch.gatech.edu
   gtburdell@rg-login.crnch.gatech.edu's password:
   Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-91-generic x86_64)
   ...
   #Start the TightVNC server on the remote machine
   [rg-login]$vncserver
   #If it is the first time you've started this server, you will need to create a unique password for the server. 

Using SSH jump hosts (VNC without the GT VPN)
---------------------------------------------

Note that applications might be a little bit more responsive when you
are connected to the GT VPN, but you can also use SSH jumphosts to
connect directly to an application on a server behind the firewall.

.. code:: 

   # -L specifies which port to forward from the remote machine to the local machine
   # -C specifies to use compression. This is usually useful for X sessions or VNC!
   # -J <host1> <host2> specifies a jump host, where you log into host1 and then "jump" to host2
   # Here we want to forward the GUI from flubber to our local machine.
   ssh -L 5901:localhost:5901 -C -J gtburdell@rg-login.crnch.gatech.edu gtburdell@flubber.crnch.gatech.edu
   gtburdell@rg-login.crnch.gatech.edu's password:
   gtburdell@flubber.crnch.gatech.edu's password:
   Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-142-generic x86_64)...
   ...
   #Start the TightVNC server on the remote machine
   [flubber]$vncserver

   New 'X' desktop is flubber:1

   Starting applications specified in /nethome/gtburdell/.vnc/xstartup
   Log file is /nethome/gtburdell/.vnc/flubber:1.log
   #Now you can proceed to connect with your local VNC viewer using the address "localhost::5901

Securing VNC Server
-------------------

When you first set up a new VNC server instance, it should ask you for
an 8 character password. Please note that this password is stored
locally in your ~/.vnc/passwd file, and it is "encrypted" but not
necessarily hard to reverse engineering. These limitations (password
size, etc.) mainly ensure compatibility with the RFB protocol, so for
this reason we strongly encourage that you kill vncserver sessions when
you are done with them!

If you need to change your password, you can use the "vncpasswd"
function to do so. Note that we advise not entering a "view-only"
password.

.. code:: 

   $ vncpasswd
   Using password file /nethome/jyoung9/.vnc/passwd
   Password:
   Verify:
   Would you like to enter a view-only password (y/n)? n

Killing a VNC server instance
-----------------------------

To kill the remote server you want to kill the particular "session" that
is being served; usually this is the first session. However if you run
multiple instances of vncserver you may have to use ``:2``, ``:3`` etc.
You can check to see which vncservers are running with
``ps aux | grep vnc``.

.. code:: 

   #Checking to see how many VNC sessions are running
   ps aux | grep vnc
   gtburdell   2452  0.0  0.1  57752 15864 pts/0    S    13:04   0:00 Xtightvnc :1 -desktop X -auth /nethome/gtburdell/.Xauthority -geometry 1024x768 -depth 24 -rfbwait 120000 -rfbauth /nethome/jyoung9/.vnc/passwd -rfbport 5901 -fp /usr/share/fonts/X11/misc/,/usr/share/fonts/X11/Type1/,/usr/share/fonts/X11/75dpi/,/usr/share/fonts/X11/100dpi/ -co /etc/X11/rgb
   #Kill the first VNC session
   vncserver -kill :1
   Killing Xtightvnc process ID 1922

Using GUI jobs with the other GT Resources (PACE tips)
------------------------------------------------------

PACE has other resources for running graphical jobs including tips on X
forwarding and submission scripts like ``pace-vnc-job`` and
``pace-jupyter-notebook`` which allow users to use VNC and SSH port
forwarding to view graphical applications and Jupyter notebooks hosted
on PACE cluster interactive jobs, respectively.

-  `PACE's Interactive Jobs with
   VNC <https://docs.pace.gatech.edu/interactiveJobs/setupVNC_Session/>`__

-  `PACE Port Forwarding Guide for Interactive
   Jobs <https://docs.pace.gatech.edu/interactiveJobs/pf_3rd_party_ssh/>`__

-  `PACE Jupyter Notebook
   Support <https://docs.pace.gatech.edu/interactiveJobs/jupyterInt/>`__

-  `PACE - X
   forwarding <http://docs.pace.gatech.edu/gettingStarted/guiApps/>`__

Advanced tips
-------------

-  Using copy-paste between your local client and the remote VNC
   session: With TightVNC, this requires the install of the package
   ``autocutsel`` as detailed in this
   `post <https://superuser.com/questions/1081489/how-to-enable-text-copy-and-paste-for-vnc>`__.

   -  A sample ``~/.vnc/xstartup`` file that includes support for
      autocutsel is as follows:

.. code:: 

   #!/bin/bash
   xrdb $HOME/.Xresources
   #Use the xfce desktop instead of a basic X session, /etc/X11/Xsession
   startxfce4 &
   xrdb $HOME/.Xresources

   # -solid grey gaves us a real mouse pointer instead of the default X
   xsetroot -solid grey -cursor_name left_ptr
   # Allow copy & paste when ClientCutText is set to true on the client side
   autocutsel -fork

Common Errors
-------------

.. code:: 

   startxfce4
   /usr/bin/startxfce4: Starting X server

   /usr/lib/xorg/Xorg.wrap: Only console users are allowed to run the X server
   No protocol specified
   xinit: giving up
   xinit: unable to connect to X server: Resource temporarily unavailable
   xinit: server error

``/etc/X11/Xwrapper.config`` needs to be edited to allow "anybody" to
run X11 instead of just console users.

TBD - not totally clear why this might be happening..

.. code:: 

   startxfce4

   Cannot open /dev/tty0 (Permission denied)
