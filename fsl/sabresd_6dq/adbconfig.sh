#!/system/bin/sh
/system/xbin/suhelp
cp /system/adbkey/adb_keys /data/misc/adb/
chmod 711 /data/misc/adb/adb_keys
stop adbd
start adbd 
cp /system/sshkey/ssh_host_rsa_key /data/ssh/
cp /system/sshkey/ssh_host_dsa_key /data/ssh/
cp /system/sshkey/authorized_keys /data/ssh/
chmod 700 /data/ssh/authorized_keys
chmod 700 /data/ssh/ssh_host_rsa_key
chmod 700 /data/ssh/ssh_host_dsa_key
start-ssh &
start vncserver
