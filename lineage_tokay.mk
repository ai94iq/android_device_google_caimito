#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := tokay
DEVICE_PATH := device/google/caimito
VENDOR_PATH := vendor/google/tokay
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/zumapro/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Inherit keys
$(call inherit-product, vendor/lineage-priv/keys/keys.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 9
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2424
TARGET_SCREEN_WIDTH := 1080

# Axion specific
AXION_CAMERA_REAR_INFO := 50,48
AXION_CAMERA_FRONT_INFO := 10
AXION_CPU_SMALL_CORES := 0,1,2,3
AXION_CPU_BIG_CORES := 4,5,6,7
AXION_MAINTAINER := Abdulwahab_(ai94iq)
AXION_PROCESSOR := Google_Tensor_G4
TARGET_PREBUILT_BCR := true
PRODUCT_NO_CAMERA := false
TARGET_INCLUDE_MATLOG := true
TARGET_INCLUDES_LOS_PREBUILTS := true
TARGET_OTA_ENABLED := false


PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="tokay-user 15 BP1A.250405.007 13240079 release-keys" \
    BuildFingerprint=google/tokay/tokay:15/BP1A.250405.007/13240079:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
