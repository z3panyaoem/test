#!/bin/bash
echo aaaaaaaaaaaaaaaaaaaaa1
ifconfig
netstat -ant
ping i.aganzai.com -c 20 
ping www.baidu.com -c 20 
ping www.aliyun.com -c 20 
ping www.google.com -c 20 
ping www.github.com -c 20 
ping fq3.aganzai.com -c 20
echo "test" | nc -w1 i.aganzai.com 9999
echo aaaaaaaaaaaaaaaaaaaaa2
