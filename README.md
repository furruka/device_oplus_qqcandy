### TWRP device tree for OnePlus Ace Race / OPPO K10 / OnePlus 10R Lite (QQCandy)
=========================================

[简体中文](README_CN.md)

The OnePlus Ace Race (codenamed _"qqcandy"_) is a high-end, mid-range smartphone from OnePlus.

It was released in May 2022.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core CPU with 4x Arm Cortex-A78 up to 2.85GHz
Chipset | Mediatek Dimensity 8100-MAX
GPU     | Mali-G610 MC6
Memory  | 8/12 GB RAM (LPDDR5 6400Mbps)
Shipped Android Version | 12 with ColorOS 12
Storage | 128/256 (UFS 3.1)
Battery | Non-removable Li-Po 5000 mAh battery
Display | 1080 x 2412 pixels, 6.59 inches, 30/45/60/75/90/120Hz, LTPS LCD

<p align="center">
  <img src="https://growth-cdn.ticwear.com/ticbuy/img/ticwatche3-style-watch-black.0.png](https://oasisstatics.oneplus.cn/content/dam/oasis/page/2022/operation/may/cn/540x540-grey.png" width="243">
</p>

## Features

Works:

- [X] ADB
- [X] Decryption (Android 15)
- [X] Display
- [X] Fasbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [] Vibrator
- [X] Touch

## Compile

First checkout minimal twrp with aosp tree:

```
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc --all)
```

Then add these projects to .repo/manifest.xml:

```xml
<project path="device/oneplus/qqcandy" name="furruka/android_device_oplus_qqcandy_twrp" remote="github" revision="a14" />
```

Finally execute these:

```
source build/envsetup.sh
repopick <needed patch>
lunch twrp_qqcandy-eng
mka vendorbootimage -j$(nproc --all)
```
## To use it:

```
fastboot flash vendor_boot out/target/product/qqcandy/vendor_boot.img
```
