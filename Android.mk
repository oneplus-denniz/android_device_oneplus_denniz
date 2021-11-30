############################################
#										   #
# Copyright (C) 2021 The LineageOS Project #
#										   #
# SPDX-License-Identifier: Apache-2.0	   #
#										   #
############################################

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),OP515BL1)

$(call add-radio-file,releasetools/dynamic-remove-oplus)

include $(call all-makefiles-under,$(LOCAL_PATH))
endif
