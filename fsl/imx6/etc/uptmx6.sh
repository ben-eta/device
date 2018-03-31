	
	src="/mnt/media_rw/extsd/update.zip"
	dst="/cache/update.zip"
	checkpath="/cache/update.zip.checksum"

	getevent &
	ds18b20 &

	sleep 1
	exit 1


	for i in 1 2  
	do
		sleep 15
		if [ -f "$src" ]; then
			echo $src
			mkdir -p /cache/recovery
			#echo x > /sys/power/wake_lock
			busybox cp $src $dst
			sync
			
			if [ -f "$checkpath" ]; then
				CHECK_UBOOT=`busybox md5sum -c /cache/update.zip.checksum`
				CHECK_SUM_UBOOT=$?

				if [ ${CHECK_SUM_UBOOT} -ne 0 ];then
					echo "		checksum update.zip.checksum failed " 
				else
					echo "		checksum update.zip.checksum success " 
					exit 1
				fi
			fi
			
			if [ -f "$dst" ]; then
				echo "ota update ----"
				busybox md5sum /cache/update.zip > /cache/update.zip.checksum
				echo "--update_package=$dst" > /cache/recovery/command
				sync
				sleep 5
				reboot recovery
				exit 1
			fi
		else
			echo "........."
		fi
	done
    exit 0

		
