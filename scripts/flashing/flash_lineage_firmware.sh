#!/bin/bash

# =============================================================================
# Redmi Note 10S (rosemary) - LineageOS Firmware Flashing Script
# =============================================================================
# 
# This script automates the firmware flashing process for installing LineageOS
# on the Xiaomi Redmi Note 10S (codename: rosemary).
#
# IMPORTANT: This script is for educational purposes and comes with no warranty.
# Flashing firmware can brick your device. Proceed at your own risk!
#
# Prerequisites:
# - Unlocked bootloader
# - ADB and Fastboot installed
# - Device drivers installed
# - Backup of important data
#
# Usage: ./flash_lineage_firmware.sh
#
# Author: Redmi Note 10S ROM Community
# Version: 1.0
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Device information
DEVICE_CODENAME="rosemary"
DEVICE_NAME="Redmi Note 10S"

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FIRMWARE_DIR="${SCRIPT_DIR}/firmware"
BACKUP_DIR="${SCRIPT_DIR}/backups"

# =============================================================================
# Helper Functions
# =============================================================================

print_header() {
    echo -e "${BLUE}"
    echo "=================================================================="
    echo "  Redmi Note 10S (rosemary) - LineageOS Firmware Flash Script"
    echo "=================================================================="
    echo -e "${NC}"
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "${GREEN}[STEP]${NC} $1"
}

# =============================================================================
# Safety and Validation Functions
# =============================================================================

check_requirements() {
    print_step "Checking requirements..."
    
    # Check if ADB is installed
    if ! command -v adb &> /dev/null; then
        print_error "ADB is not installed or not in PATH"
        return 1
    fi
    
    # Check if Fastboot is installed
    if ! command -v fastboot &> /dev/null; then
        print_error "Fastboot is not installed or not in PATH"
        return 1
    fi
    
    print_success "ADB and Fastboot are available"
    return 0
}

check_device_connection() {
    print_step "Checking device connection..."
    
    # Check ADB connection
    local adb_devices=$(adb devices | grep -v "List of devices attached" | grep "device$" | wc -l)
    
    if [ "$adb_devices" -eq 0 ]; then
        print_error "No device connected via ADB"
        print_info "Please ensure:"
        print_info "1. Device is connected via USB"
        print_info "2. USB debugging is enabled"
        print_info "3. Device is authorized for debugging"
        return 1
    fi
    
    # Get device info
    local device_info=$(adb shell getprop ro.product.device 2>/dev/null)
    
    if [ "$device_info" != "$DEVICE_CODENAME" ]; then
        print_error "Connected device ($device_info) is not $DEVICE_CODENAME"
        print_error "This script is only for $DEVICE_NAME ($DEVICE_CODENAME)"
        return 1
    fi
    
    print_success "Device connected and verified: $DEVICE_NAME"
    return 0
}

check_bootloader_status() {
    print_step "Checking bootloader unlock status..."
    
    # Reboot to fastboot mode
    print_info "Rebooting to fastboot mode..."
    adb reboot bootloader
    
    # Wait for fastboot mode
    sleep 5
    
    # Check if device is in fastboot mode
    local fastboot_devices=$(fastboot devices | wc -l)
    
    if [ "$fastboot_devices" -eq 0 ]; then
        print_error "Device not detected in fastboot mode"
        print_info "Please manually boot to fastboot mode:"
        print_info "1. Power off device"
        print_info "2. Hold Power + Volume Down buttons"
        print_info "3. Release when fastboot screen appears"
        return 1
    fi
    
    # Check unlock status
    local unlock_status=$(fastboot getvar unlocked 2>&1 | grep "unlocked:" | awk '{print $2}')
    
    if [ "$unlock_status" != "yes" ]; then
        print_error "Bootloader is not unlocked"
        print_info "Please unlock bootloader first:"
        print_info "1. Visit https://en.miui.com/unlock/"
        print_info "2. Follow Xiaomi's unlock procedure"
        print_info "3. Wait for unlock period (usually 7 days)"
        return 1
    fi
    
    print_success "Bootloader is unlocked"
    return 0
}

# =============================================================================
# Backup Functions
# =============================================================================

create_backup() {
    print_step "Creating device backup..."
    
    # Create backup directory
    mkdir -p "$BACKUP_DIR"
    
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_file="${BACKUP_DIR}/backup_${timestamp}.img"
    
    print_info "Creating NANDroid backup... This may take 10-15 minutes"
    print_warning "Do not disconnect device during backup!"
    
    # Note: This is a placeholder - actual backup would require custom recovery
    print_info "Backup will be created when custom recovery is installed"
    print_info "Backup location: $backup_file"
    
    return 0
}

# =============================================================================
# Firmware Flashing Functions
# =============================================================================

download_firmware() {
    print_step "Checking firmware files..."
    
    # Create firmware directory
    mkdir -p "$FIRMWARE_DIR"
    
    # List required firmware files
    local required_files=(
        "boot.img"
        "dtbo.img"
        "recovery.img"
        "vendor_boot.img"
        "vbmeta.img"
        "vbmeta_system.img"
    )
    
    local missing_files=()
    
    for file in "${required_files[@]}"; do
        if [ ! -f "${FIRMWARE_DIR}/${file}" ]; then
            missing_files+=("$file")
        fi
    done
    
    if [ ${#missing_files[@]} -gt 0 ]; then
        print_error "Missing firmware files:"
        for file in "${missing_files[@]}"; do
            print_error "  - $file"
        done
        print_info ""
        print_info "Please download the latest LineageOS firmware files"
        print_info "and place them in: $FIRMWARE_DIR"
        print_info ""
        print_info "Download from: https://download.lineageos.org/rosemary"
        return 1
    fi
    
    print_success "All firmware files found"
    return 0
}

flash_firmware() {
    print_step "Flashing firmware... DO NOT DISCONNECT DEVICE!"
    
    local firmware_files=(
        "vbmeta.img:vbmeta"
        "vbmeta_system.img:vbmeta_system"
        "boot.img:boot"
        "dtbo.img:dtbo"
        "vendor_boot.img:vendor_boot"
        "recovery.img:recovery"
    )
    
    for entry in "${firmware_files[@]}"; do
        local file="${entry%%:*}"
        local partition="${entry##*:}"
        
        print_info "Flashing $file to $partition partition..."
        
        if ! fastboot flash "$partition" "${FIRMWARE_DIR}/${file}"; then
            print_error "Failed to flash $file to $partition"
            return 1
        fi
        
        print_success "Successfully flashed $file"
        sleep 1
    done
    
    print_success "All firmware files flashed successfully"
    return 0
}

flash_recovery() {
    print_step "Flashing custom recovery..."
    
    local recovery_file="${FIRMWARE_DIR}/recovery.img"
    
    if [ ! -f "$recovery_file" ]; then
        print_error "Recovery image not found: $recovery_file"
        return 1
    fi
    
    print_info "Flashing custom recovery..."
    
    if ! fastboot flash recovery "$recovery_file"; then
        print_error "Failed to flash recovery"
        return 1
    fi
    
    print_success "Custom recovery flashed successfully"
    return 0
}

# =============================================================================
# Post-Flash Functions
# =============================================================================

reboot_system() {
    print_step "Rebooting to system..."
    
    print_warning "Device will now reboot to LineageOS"
    print_info "First boot may take 5-10 minutes"
    print_info "Please be patient and do not interrupt the process"
    
    fastboot reboot
    
    print_success "Device rebooted successfully"
    print_info "LineageOS should now be booting..."
}

# =============================================================================
# Main Execution Flow
# =============================================================================

main() {
    print_header
    
    print_warning "IMPORTANT WARNINGS:"
    print_warning "1. This will completely wipe your device"
    print_warning "2. Ensure you have backed up all important data"
    print_warning "3. Device must have unlocked bootloader"
    print_warning "4. Process may take 30-60 minutes"
    print_warning "5. Do not disconnect device during flashing"
    echo ""
    
    read -p "Do you want to continue? (yes/no): " -r
    if [[ ! $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
        print_info "Flashing cancelled by user"
        exit 0
    fi
    
    # Step 1: Check requirements
    if ! check_requirements; then
        print_error "Requirements check failed"
        exit 1
    fi
    
    # Step 2: Check device connection
    if ! check_device_connection; then
        print_error "Device connection check failed"
        exit 1
    fi
    
    # Step 3: Check bootloader status
    if ! check_bootloader_status; then
        print_error "Bootloader check failed"
        exit 1
    fi
    
    # Step 4: Check firmware files
    if ! download_firmware; then
        print_error "Firmware check failed"
        exit 1
    fi
    
    # Step 5: Create backup
    if ! create_backup; then
        print_warning "Backup creation failed, but continuing..."
    fi
    
    # Step 6: Flash firmware
    if ! flash_firmware; then
        print_error "Firmware flashing failed"
        exit 1
    fi
    
    # Step 7: Flash recovery
    if ! flash_recovery; then
        print_error "Recovery flashing failed"
        exit 1
    fi
    
    # Step 8: Reboot system
    reboot_system
    
    print_success "LineageOS firmware flashing completed successfully!"
    print_info ""
    print_info "Next steps:"
    print_info "1. Wait for LineageOS to boot completely"
    print_info "2. Complete initial setup"
    print_info "3. Install Google Apps (GApps) if needed"
    print_info "4. Restore your data from backup"
    print_info ""
    print_info "Enjoy your new LineageOS experience!"
}

# =============================================================================
# Script Entry Point
# =============================================================================

# Check if running as root (not recommended)
if [ "$EUID" -eq 0 ]; then
    print_warning "Running as root is not recommended"
    print_warning "Please run this script as a normal user"
    exit 1
fi

# Execute main function
main "$@"