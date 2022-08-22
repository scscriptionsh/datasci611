HW2
===

Create a VCL instance and ssh to it with the following command:

```
ssh <onyen>@<ip> 
```

The -L establishes a connection between your own localhost port 8787
and that on the remote vcl instance.

Mount your personal storage as described in the lecture notes.

Reminder:

```
sudo mkdir storage
sudo sshfs -o allow_other $USER@longleaf.unc.edu:/nas/longleaf/home/$USER storage
cd storage
```

Run this command:

```
echo $USER $(df -h | grep $USER | expand | tr -s ' ' | cut -d ' ' -f1,6 | md5sum) > ~/storage/fingerprint 
```

Then start a docker container running rstudio:

```
docker run -v $HOME/storage:/home/rstudio/storage -e PASSWORD=<some_password> -p 8787:8787 rocker/verse
```

You should now be able to connect to your RStudio on the VCL by visiting:

http://<ip>:8787 

in your browser. 

Click on the terminal tab and run

```
cd storage
cat fingerprint
```

Take a screenshot and submit it via Sakai.

