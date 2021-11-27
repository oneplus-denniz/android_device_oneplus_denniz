# master makefile for android build

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),OP515BL1)

#TODO: add releasetools
#$(call add-radio-file,releasetools/dynamic-remove-oneplus)

include $(call all-makefiles-under,$(LOCAL_PATH))
endif
