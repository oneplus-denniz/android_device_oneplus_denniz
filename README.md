# Device Tree for oneplus_denniz

> OnePlus Nord 2 5G

**!! under development !!**

## prepair

To prepair your device go to the newst [release](https://github.com/oneplus-denniz/android_device_oneplus_denniz/releases) and download the `vbmeta.img` and `twrp.img`, and follow these steps:

- reboot into bootloader
- `fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img`
- `fastboot flash recovery recovery.img`
- `fastboot reboot recovery` and now follow the install steps

## install

To install the newest build go to [Releases](https://github.com/oneplus-denniz/android_device_oneplus_denniz/releases) and download the `lineage-18.1-XXXXXXXX-UNOFFICIAL-denniz.zip` and the `magisk-v23.zip`, and follow these steps:

- reboot into recovery mode
- add the zip's via `adb push`
- install this zip's
