# full makefile for the device

DEVICE_PATH := device/oneplus/OP515BL1

# installs gsi keys into ramdisk, to boot a GSI with verified boot
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

#TODO: check parts makefile

PRODUCT_SHIPPING_API_LEVEL := 30

# call proprietary blob setup
$(call inherit-product-if-exists, vendor/oneplus/OP515BL1/OP515BL1-vendor.mk)

# dynamic partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# A/B
AB_OTA_UPDATER := false

# audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/audio_policy_configuration.xml

#TODO: test if this is available
# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6893:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6893

# fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.OP515BL1 \
    lineage.biometrics.fingerprint.inscreen@1.0-service.OP515BL1

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# lineage specific perms
PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# init
PRODUCT_PACKAGES += \
    init.mt6893.rc \
    fstab.mt6893 \
    perf_profile.sh

# keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl

# screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.OP515BL1

#TODO: add overlay packages
# overlays
#DEVICE_PACKAGE_OVERLAYS += \
#    $(DEVICE_PATH)/overlay \
#    $(DEVICE_PATH)/overlay-lineage

#TODO: add permissions config
# permissions
#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

#TODO: add recovery package
# recovery
#PRODUCT_PACKAGES += \
#    init.recovery.mt6893.rc

#TODO: add rc's services
# rc's service
#PRODUCT_PACKAGES += \
#    com.android.ims.rcsmanager \
#    RcsService \
#    PresencePolling

# soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

#TODO: add system prop makefile
# system prop
#-include $(DEVICE_PATH)/system_prop.mk
#PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

#TODO: add libshim package
# symbols
#PRODUCT_PACKAGES += \
#    libshim_vtservice

#TODO: add telephony jars
# telephony
#PRODUCT_BOOT_JARS += \
#    mediatek-common \
#    mediatek-framework \
#    mediatek-ims-base \
#    mediatek-ims-common \
#    mediatek-telecom-common \
#    mediatek-telephony-base \
#    mediatek-telephony-common

#TODO: add ims service package
#PRODUCT_PACKAGES += \
#    ImsServiceBase

#TODO: add wifi packages
# wifi
#PRODUCT_PACKAGES += \
#    TetheringConfigOverlay \
#    WifiOverlay \
#    DozeOverlaySystem \
#    DozeOverlaySystemUI