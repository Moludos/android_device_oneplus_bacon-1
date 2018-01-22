#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# inherit from Oppo msm8974-common
-include device/oppo/msm8974-common/BoardConfigCommon.mk

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=bacon user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive
TARGET_KERNEL_CONFIG := pnw_bacon_defconfig
TARGET_KERNEL_SOURCE := kernel/oppo/msm8974
#KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.9/bin
#KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Assert
TARGET_OTA_ASSERT_DEVICE := bacon,A0001

# Audio
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oneplus/bacon/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1388314624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13271448576
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 59914792960
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G

# Init
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/oneplus/bacon/init/init_bacon.cpp

# NFC
BOARD_NFC_CHIPSET := pn547

# Properties
TARGET_SYSTEM_PROP += device/oneplus/bacon/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := device/oneplus/bacon/rootdir/etc/fstab.recovery

# Add fix for common JACK issues
ANDROID_JACK_VM_ARGS := -Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m

# SELinux
#BOARD_SEPOLICY_DIRS += \
    device/oneplus/bacon/sepolicy

# Snapdragon LLVM
TARGET_USE_SDCLANG := true

# TWRP
ifeq ($(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += device/oneplus/bacon/twrp
endif

# Inherit from the proprietary version
include vendor/oneplus/bacon/BoardConfigVendor.mk
