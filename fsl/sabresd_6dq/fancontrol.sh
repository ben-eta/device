#!/system/bin/sh
while [ 1 ];do
    #gt=`cat /sys/devices/virtual/thermal/thermal_zone0/temp`
    gt=`cat /sys/bus/i2c/devices/2-0048/temp1_input`
    echo $gt
    if [ $gt -lt 45000 ];then
        echo 0 > /sys/devices/platform/pwm-backlight.0/backlight/pwm-backlight.0/brightness
	echo 0
    elif [ $gt -gt 50000 ];then
        echo 248 > /sys/devices/platform/pwm-backlight.0/backlight/pwm-backlight.0/brightness
	echo 248
    else
        echo "Keep current speed!"
    fi
    sleep 2
done
