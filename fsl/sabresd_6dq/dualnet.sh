#!/system/bin/sh

/system/bin/busybox sleep 15
/system/bin/busybox route add default dev ppp0
/system/bin/busybox route add -net 192.168.0.0 netmask 255.255.0.0 dev eth0
