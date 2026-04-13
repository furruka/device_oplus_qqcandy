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
