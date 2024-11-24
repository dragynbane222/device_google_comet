#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Lunch banner maintainer variable
RISING_MAINTAINER="c_smith"

# Chipset/Maintainer properties (ro.rising.chipset/ro.rising.maintainer) 
# (Optional if builder is setting properties via init_<device>.cpp)
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Google Tensor 4" \
    RisingMaintainer="c_smith"

RISING_PACKAGE_TYPE := "PIXEL"

# disable/enable blur support, default is false
TARGET_ENABLE_BLUR := true
PRODUCT_NO_CAMERA := true

WITH_GMS := true
TARGET_CORE_GMS := true
TARGET_CORE_GMS_EXTRAS := true
TARGET_DEFAULT_PIXEL_LAUNCHER := false

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_foldable_book_telephony.mk)

# Inherit device configuration
DEVICE_CODENAME := comet
DEVICE_PATH := device/google/comet
VENDOR_PATH := vendor/google/comet
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/zumapro/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 9 Pro Fold
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2424
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="comet-user 15 AP3A.241105.008 12485168 release-keys" \
    BuildFingerprint=google/comet/comet:15/AP3A.241105.008/12485168:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
