#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(LOCAL_PATH)/rk3368.mk)

PRODUCT_NAME := rk3368H_64
PRODUCT_DEVICE := rk3368H_64
PRODUCT_MODEL := rk3368H_64


PRODUCT_AAPT_CONFIG := normal large mdpi tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# google apps
BUILD_WITH_GOOGLE_MARKET := false
BUILD_WITH_GOOGLE_MARKET_ALL := false
BUILD_WITH_GOOGLE_FRP := false

#for drm widevine
BUILD_WITH_WIDEVINE := true

BOOT_SHUTDOWN_ANIMATION_RINGING := true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.board.device=rk3368h

