include device/rockchip/rk3368/BoardConfig.mk

#TARGET_CPU_ABI := armeabi-v7a
#TARGET_CPU_ABI2 := armeabi
#TARGET_CPU_SMP := true
#TARGET_ARCH := arm
#TARGET_ARCH_VARIANT := armv7-a-neon
#TARGET_CPU_VARIANT := cortex-a15

#TARGET_2ND_ARCH :=
#TARGET_2ND_ARCH_VARIANT :=
#TARGET_2ND_CPU_ABI :=
#TARGET_2ND_CPU_ABI2 :=
#TARGET_2ND_CPU_VARIANT :=

# Re-enable emulator for 32-bit
BUILD_EMULATOR := false

TARGET_BOARD_PLATFORM_PRODUCT := box
TARGET_DISASTER_RECOVERY := false

DEVICE_PACKAGE_OVERLAYS += device/rockchip/rk3368/rk3368_box/overlay

# Set system.img size
ifeq ($(strip $(BUILD_BOX_WITH_GOOGLE_MARKET)), true)
  BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1500000000
else
  ifeq ($(TARGET_BUILD_VARIANT),user)
    BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1500000000
  else
    BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1200000000
  endif
endif


# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    WITH_DEXPREOPT := true
  else
    WITH_DEXPREOPT := false
  endif
endif
