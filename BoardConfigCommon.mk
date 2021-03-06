# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# BoardConfig.mk
#

## Kernel, bootloader etc.
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x27a

## Platform
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_LOWMEM := true
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp

## FM Radio
#BOARD_HAVE_QCOM_FM := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

## Memory
TARGET_USES_ION := true
BOARD_USES_PMEM_ADSP := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_MHEAP_SCREENSHOT := true

## Qcom hardwae
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

## Video
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

## Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DNO_TUNNELED_SOURCE -DLPA_DEFAULT_BUFFER_SIZE=480

## EGL, graphics 
USE_OPENGL_RENDERER := true 
TARGET_QCOM_DISPLAY_VARIANT := caf 
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true 
BOARD_EGL_CFG := device/samsung/msm7x27a-common/prebuilt/lib/egl/egl.cfg 

## Qualcomm BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP -DUSE_MDP3 -DNO_IOMMU 

## Camera
TARGET_DISABLE_ARM_PIE := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DCAMERA_NO_UNWANTED_MSG -DSAMSUNG_CAMERA_LEGACY

## GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

## Bluetooth
BOARD_HAVE_BLUETOOTH := true

## Wi-Fi
BOARD_WLAN_NO_FWRELOAD := true
BOARD_WLAN_DEVICE := ath6kl
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_HAVE_LEGACY_HOSTAPD := true
BOARD_HOSTAPD_NO_ENTROPY := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_DRIVER_MODULE_AP_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"

## RIL
BOARD_USES_LEGACY_RIL := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
BOARD_RIL_CLASS := ../../../device/samsung/msm7x27a-common/ril/

## Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 24

## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

## Charging mode
BOARD_LPM_BOOT_ARGUMENT_NAME := androidboot.boot_pause
BOARD_LPM_BOOT_ARGUMENT_VALUE := batt

## Use device specific modules
TARGET_PROVIDES_LIBLIGHT := true
TARGET_PROVIDES_LIBAUDIO := true

## Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27a

## Recovery
TARGET_RECOVERY_INITRC := device/samsung/msm7x27a-common/recovery/init.recovery.qcom.rc
TARGET_RECOVERY_FSTAB := device/samsung/msm7x27a-common/rootdir/fstab.qcom
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TARGET_RECOVERY_SWIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 131072
## To avoid updater script error: blkdiscard failed:
BOARD_SUPPRESS_EMMC_WIPE := true 

## Filesystem
BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p16
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p17
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

## Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 979369984
