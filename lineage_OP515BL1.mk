# main makefile for lineage OS

# inherit from those products, most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# inherit from device makefile
$(call inherit-product, device/oneplus/OP515BL1/device.mk)

# device identifier
PRODUCT_NAME := lineage_OP515BL1
PRODUCT_DEVICE := OP515BL1
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus Nord 2 5G
PRODUCT_MANUFACTURER := OnePlus

# inherit some common lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# build info
BUILD_FINGERPRINT := "OnePlus/DN2103EEA/OP515BL1:11/RP1A.200720.011/1626976753491:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=OP515BL1 \
    PRODUCT_NAME=OP515BL1 \
    PRIVATE_BUILD_DESC="sys_oplus_mssi_64_cn-user 11 RP1A.200720.011 1626976753491 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
