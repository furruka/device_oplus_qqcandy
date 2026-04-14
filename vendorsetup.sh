# OrangeFox Recovery build variables for qqcandy (OnePlus Ace Race / mt6895)
# This file is auto-sourced by the Android build system.

# Mark this as a vendor_boot-as-recovery build (hdr4 / GKI 2.0 VAB device).
# Required for the OFR installer to correctly identify the running recovery
# and to use the right code paths when reflashing.
export FOX_VENDOR_BOOT_RECOVERY=1

# Suppress "Flash Current OrangeFox" / "Reflash after ROM" features,
# which are incompatible with vendor_boot devices.
export OF_NO_REFLASH_CURRENT_ORANGEFOX=1

# Hide flashlight UI entry on this device: kernel exposes MTK flashlight_core
# multi-argument interface, which is not compatible with TWRP single-node torch.
export OF_FLASHLIGHT_ENABLE=0

export FOX_VIRTUAL_AB_DEVICE=1
export FOX_ENABLE_APP_MANAGER=1
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_ZSTD_BINARY=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_UPDATED_MAGISKBOOT=1
export FOX_USE_DATE_BINARY=1
export FOX_TARGET_DEVICES=qqcandy
export TARGET_DEVICE_ALT=qqcandy
export FOX_INSTALLER_DISABLE_AUTOREBOOT=1
export FOX_DELETE_AROMAFM=1
export FOX_VARIANT="c15"
export FOX_VERSION="R12.0"
export FOX_BUILD_TYPE="Unofficial"
export OF_MAINTAINER="Furruka"
