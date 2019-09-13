#!/usr/bin/expect -f
set timeout -1
set guidfp [open "../tmp/guid" r]
set guid [string trim [read $guidfp]]
set cmd [lindex $argv 0]
spawn ssh -p 2222 -t cf:$guid/0@ssh.cf.us10.hana.ondemand.com $cmd
set code [open "../tmp/code" r]
set pass [read $code]
expect {
        password: {send "$pass\r" ; exp_continue}
        eof exit
}
