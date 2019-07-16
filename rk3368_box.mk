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
include device/rockchip/rk3368/rk3368_box/BoardConfig.mk
# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3368/rk3368_box/device.mk)
$(call inherit-product, device/rockchip/common/device.mk)

#TODO TV?
PRODUCT_CHARACTERISTICS := tv

PRODUCT_NAME := rk3368_box
PRODUCT_DEVICE := rk3368_box
PRODUCT_BRAND := rockchip
PRODUCT_MODEL := rk3368_box
PRODUCT_MANUFACTURER := rockchip
PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_HAVE_OPTEE := true
# TV Input HAL
PRODUCT_PACKAGES += \
    android.hardware.tv.input@1.0-impl
