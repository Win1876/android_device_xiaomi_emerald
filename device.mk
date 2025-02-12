# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# A/B OTA Post-Install Config
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Enable Dynamic Partitions (Mandatory for Android 10+ devices)
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Define Vendor Boot (For Devices Using Separate vendor_boot.img)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/vendor_boot.img:$(PRODUCT_OUT)/vendor_boot.img

# Boot Control HAL (Use Shared Library Instead of Static HAL)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-service \
    bootctrl.mt6789 \
    libgptutils \
    libz \
    libcutils

# A/B OTA Packages (For Seamless Updates)
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# TWRP Specific Configurations
PRODUCT_PACKAGES += \
    recovery \
    recovery_ramdisk \
    fstab.mt6789

# Include OmniROM's Configuration File
$(call inherit-product, vendor/omni/config/common.mk)

# Include Device-Specific Makefile
$(call inherit-product, device/xiaomi/emerald/omni_emerald.mk)
