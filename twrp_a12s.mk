#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
DEVICE_PATH := device/samsung/a12s

# Release name
PRODUCT_RELEASE_NAME := a12s

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a12s/device.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

- PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root)
+ PRODUCT_COPY_FILES += $(call cc_prebuilt_binary, parted)
+ PRODUCT_COPY_FILES += $(call cc_prebuilt_binary, coreutils)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a12s
PRODUCT_NAME := twrp_a12s
PRODUCT_MODEL := a12s
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a12sub-user 13 TP1A.220624.014 A127MUBUBDWK2-A127FXXSADWK2 release-keys"

BUILD_FINGERPRINT := samsung/a12sub/a12s:13/TP1A.220624.014/A127MUBUBDWK2-A127FXXSADWK2:user/release-keys

