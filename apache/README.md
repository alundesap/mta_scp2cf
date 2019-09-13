Change into the local working folder, one level below the scripts.
```
cd apache
```

Get a file FRom the running container (for folders, ssh in to remote and tar them up)
```
cf ssh-code > ../tmp/code ; ../fr_apache.sh htdocs\/index.html
```

Edit & Put a file TO the running container (for files in folders escape the / with \/)
```
vi htdocs/index.html
cf ssh-code > ../tmp/code ; ../to_apache.sh htdocs\/index.html
```

If changing the config, put the new conf file and then execute a restart.
```
vi conf/httpd.conf
cf ssh-code > ../tmp/code ; ../to_apache.sh conf\/httpd.conf
cf ssh-code > ../tmp/code ; ../ex_apache.sh '/usr/local/apache2/bin/apachectl restart'
```
