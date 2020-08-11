
# Table of Contents

1.  [Compute Resources](#orgfff5920)
    1.  [Using the VCL](#org813379b)
    2.  [Linux](#org0796195)
    3.  [SSH](#orgdfc6761)
    4.  [Storage](#org03430d7)
    5.  [Docker and Rstudio](#orgfd0643e)
    6.  [Connecting to RStudio](#org5ce99f2)
    7.  [Github/Git](#org90cc125)


<a id="orgfff5920"></a>

# Compute Resources


<a id="org813379b"></a>

## Using the VCL

UNC offers a [virtual computer lab](https://vcl.unc.edu/) (VCL) which you can use with this
course. The image we'll be utilizing is a Linux based image and thus
we'll have to use command line tools to work with the image (up to the
point that you run RStudio or Jupyter, afterwhich point you can use
your browser).


<a id="org0796195"></a>

## Linux

[Linux](https://en.wikipedia.org/wiki/Linux) is an operating system in the Unix family. If you use a Mac you
are already running a Unix like operating system and you may be
familiar with interacting with a unix command line. If you are running
Windows this stuff may be new to you.

We'll discuss Unix shell's in greater detail in future lectures but
the basic idea with command line interfaces is that you type commands
into a window and a program called the shell interprets them and gives
you back responses.

The command \`ls\` lists the files in the current directory, for
example. \`pwd\` responds with the current working directory. \`cd\`
changes the current working directory.

Without too much loss of generality, when you type a command (which
for now you can think of as a string of alphanumeric characters
without spaces) the shell looks for it in something called the
path. The path is just a list of directories containing programs which
implement shell commands. If it finds the command, it executes
it. Thus, \`ls\`, \`pwd\` and \`cd\` are just commands stored on the file
system somewhere.

The \`which\` command tells you where another command is located (if
anywhere).

Eg, \`which ls\` on my computer gives /bin/ls


<a id="orgdfc6761"></a>

## SSH

Secure Shell is a way to access the shell of a remote system over an
internet connection.

On windows you'll need Putty to make a connection. On most linux
systems you'll already have an ssh client called \`ssh\`.

We'll demo both ways. You need the ip address, your onyen (in this
case) and a password.


<a id="org03430d7"></a>

## Storage

Once you've connected to your lab instance you'll want to immediately
mount you're Longleaf Storage:

    mkdir storage
    ## We have to allow other here b/c we'll want docker to be able to 
    ## use our storage space
    sudo -o allow_other sshfs <onyen>@longleaf.unc.edu:/nas/longleaf/home/<onyen> storage
    cd storage


<a id="orgfd0643e"></a>

## Docker and Rstudio

    

We will eventually want to customize our RStudio Environment but the
default rocker image will work for now.

    
    mkdir rstudio-test
    cd rstudio-test
    docker run -e PASSWORD="batmanisfascist" -p 8787:8787 -v `echo ~/storage`:/home/rstudio -t rocker/verse


<a id="org5ce99f2"></a>

## Connecting to RStudio

Demo&#x2026;


<a id="org90cc125"></a>

## Github/Git

    
    mkdir keys
    ssh-keygen 
    ..
    ssh-agent bash
    ssh-add id_rsa    

Copy the public key and then go to github. Add the public key.

Back on the Rstudio shell:

    
    cd ~/
    mkdir project-01
    cd project-01  

Create a readme.

Then in your shell.

    git init
    git add README.md
    git commit -m "Initial commit."

Then on github create a repository.

Then:

    git remote add origin <from-gh>
    git push -u origin master

And that is that!

