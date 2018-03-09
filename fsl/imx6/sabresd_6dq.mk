# This is a FSL Android Reference Design platform based on i.MX6Q ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)
$(call inherit-product-if-exists,vendor/google/products/gms.mk)

ifneq ($(wildcard device/fsl/sabresd_6dq/fstab_nand.freescale),)
$(shell touch device/fsl/sabresd_6dq/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/sabresd_6dq/fstab.freescale),)
$(shell touch device/fsl/sabresd_6dq/fstab.freescale)
endif

# Overrides
PRODUCT_NAME := sabresd_6dq
PRODUCT_DEVICE := sabresd_6dq

PRODUCT_COPY_FILES += \
	device/fsl/sabresd_6dq/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/sabresd_6dq/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml\
	device/fsl/sabresd_6dq/init.rc:root/init.freescale.rc \
	device/fsl/sabresd_6dq/gpsreset.sh:system/etc/gpsreset.sh \
	device/fsl/sabresd_6dq/root/chattr:system/bin/chattr \
	device/fsl/sabresd_6dq/root/daemonsu:system/xbin/daemonsu \
	device/fsl/sabresd_6dq/root/su:system/xbin/su \
        device/fsl/sabresd_6dq/root/suhelp:system/xbin/suhelp \
	device/fsl/sabresd_6dq/wdt:system/xbin/wdt \
	device/fsl/sabresd_6dq/e2fsck:root/sbin/e2fsck \
	device/fsl/sabresd_6dq/audio_policy.conf:system/etc/audio_policy.conf \
	device/fsl/sabresd_6dq/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	device/fsl/sabresd_6dq/dualnet.sh:system/etc/dualnet.sh \
	device/fsl/sabresd_6dq/shareroute.sh:system/etc/shareroute.sh \
	device/fsl/sabresd_6dq/radioresume.sh:system/etc/radioresume.sh \
	device/fsl/sabresd_6dq/ssh/bin/scp:system/bin/scp \
        device/fsl/sabresd_6dq/ssh/bin/sftp:system/bin/sftp \
        device/fsl/sabresd_6dq/ssh/bin/sftp-server:system/bin/sftp-server \
        device/fsl/sabresd_6dq/ssh/bin/ssh:system/bin/ssh \
        device/fsl/sabresd_6dq/ssh/bin/sshd:system/bin/sshd \
        device/fsl/sabresd_6dq/ssh/bin/start-ssh:system/bin/start-ssh \
        device/fsl/sabresd_6dq/ssh/bin/ssh-keygen:system/bin/ssh-keygen \
        device/fsl/sabresd_6dq/ssh/lib/libssh.so:system/lib/libssh.so \
        device/fsl/sabresd_6dq/ssh/etc/ssh/sshd_config:/system/etc/ssh/sshd_config \
        device/fsl/sabresd_6dq/ssh/etc/ssh/sshd_config:/system/etc/sshd_config \
        device/fsl/sabresd_6dq/sshkey/ssh_host_rsa_key:/system/sshkey/ssh_host_rsa_key \
        device/fsl/sabresd_6dq/sshkey/authorized_keys:/system/sshkey/authorized_keys \
        device/fsl/sabresd_6dq/sshkey/ssh_host_dsa_key:/system/sshkey/ssh_host_dsa_key \
        device/fsl/sabresd_6dq/androidvncserver:/system/bin/androidvncserver \
        device/fsl/sabresd_6dq/vncserver.sh:/system/bin/vncserver.sh \
	device/fsl/sabresd_6dq/fsluart.sh:/system/bin/fsluart.sh \
	device/fsl/sabresd_6dq/poweroff:/system/bin/poweroff \
        device/fsl/sabresd_6dq/adb_keys:system/adbkey/adb_keys \
        device/fsl/sabresd_6dq/fancontrol.sh:system/bin/fancontrol.sh \
        device/fsl/sabresd_6dq/adbconfig.sh:/system/etc/adbconfig.sh 
PRODUCT_COPY_FILES +=	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6d.bin:system/lib/firmware/vpu/vpu_fw_imx6d.bin 	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6q.bin:system/lib/firmware/vpu/vpu_fw_imx6q.bin

PRODUCT_COPY_FILES += \
        $(call find-copy-subdir-files,*.apk,$(LOCAL_PATH)/../$(PRODUCT_NAME)/preinstallapk,system/preinstall)

PRODUCT_COPY_FILES += \
       $(call find-copy-subdir-files,*.so,$(LOCAL_PATH)/../$(PRODUCT_NAME)/system_libs,system/lib)

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/sabresd_6dq/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# for PDK build, include only when the dir exists
# too early to use $(TARGET_BUILD_PDK)
ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
endif
