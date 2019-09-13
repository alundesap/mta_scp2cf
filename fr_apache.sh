#!/usr/bin/expect -f
set timeout -1
set guidfp [open "../tmp/guid" r]
set guid [string trim [read $guidfp]]
set file [lindex $argv 0]
spawn scp -P 2222 -o User=cf:$guid/0 ssh.cf.us10.hana.ondemand.com:/usr/local/apache2/$file $file
set code [open "../tmp/code" r]
set pass [read $code]
expect {
        password: {send "$pass\r" ; exp_continue}
        eof exit
}
