# ldif2csv
An Awk script to convert LDIF file to CSV

To run the script on Unix like environment:
```
$ cat <LDIF File> | awk -F ': ' -f ldif2csv.awk  > <CSV File>
```
