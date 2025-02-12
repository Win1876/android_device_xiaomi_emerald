#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), emerald)

# Include all subdirectories
include $(call all-subdir-makefiles, $(LOCAL_PATH))

# Device-specific definitions
include $(CLEAR_VARS)

LOCAL_MODULE := emerald
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := device.mk
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)

include $(BUILD_PREBUILT)

endif

