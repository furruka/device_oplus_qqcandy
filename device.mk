#
# Copyright (C) 2026 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/oplus/qqcandy

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# API
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 35

# TWRP in Vendor Boot
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL (MTK custom impl).
# The passthrough .so for the HAL service is shipped as a prebuilt directly in
# recovery/root/system/lib64/hw/ (packed into vendor_boot via BOARD_VENDOR_RAMDISK_DIR).
# libhidlbase scans system/lib64/hw/ and matches it via regex [pkg@ver]-impl(.*).so.
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    checkpoint_gc

# A/B
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true
AB_OTA_PARTITIONS := \
    boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    system \
    system_ext \
    product \
    vendor \
    odm \
    odm_dlkm \
    vendor_dlkm \
    lk \
    preloader_raw \
    md1img \
    audio_dsp \
    apusys \
    tee \
    mcupm \
    spmfw \
    sspm \
    ccu \
    scp \
    vcp \
    gz \
    dpm \
    gpu_eb \
    mvpu_algo \
    mcf_ota \

# AB partitions for oplus
AB_OTA_PARTITIONS += \
    my_bigball \
    my_carrier \
    my_company \
    my_engineering \
    my_heytap \
    my_manifest \
    my_preload \
    my_product \
    my_region \
    my_stock

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.2

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0 \
    android.hardware.fastboot@1.1

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0 \
    android.hardware.keymaster@4.0 \
    android.hardware.keymaster@4.1

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform \
    android.hardware.security.secureclock-V1-ndk_platform \
    android.hardware.security.sharedsecret-V1-ndk_platform

# Crypto helpers
PRODUCT_PACKAGES += \
    wait_for_keymaster

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/special_OTA \
    $(DEVICE_PATH)/security/local_OTA