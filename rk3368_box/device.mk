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

#overlay config
PRODUCT_PACKAGE_OVERLAYS += device/rockchip/rk3368/rk3368_box/overlay
PRODUCT_PACKAGES += \
    libion \
    memtrack.$(TARGET_BOARD_PLATFORM)

# Default integrate MediaCenter
PRODUCT_PACKAGES += \
    MediaCenter

#enable this for support f2fs with data partion
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
ifeq ($(HOST_OS),linux)
  TARGET_USERIMAGES_USE_F2FS := true
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rk3368.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rk3368.rc \
    device/rockchip/rk3368/init.rk30board.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rk30board.usb.rc \
    device/rockchip/rk3368/wake_lock_filter.xml:system/etc/wake_lock_filter.xml \
    device/rockchip/rk3368/package_performance.xml:$(TARGET_COPY_OUT_OEM)/etc/package_performance.xml \
    device/rockchip/$(TARGET_BOARD_PLATFORM)/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml \
    device/rockchip/$(TARGET_BOARD_PLATFORM)/media_profiles_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml


# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


$(call inherit-product-if-exists, vendor/rockchip/rk3368/device-vendor.mk)

#for enable optee support
ifeq ($(strip $(PRODUCT_HAVE_OPTEE)),true)

PRODUCT_COPY_FILES += \
       device/rockchip/common/init.optee_verify.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.optee.rc
endif

PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl \
    memtrack.$(TARGET_BOARD_PLATFORM)

#
#add Rockchip properties here
#
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.audio.monitorOrientation=true \
    vendor.hwc.compose_policy=6 \
    sf.power.control=2073600 \
    ro.tether.denied=false \
    sys.resolution.changed=false \
    ro.product.usbfactory=rockchip_usb \
    wifi.supplicant_scan_interval=15 \
    ro.kernel.android.checkjni=0 \
    ro.vendor.nrdp.modelgroup=NEXUSPLAYERFUGU \
    vendor.hwc.device.primary=HDMI-A,TV \
    sys.video.maxMemCapacity=165 \
    sys.video.refFrameMode=1 \
    ro.vendor.sdkversion=$(CURRENT_SDK_VERSION)

ifeq ($(TARGET_BOARD_PLATFORM_PRODUCT), box)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160
endif

# GTVS add the Client ID (provided by Google)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-rockchip-tv

# Vendor seccomp policy files for media components:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

PRODUCT_COPY_FILES += \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

