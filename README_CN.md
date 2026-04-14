### TWRP 设备树 | 一加 Ace 竞速版 / OPPO K10 / OnePlus 10R Lite (QQCandy)
[English Version](README.md)

## 设备参数信息

基本参数   | 规格
-------:|:-------------------------
CPU     | 八核4+4架构 Cortex-A78主频最高可达2.85GHz
处理器   | 联发科 天玑 8100-MAX
GPU     | Mali-G610 MC6
运行内存 | 8/12 GB RAM (LPDDR5 6400Mbps)
出厂系统 |  基于安卓12的ColorOS 12
存储规格 | 128G/256G (UFS 3.1)
电池容量 | 5000 mAh不可拆卸式
屏幕规格 | 分辨率：1080 x 2412, 6.59 英寸
支持的刷新率 | 30/45/60/75/90/120Hz
屏幕类型 | LTPS LCD屏幕

<p align="center">
  <img src="https://oasisstatics.oneplus.cn/content/dam/oasis/page/2022/operation/may/cn/540x540-grey.png" width="243">
</p>

正常工作的:
- [X] ADB调试
- [X] data解密 (Android 15/16)
- [X] 屏幕显示
- [X] Fasbootd模式
- [X] 卡刷模式
- [X] MTP文件传输
- [] Sideload侧载刷入
- [X] USB OTG功能
- [X] 震动
- [X] 触摸

## 我该如何编译它？

首先使用以下命令同步最小版本的TWRP

```
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc --all)
```

然后将这些项目添加到.repo/manifest.xml：

```xml
<project path="device/oneplus/qqcandy" name="furruka/android_device_oplus_qqcandy_twrp" remote="github" revision="a14" />
```

最后执行以下命令

```
source build/envsetup.sh
repopick <needed patch>
lunch twrp_qqcandy-eng
mka vendorbootimage -j$(nproc --all)
```
## 我该如何刷入？

使用以下命令刷入编译好的rec
```
fastboot flash vendor_boot out/target/product/qqcandy/vendor_boot.img
```
