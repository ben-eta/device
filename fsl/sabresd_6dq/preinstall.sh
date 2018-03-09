#!/system/bin/busybox sh  
  
BUSYBOX="/system/bin/busybox"  
  
if [ ! -e /data/system.notfirstrun ]; then    
    echo "do preinstall job"      
  
    /system/bin/sh /system/bin/pm preinstall /system/preinstall   
    $BUSYBOX touch /data/system.notfirstrun   
    echo "preinstall ok"  
fi 
