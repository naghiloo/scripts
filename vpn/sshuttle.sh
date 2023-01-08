#!/bin/bash
dest_name=$1
dest_addr=$(grep -ri $1 ~/.ssh -A1 | grep HostName | awk '{ print $3 }')
local_ip=$(ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')

sshuttle -r $1  0.0.0.0/0 -x $dest_addr -x 127.0.0.1/32 -x $local_ip/24
