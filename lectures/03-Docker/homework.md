Docker Homework
===============

We invoke docker like this:

```
     docker run\
     -e PASSWORD=yourpassword\
     --rm\
     -v $(pwd):/home/rstudio/work
     -p 8787:8787\
     -t my_image
```

Sometimes its handy to launch it like this:

```
     docker run\
     -e PASSWORD=yourpassword\
     --rm\
     -v $(pwd):/home/rstudio/work
     -p 8787:8787\
     -it my_image /bin/bash
```

Using the Docker documentation (either its man page or its web based
documentation) figure out what the difference between these two
invocations is. 

The latter invocation is useful if we want to debug the installation
of a library, since it gives us a root shell in a container
representing `my_image`.


