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

# Inherit from OPLUS qqcandy device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Device identifier
PRODUCT_DEVICE := qqcandy
PRODUCT_NAME := twrp_qqcandy
PRODUCT_BRAND := OPLUS
PRODUCT_MODEL := OnePlus Ace Race
PRODUCT_MANUFACTURER := OPLUS