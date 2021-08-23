* HW2

Log in to the VCL, mount your personal storage as described in the
lecture notes and then run this command:

```
echo $USER $(df -h | grep $USER | expand | tr -s ' ' | cut -d ' ' -f1,6 | md5sum)
```

Copy the output and submit it to me by email with the subject line:

```
BIOS 611 HW2
```
