DEVICE_TREE := device/xiaomi/lithium

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8996

# Platform
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530

# Flags
#TARGET_GLOBAL_CFLAGS +=
#TARGET_GLOBAL_CPPFLAGS +=
#COMMON_GLOBAL_CFLAGS +=

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
#TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8996
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := twrp_defconfig
TARGET_KERNEL_DEVICE_DEFCONFIG := device_xiaomi_lithium-eu
# Prebuilt kernel from latest XIAOMI EU:
TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/Image.gz-dtb-7.7.15_N

# Boot image
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom androidboot.bootdevice=624000.ufshc androidboot.selinux=permissive user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=16M@0-0xffffffff enforcing=0

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x0004000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x0004000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x00C0000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x3A5F7FB000
BOARD_CACHEIMAGE_PARTITION_SIZE    := 0x0010000000
BOARD_FLASH_BLOCK_SIZE := 0x40000

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/soc/6a00000.ssusb/6a00000.dwc3/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/devices/soc/900000.qcom\x2cmdss_mdp/900000.qcom\x2cmdss_mdp:qcom\x2cmdss_fb_primary/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150
#TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TW_INCLUDE_NTFS_3G := true

# No love for the wicked (device ships with M)
TW_EXCLUDE_SUPERSU := true

# Virtual mouse device we don't want
TW_INPUT_BLACKLIST := "hbtp_vm"

# Asian region languages
TW_EXTRA_LANGUAGES := true

# Encryption support
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := qseecomd

TARGET_HW_DISK_ENCRYPTION := true
#TARGET_KEYMASTER_WAIT_FOR_QSEE := true
#TARGET_CRYPTFS_HW_PATH := $(DEVICE_TREE)/cryptfs_hw

# Debug flags
#TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# MR config. MultiROM also uses parts of TWRP config
TARGET_RECOVERY_IS_MULTIROM := true

MR_NO_KEXEC := 2
# possible options:
#       1 true allowed      # NO_KEXEC_DISABLED =  0x00,   // no-kexec is disabled (ie it is built, but needs to be manually enabled)
#       2 enabled           # NO_KEXEC_ALLOWED  =  0x01,   // "Use no-kexec only when needed"
#       3 ui_confirm        # NO_KEXEC_CONFIRM  =  0x02,   // "..... but also ask for confirmation"
#       4 ui_choice         # NO_KEXEC_CHOICE   =  0x04,   // "Ask whether to kexec or use no-kexec"
#       5 forced            # NO_KEXEC_FORCED   =  0x08,   // "Always force using no-kexec workaround"
# any other setting won't build it at all

#MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
#MR_CONTINUOUS_FB_UPDATE := true
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_USE_MROM_FSTAB := true
#MR_FSTAB := $(DEVICE_TREE)/multirom/mrom.fstab
MR_FSTAB := $(DEVICE_TREE)/recovery.fstab
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := $(DEVICE_TREE)/multirom/mr_init_devices.c

MR_KEXEC_MEM_MIN := 0x00200000
MR_KEXEC_DTB := true

MR_DEVICE_HOOKS := $(DEVICE_TREE)/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 6

MR_DEVICE_VARIANTS := lithium
#MR_USE_QCOM_OVERLAY := true
#MR_QCOM_OVERLAY_HEADER := $(DEVICE_TREE)/multirom/mr_qcom_overlay.h
#MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888

MR_ENCRYPTION := true
MR_ENCRYPTION_SETUP_SCRIPT := $(DEVICE_TREE)/multirom/mr_cp_crypto.sh
MR_ENCRYPTION_FAKE_PROPERTIES := true
MR_ENCRYPTION_FAKE_PROPERTIES_EXTRAS := $(DEVICE_TREE)/multirom/mr_fake_properties.c

# bootmenu
DEVICE_RESOLUTION := 1080x1920
MR_PIXEL_FORMAT := "RGBA_8888"
MR_UNIFIED_TABS := true
MR_USE_DEBUGFS_MOUNT := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
#MR_DEV_BLOCK_BOOTDEVICE := true

#Force populating /dev/block/platform/soc/624000.ufshc/by-name
#from the emmc
#MR_POPULATE_BY_NAME_PATH := "/dev/block/platform/soc/624000.ufshc/by-name"
#MR_POPULATE_BY_NAME_PATH := "/dev/block/bootdevice/by-name"
MR_DEVICE_BOOTDEVICE := /dev/block/platform/soc/624000.ufshc

# Versioning
TW_DEVICE_VERSION := 1

include $(DEVICE_TREE)/multirom/version/MR_REC_VERSION.mk

ifeq ($(MR_REC_VERSION),)
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
endif

BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)

