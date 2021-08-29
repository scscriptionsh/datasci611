VCL: Compute Resources
========================================================
author: Vincent Toups
date: 22 Jul 2021
autosize: true

Fair Warning
========================================================

![](./fair-warning.png)

***

UNC's VCL (virtual computer lab) will provide you with the basic computing
resources you need to complete this course but it won't really do so
comfortably.

I highly recommend that you set up Docker on your local machine. For Windows
users the easiest way to do this is to set up Docker for Windows but the best
way is installing Docker with Windows Subsystem for Linux (2).
https://docs.docker.com/docker-for-windows/wsl/

Pre-requisites
========================================================

1. UNC Onyen
2. Windows: Either Putty or Cygwin
3. Linux or Mac: All Set Already

What is The UNC VCL
========================================================

The UNC VCL is a way for you to spin up a Unix (Linux) shell. 

Why we need it
==============

At least half of this course is about tools and all the tools are best used
from a unix-flavored command line (which we will cover in subsequent lectures).

Docker is both more comfortable with a unix system as its host and also does
better _hosting_ unix systems. Because Docker is critical to doing really 
portable data science its best to just bite the bullet and jump in.

VCL will provide any UNC student with a command line which can run 
Docker from which you can host your projects.

The VCL
=======

![](./vcl-reservation.png)

Putty
=====

![](./putty-with-vcl.png)

Terminal
========
![](./putty-w-term.png)

```
ssh <onyen>@<ip>
# you can use your onyen password to log in
```

Storage
=======

WARNING:

Storage on VCL instances is ephemeral. In other words: any work you do
here by default with _vanish_ when you're session ends.

So what do we do for persistent storage? We need to connect our
storage account to our instance EACH TIME we log in.

Longleaf
========

Longleaf is a cluster computing service offered by UNC. It comes with
persistent storage which we can connect to our VCL sessions.

![](longleaf-request.png)

You will have to connect to longleaf and request an account here:

https://its.unc.edu/research-computing/request-a-cluster-account/

"Mounting" your Storage
=======================

This will make more sense after we cover Unix but here is the "incantation"*.

```
sudo mkdir storage
sudo sshfs -o allow_other $USER@longleaf.unc.edu:/nas/longleaf/home/$USER storage
cd storage
# everything you create in storage is permanent
```

NB - you must create the storage directory and mount it each time you
hop onto the VCL.

Copying Data to Longleaf Storage
================================

You'll probably want to copy data to (or from) your computer from (or
to) the Longleaf storage/VCL.

On a unix (Linux/OSX/Windows Subsystem for Linux) this is as easy as:

```
# from computer to vcl
scp some-file <onyen>@<vcl-ip>:storage/some-file
# from vcl to computer
scp <onyen>@<vcl-ip>:storage/some-file some-file
```

WinSCP
======

![](./winscp.png)


TMUX
====

VCL instances expire periodically (so always save your work
frequently) but its still handy to be able to suffer a disconnection
while your working. Tmux is a program which runs a resumable terminal.

```
tmux ## starts the terminal
```

Once inside you can detach by CTRL-B d. Or maybe your network
connection just fails.

```
tmux attach -t 0 
```

Will reconnect you. Tmux does a lot of other cool stuff but I use
emacs for all that stuff. Check it out here:

https://www.ocf.berkeley.edu/~ckuehl/tmux/

Port Fowarding
==============

This will make more sense later, but we'll put it here for reference.

Sometimes you'll want to run a server on your VCL instance. The VCL
won't allow you to connect on an arbitrary port so you'll need to
forward the port over your ssh connection, which has the benefit of
making the connection secure.

On unix its easy:

```
ssh <onyen>@<ip> -L 8787:localhost:8787
```

This forwards local connections to 8787 to connections at <ip> on
8787. 

Thus, if we start a server on the VCL instance on 8787 we can now
connect to it by sending a request to our local 8787. Handy if your
Docker environment sets up an RStudio Server. Let's do that.

RStudio w/ Docker On the VCL
============================

Steps:

1. Start a Reservation
2. Connect to It (forwarding port 8787)
3. Start tmux
4. Mount Our Storage
5. launch rocker/verse:

```
docker run -d -v storage:/home/rstudio -p 8787:8787 -e PASSWORD=pw --name rstudio rocker/rstudio #
```

Then connect via the browser.

Getting By On the Terminal
==========================

The terminal offers a pleasing minimalist interface to a computer and
its worthwhile to cultivate the ability to get along there without any
other graphical tools.

My favorite tool which operates at the terminal but provides enormous
power is the "text editor" Emacs (installed with)

```
sudo apt install emacs
```

Emacs, however, has all the charm of a large industrial complex (which
is to say, considerable inaccessible charm).

***

A more accessible editor (much less powerful) is nano:

```
nano 
```


![](./nano.png)

Quitting Vi
===========

You will almost surely find yourself confronted, at some point, by Vi,
a venerable old text editor with roots as deep as Emacs. 

Vi is modal and very confusing.

Press "ESC q!" to quit.

We will talk at greater length about terminal life when we discuss
Unix.

Homework
========

Run through all of this once. One random student will have to connect
in front of everyone next week.
