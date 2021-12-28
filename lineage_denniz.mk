#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from denniz device
$(call inherit-product, device/oneplus/denniz/device.mk)

PRODUCT_NAME := lineage_denniz
PRODUCT_DEVICE := denniz
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := DN2101

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=OP515BL1 \
    PRODUCT_NAME=DN2101 \
    PRIVATE_BUILD_DESC="OnePlus/DN2103EEA/OP515BL1:11/RP1A.200720.011/1626976753491:user/release-keys"

BUILD_FINGERPRINT := OnePlus/DN2103EEA/OP515BL1:11/RP1A.200720.011/1626976753491:user/release-keys
