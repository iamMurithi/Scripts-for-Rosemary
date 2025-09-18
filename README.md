# Firmware/ROM Flashing Scripts for Redmi Note 10S rosemary
A simple, automated shell scripts & Guides for flashing the low-level firmware & CustomROM builds on the Redmi Note 10S (codenamed rosemary) using the fastboot tool following prerequisite requirements from different maintainers

## The Device: Redmi Note 10S (MTK MT6785)

This device utilizes the **MediaTek Helio G95 (MT6785)** chipset, a System-on-a-Chip (SoC) known for its power efficiency and performance in mid-range smartphones. The firmware partitions present are common to MediaTek-based Android devices and are crucial for the device's basic functionality.

# 1. Firmware Flashing Script 
## Prerequisites

Before running the script, ensure you have the following:

1.  **Android Platform Tools**: You need `fastboot` installed and added to your system's `PATH`. You can download the latest tools from the official Android developer website.
2.  **Git Bash**: The script is written for a Unix-like environment and is intended to be run from Git Bash on Windows.
3.  **Firmware Files**: You must have the firmware images (e.g., `audio_dsp.img`, `gz.img`, etc.) extracted into the same directory as the script. The `payload-dumper-go` tool can be used to extract these files from a MIUI firmware ZIP archive.

## Usage

1.  Place the `flash_firmware.sh` script in the same folder as your extracted firmware `.img` files.
2.  Open **Git Bash** and navigate to that folder using the `cd` command.
3.  Make the script executable: `chmod +x flash_firmware.sh`
4.  Connect your Redmi Note 10S to your computer and boot it into **fastboot mode** (hold **Volume Down** + **Power**).
5.  Execute the script: `./flash_firmware.sh`
6.  Follow the on-screen prompts to confirm the flashing process.

## Understanding the Partitions

The script flashes several key partitions. These are not standard Android partitions like `/system` or `/data` but are part of the device's low-level firmware.

  * **`audio_dsp`**: **Audio Digital Signal Processor.** This partition contains the firmware for the dedicated audio processor, which handles audio encoding, decoding, and effects to offload the main CPU.
  * **`cam_vpu` (cam\_vpu1, cam\_vpu2, cam\_vpu3)**: **Camera Video Processing Unit.** These partitions contain the firmware for the image and video signal processors. They are essential for handling camera data, image stabilization, and other photography-related tasks.
  * **`gz`**: **G-Zone.** This refers to a secure partition related to the device's **Trusted Execution Environment (TEE)**. It contains security-related components, including verified boot and secure payment functions.
  * **`lk`**: **Little Kernel.** This is an early-stage bootloader that runs after the `preloader`. It initializes core components like RAM and other essential hardware before handing control to the main Android bootloader.
  * **`md1img`**: **Modem Image.** This contains the firmware for the cellular modem. It is responsible for all mobile network functions, including phone calls, SMS, and data connectivity.
  * **`preloader`**: The very first bootloader to run on a MediaTek SoC. It's a critical, low-level piece of code that initializes the SoC and loads the next bootloader (`lk`) from memory.
  * **`scp`**: **System Control Processor.** A dedicated, low-power processor that manages background tasks and system states when the main CPU is idle or in sleep mode.
  * **`spmfw`**: **Standby Power Management Firmware.** This firmware manages the device's power states and transitions, ensuring efficient energy usage.
  * **`sspm`**: **Secure System Power Management.** A secure version of the `spmfw`, operating within the TEE to handle power management in a trusted environment.
  * **`tee`**: **Trusted Execution Environment.** A secure operating system that runs alongside Android. It handles sensitive operations like fingerprint authentication and cryptographic key storage.

-----
