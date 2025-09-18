## Device Partitions

This file details the partition layout of Rosemary in a working custom ROM envrionment (MediaTek A/B partitioned).
The information was obtained by running `ls -al /dev/block/by-name` via an `adb shell` with root privileges. This command lists all partitions on the device, showing their user-friendly names and mapping them to their physical block device locations (e.g., `/dev/block/sdcXX`).

-----

### Partition List by Logical Block Order

```bash
ls -al /dev/block/by-name
```

```
total 0
drwxr-xr-x 2 root root 1380 2025-09-18 13:49 .
drwxr-xr-x 6 root root 3220 2025-09-18 13:50 ..
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 misc -> /dev/block/sdc1
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 countrycode -> /dev/block/sdc2
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 para -> /dev/block/sdc3
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 expdb -> /dev/block/sdc4
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 gsort -> /dev/block/sdc5
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 ffu -> /dev/block/sdc6
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 cust -> /dev/block/sdc7
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 blk1 -> /dev/block/sdc8
lrwxrwxrwx 1 root root   15 2025-09-18 13:49 rescue -> /dev/block/sdc9
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 frp -> /dev/block/sdc10
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 nvcfg -> /dev/block/sdc11
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 nvdata -> /dev/block/sdc12
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vbmeta_a -> /dev/block/sdc13
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vbmeta_system_a -> /dev/block/sdc14
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vbmeta_vendor_a -> /dev/block/sdc15
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vbmeta_b -> /dev/block/sdc16
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vbmeta_system_b -> /dev/block/sdc17
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vbmeta_vendor_b -> /dev/block/sdc18
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 md_udc -> /dev/block/sdc19
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 metadata -> /dev/block/sdc20
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 persist -> /dev/block/sdc21
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 protect1 -> /dev/block/sdc22
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 protect2 -> /dev/block/sdc23
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 seccfg -> /dev/block/sdc24
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 otp -> /dev/block/sdc25
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 md1img_a -> /dev/block/sdc26
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 spmfw_a -> /dev/block/sdc27
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 audio_dsp_a -> /dev/block/sdc28
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 scp_a -> /dev/block/sdc29
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 sspm_a -> /dev/block/sdc30
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 cam_vpu1_a -> /dev/block/sdc31
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 cam_vpu2_a -> /dev/block/sdc32
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 cam_vpu3_a -> /dev/block/sdc33
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 gz_a -> /dev/block/sdc34
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 lk_a -> /dev/block/sdc35
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 boot_a -> /dev/block/sdc36
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vendor_boot_a -> /dev/block/sdc37
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 dtbo_a -> /dev/block/sdc38
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 tee_a -> /dev/block/sdc39
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 sec1 -> /dev/block/sdc40
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 proinfo -> /dev/block/sdc41
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 efuse -> /dev/block/sdc42
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 nvram -> /dev/block/sdc43
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 boot_para -> /dev/block/sdc44
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 logo -> /dev/block/sdc45
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 md1img_b -> /dev/block/sdc46
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 spmfw_b -> /dev/block/sdc47
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 audio_dsp_b -> /dev/block/sdc48
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 scp_b -> /dev/block/sdc49
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 sspm_b -> /dev/block/sdc50
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 cam_vpu1_b -> /dev/block/sdc51
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 cam_vpu2_b -> /dev/block/sdc52
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 cam_vpu3_b -> /dev/block/sdc53
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 gz_b -> /dev/block/sdc54
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 lk_b -> /dev/block/sdc55
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 boot_b -> /dev/block/sdc56
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 vendor_boot_b -> /dev/block/sdc57
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 dtbo_b -> /dev/block/sdc58
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 tee_b -> /dev/block/sdc59
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 super -> /dev/block/sdc60
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 userdata -> /dev/block/sdc61
lrwxrwxrwx 1 root root   16 2025-09-18 13:49 flashinfo -> /dev/block/sdc62
```

-----

## Partition Descriptions
### Boot & System Partitions 
These partitions are core to the Android OS and device boot process. The `_a` and `_b` suffixes indicate that the device uses **A/B partitioning** (seamless updates), so each partition has two slots.

* **`boot_a`** and **`boot_b`**: Contain the kernel and ramdisk for each slot. This is the first thing loaded by the bootloader to start Android.
* **`dtbo_a`** and **`dtbo_b`**: **Device Tree Blob Overlay.** These blobs contain hardware configuration and driver information for the kernel. They "overlay" the base device tree, allowing for more flexible hardware support.
* **`super`**: This is a key partition for modern Android devices. It is a **super partition** that uses Logical Partitions and holds the `system`, `vendor`, `product`, and other dynamic partitions.
* **`vbmeta_a`**, **`vbmeta_b`**, **`vbmeta_system_a`**, **`vbmeta_system_b`**, **`vbmeta_vendor_a`**, **`vbmeta_vendor_b`**: **Verified Boot Metadata.** These partitions contain cryptographic hashes and signatures to ensure the integrity of the corresponding partitions (e.g., `system`, `vendor`). They are essential for Android's security model.
* **`vendor_boot_a`** and **`vendor_boot_b`**: These partitions contain the **vendor-specific ramdisk**, which is part of the vendor image and is used by the kernel to mount the `/vendor` partition early in the boot process.

***

### Firmware & Hardware Partitions
These partitions contain proprietary firmware and configurations specific to the device's hardware. They are typically written at the factory and are not meant to be modified.

* **`audio_dsp_a`** and **`audio_dsp_b`**: Contain the **Digital Signal Processor (DSP)** firmware for audio processing. This is a dedicated chip that handles audio encoding, decoding, and effects.
* **`lk_a`** and **`lk_b`**: **Little Kernel.** This is a small bootloader that is executed before the main Android bootloader. It performs initial hardware checks.
* **`md1img_a`** and **`md1img_b`**: Contain the **modem firmware** (the "baseband"). This software handles cellular communication, including calls, SMS, and data.
* **`scp_a`** and **`scp_b`**: **Sensor Co-Processor.** Contains firmware for the sensor hub, which offloads sensor-related tasks from the main CPU to save power.
* **`spmfw_a`** and **`spmfw_b`**: **System Power Management Firmware.** This firmware is responsible for managing the device's power states and sleep modes.
* **`sspm_a`** and **`sspm_b`**: **System Security Processor Management.** Handles security-related tasks at a low level.
* **`tee_a`** and **`tee_b`**: **Trusted Execution Environment.** These contain the trusted OS firmware for secure tasks like handling fingerprints and secure payments.

***

### User Data & Other Partitions
These partitions manage user-specific data, settings, and other device-specific information.

* **`userdata`**: Contains all user data, including apps, settings, photos, and files. This is what's wiped during a factory reset.
* **`frp`**: **Factory Reset Protection.** This partition stores a flag to prevent a device from being factory reset without the original owner's Google account credentials.
* **`metadata`**: Used for storing device encryption metadata.
* **`nvram`**, **`nvcfg`**, **`nvdata`**: **Non-Volatile RAM/Configuration/Data.** These partitions store persistent, low-level data like IMEI, Wi-Fi MAC addresses, and other calibration data. They are crucial for device functionality.
* **`persist`**: Stores information that needs to survive a factory reset, such as Wi-Fi/Bluetooth MAC addresses and other sensor calibration data.

***

### Other Partitions
This section includes partitions with more specialized or less commonly understood functions.

* **`misc`**: Stores information for recovery and fastboot to communicate, such as the command to boot into recovery mode.
* **`preloader_raw_a`** and **`preloader_raw_b`**: This is the first bootloader to run on a MediaTek SoC. It initializes the most basic hardware components.
* **`proinfo`**: **Production Information.** Contains information like the device's model number, serial number, and manufacturing date.
* **`rescue`**: A fallback or "rescue" system used to restore the device if the primary OS fails.
* **`sec1`** and **`seccfg`**: Likely related to security and secure configuration.
* **`protect1`** and **`protect2`**: May contain protected or encrypted data, often related to security.
