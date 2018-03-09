#!/system/bin/sh

mount -o remount rw /system
chown 0.0 /system/bin/su
chmod 06755 /system/bin/su
chmod 0644 /system/app/Superuser.apk
sleep 1;
busybox rm /system/etc/su_init.sh
