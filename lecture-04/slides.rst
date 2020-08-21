.. title:: Mise en Place: Linux, Bash, Docker, Make
:data-scale: 10
:data-max-scale: 4
:css: custom.css

.. role:: question

Mise en Place
=============

.. figure :: images/mise-en-place.jpg
 :width: 400 px

stu_spivack - mise en place for bacon peanut brittle (wikimedia)

Setting the scene in your brain.

----
          
Plumbing is Important in Science
================================

.. container:: twocol

   .. container:: leftside
      
      1. (Data) Scientists and Statisticians try to make true statements.
      2. While the statements we make may refer to time independent things,
         the ways we make those statements typically change with time.
      3. We get new data
      4. Our understanding of the data we have changes
      5. Our methods change
      6. The environments in which we work change
      7. Furthermore, our results are often subtle.
                  
   .. container:: rightside

      .. image :: images/ted.jpeg
       :width: 300 px
            

      .. image :: images/hell-dimension.jpg
       :width: 300 px


And no one is going to solve these problems for you. You will likely
encounter environments where people believe these issues are a waste
of time.

---- 

Linux/Unix
==========
The Nightmarish Warran of Tunnels in Which We Lay our Plumbing
--------------------------------------------------------------

1. We'll be using Unix in two ways: as the host for docker and within
   docker environments.
2. The good news is that we won't need as comprehensive an
   understanding of these systems as we do of R and other data
   oriented languages.
3. But we do need to be able to get around.

Your bash needs be as good as my french.
========================================
(Not very good but serviceable).

----

Linux, Mac, Windows
===================

1. Each is an operating system: basically a big program that allows
   you to interact with the hardware in your computer.
2. Linux is the most common OS for technical work (servers that run twitter, etc).
3. Mac OSX is based on a Unix variant and thus can typically be
   pressed into service.
4. There are various ways to run linux/unix-like shells on your
   Windows machine and to interact with Docker.
5. I basically only know Linux and OSX. I'll need your help with
   questions on Windows.

---- 

Bash (the shell)
================

NB. there are many Shells with roughly comparable feature sets. We'll
be talking about the most common shell, called Bash.

While there are graphical user interfaces for Unix-like operating
systems we will be using the Shell predominantly.

Much like R, the shell is an interactive system that reads input from
us and executes commands.

The technical details of how it does this are quite different from R,
however. But the basic idea is the same.

Both the syntax and semantics of the shell are simpler than R which
paradoxically makes Shell less regular and harder to understand.

----

Introduction: The Most Important Commands
=========================================

1. arguments and stdin
2. stdout and stderr

The Commands
------------

1. man
2. apropos

----

Argument Conventions
====================

Arguments usually have long and short versions

1. -l and --long are the same
2. sometimes a single dash for long names
3. sometimes you need to use = and sometimes you don't

This is purely conventional. Most systems just give you the arguments
as separated by spaces.

(Show R example)

----

Shell Basics
============

1. Input and Output - Linux/Unix is very "file" oriented. Lots of
   things act like files and shell programs pass information between
   themselves using imaginary files "stdin", "stdout" and "stderr".
   
   Eg: cat

2. sort, uniq

3. cd, pushd, popd, ls

4. find, patch, diff

---- 

Vi In a Pinch
=============

.. container:: twocol

   .. container:: leftside

      1. To exit: ESC :q
      2. To exit after saving: ESC :wq!
      3. To exit without saving: ESC :q!
      4. To enter "edit mode": i

   .. container:: rightside

      .. figure :: images/printer-terminal.png
       :width: 200 px
      
      State of the Art IBM 2741 Terminal (1965).

      .. figure :: images/woman-at-terminal.jpeg
       :width: 300 px
       
      A woman at a slightly newer terminal. Women used to do all the
      programming, as it was percieved to be clerical work. 

You'll need to use VI if you want to make a quick edit at the terminal
or write a commmit message without using -m.

----

Pipes & Redirection
===================

You can redirect the contents of a file into a process. You can also
redirect output to a file::

   cat < data/super_hero_powers.csv
   cat data/super_hero_powers.csv > /tmp/copy-of-data

A pipe operator passes the standard out of one process into the
standard input of another.

This is a very handy way to chain commands together without creating
temporary files.

----

How Bash Looks up Stuff
=======================

The first word of a line is interpreted by the shell itself. Most of
time we are referencing a bonafide program living on the hard drive somewhere.

If that is the case, the shell searches the PATH::

    > which which 
    /usr/bin/which 

    > ls /usr/bin
    '['                                  gvfs-move                           pnmnoraw
    2to3-2.7                             gvfs-open                           pnmnorm
    411toppm                             gvfs-rename                         pnmpad
    7z                                   gvfs-rm                             pnmpaste
    7za                                  gvfs-save                           pnmpsnr
    7zr                                  gvfs-set-attribute                  pnmquant
    a2ping                               gvfs-trash                          pnmremap
    a5booklet                            gvfs-tree                           pnmrotate
    a5toa4                               gvnccapture                         pnmscale

----

Environment Variables and Subshells
===================================

1. Environment Variables are sort of like variables in R
2. They hold strings, numbers or arrays

    echo $PATH
    /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
    
3. They are scoped to "shells" or to the local process.
4. use export to make them available to sub-processes::

   > export TEST=hi
   > bash
   > echo $TEST

NB. We have to use $ to reference a variable.

----

Shell Scripts
=============

Look like this::

  #!/bin/bash 
  
  N_ROWS=`cat data/super_hero_powers.csv | wc | expand | tr -s ' ' | cut -d' ' -f2
  N_UNIQ=`cat data/super_hero_powers.csv | cut -d',' -f2- | sort | uniq | wc | expand | tr -s ' ' | cut -d' ' -f2

  echo There are $N_ROWS heroes but only $N_UNIQ sets of powers.

To use them we need to talk about file permissions.

----

ls
==

This command lists files. We can use it as an example of advanced
command usage::

  > ls # default behavior

  > man ls

We very commonly want just the most recent files::

  > ls -t | head -n 10
  > ls -lath | head -n 10 # lots of details, show hidden files, human readable sizes
  > ls | grep ^d # just directories

This last command will show us the file permissions::

  drwxrwxr-x  4 toups toups 4.0K Aug 19 13:56 .
  lrwxrwxrwx  1 toups toups   25 Aug 19 13:56 .#slides.rst -> toups@rs.26296:1597089874
  -rw-rw-r--  1 toups toups 6.8K Aug 19 13:56 slides.rst
  -rw-rw-r--  1 toups toups  273 Aug 19 11:55 example.sh



----

Poking at Data in the Terminal
==============================

Eg: cat, cut, sort, uniq, wc

You don't need to know these but its handy.

----

Basic Looping and Other Useful Commands
=======================================

Egs: find, grep, for

----

Chill Interlude
===============

Some universal linux ideas.

1. root user
   all powerful (usually)
   separate user
2. sudo - run commands as the root user
3. While there are user space (non-root) package tools (like Docker, sort of)
   packages are usually managed at the root level
4. This differs by distribution. On Ubuntu we use `apt` (and associated commands)
   apt installs packages for all users
5. We must invoke `apt` via sudo

We'll use `apt-*` commands in our Docker files to install packages.

Eg: installing gambit-c::

   sudo apt-cache pkgnames | grep gambc
   sudo apt-get install gambc-*
   gsi

----

Why Docker
==========

Package managers are great. But sometimes you need to install things
that aren't provided by them.

Sometimes you accidentally install something that you didn't mean to
and it breaks your system.

Packages can be dependent on one another in complex ways and thus
installing a working environment is tricky. 

Docker lets you document how you set your environment up in an way
which then lets you automatically rebuild that environment. If you
screw up, you just edit your docker file and all is forgiven.

----

Docker Concept
==============

Docker is a containerization platform. The basic idea is embodied in
the notion of a `change root`.  

The `chroot` command literally changes your root directory `/`. If you
were to change your root to a directory that looked like another linux
distribution, then it would be as if you were using that distribution.

Its more complicated than that, but that is the idea.

This is different from virtualization - we're using the same operating
system kernel but with a different filesystem and some thin layers
over our network and other services.

----

Docker Basics
=============

1. Dockerfile
   a structured file which describes how to build your container
2. Dockerfiles can inherit from other files::
    
     FROM rocker/verse

3. After the from line we usually document who maintains this file/container::
    
     MAINTAINER Vincent Toups "vincent.toups@gmail.com"

4. After that we execute commands to set up the environment (as if as root)::

     RUN apt-get install gambc* (for example)

Look at a Dockerfile: (see dockerfile in this directory).

----
    
Docker build
============

1. docker build    .      -t     <a-name>
   cmd    sub-cmd  where  tag

This performs the build and tags the result. 

----

Docker run
==========

Runs the image.

What actually happens when you execute docker run tends to depend on
the container. The `CMD` directive in the Dockerfile determines what
happens by default.

For the rocker/verse container, it runs rstudio.

Docker Run Args you Need to Know
================================

1. -v mounts volumes from outside your container to inside it.
2. -p handles ports
3. -e pass in environment variables

Thus we can understand this line from the rocker documentation::

  sudo docker run -d -p 8787:8787 \
    -e PASSWORD=helloworld --name rstudio rocker/rstudio 
