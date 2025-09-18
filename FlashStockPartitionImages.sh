#!/bin/bash

# This script automates flashing firmware on the Xiaomi Redmi Note 10S Android device using fastboot.
# The Commands are obtained from the LineageOS Install Wiki for Lineage22.2
# It is designed for use with Git Bash on a Windows development environment.

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Pre-execution checks ---

# Check if fastboot is in the system's PATH.
if ! command -v fastboot &> /dev/null
then
    echo "Error: fastboot command not found."
    echo "Please ensure the Android Platform Tools are in your system's PATH."
    exit 1
fi

# --- User confirmation ---

echo "This script will flash firmware to your device using fastboot."
echo "Please ensure the device is in bootloader/fastboot mode."
read -p "Do you wish to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Operation cancelled by user."
    exit 1
fi

# --- Flashing commands ---

echo "Starting firmware flash..."

# Flash partition 'a' images
echo "Flashing partitions to slot 'a'..."
fastboot flash audio_dsp_a audio_dsp.img
fastboot flash cam_vpu1_a cam_vpu1.img
fastboot flash cam_vpu2_a cam_vpu2.img
fastboot flash cam_vpu3_a cam_vpu3.img
fastboot flash gz_a gz.img
fastboot flash lk_a lk.img
fastboot flash md1img_a md1img.img
fastboot flash preloader_a preloader_raw.img
fastboot flash scp_a scp.img
fastboot flash spmfw_a spmfw.img
fastboot flash sspm_a sspm.img
fastboot flash tee_a tee.img

# Flash partition 'b' images
echo "Flashing partitions to slot 'b'..."
fastboot flash audio_dsp_b audio_dsp.img
fastboot flash cam_vpu1_b cam_vpu1.img
fastboot flash cam_vpu2_b cam_vpu2.img
fastboot flash cam_vpu3_b cam_vpu3.img
fastboot flash gz_b gz.img
fastboot flash lk_b lk.img
fastboot flash md1img_b md1img.img
fastboot flash preloader_b preloader_raw.img
fastboot flash scp_b scp.img
fastboot flash spmfw_b spmfw.img
fastboot flash sspm_b sspm.img
fastboot flash tee_b tee.img

# --- Final step ---

echo "Firmware flash complete. Reboot the device using"
echo "fastboot reboot"

echo "Script finished."
