#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Alert slider
PRODUCT_PACKAGES += \
    alert-slider_daemon

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_PACKAGES += \
   Snap

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl \
    $(LOCAL_PATH)/keylayout/mt63xx-accdet_Headset.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mt63xx-accdet_Headset.kl

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/permissions/android.hardware.sensor.light.xml

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Rootdir
PRODUCT_PACKAGES += \
    init.mt6893.rc \
    init.oplus.rc \
    init.recovery.mt6893.rc \
    fstab.mt6893 \
    fstab.mt6893_ramdisk

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_BOOT_JARS += \
    ImsServiceBase \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_PACKAGES += \
    ImsServiceBase \
    libshim_vtservice

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# VNDK
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := 30

# Wifi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay
