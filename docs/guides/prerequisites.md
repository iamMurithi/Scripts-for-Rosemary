# 🔧 Prerequisites & Setup

This guide will help you prepare your PC and device for ROM flashing.

## 💻 Computer Requirements

### Minimum System Requirements
- **OS**: Windows, MacOS , or Linux
- **Storage**: 15GB free space for tools and ROM files, 25GB recommended
- **USB Port**: USB 2.0 or 3.0

### ⚡ Hardware Checklist
- [ ] **Quality USB Cable**: Use original or decent third-party (A faulty cable might cause an operation to fail!!!)
- [ ] **Stable Power Supply**: Ensure your PC is plugged (prefferably use a laptop)
- [ ] **Backup Storage**: External drive or cloud storage

## 📱 Device Preparation

### 🔋 Battery and Power
- [ ] **Charge to 60%+**: Critical to prevent shutdown during flashing
- [ ] **Close unnecessary apps**: Free up system resources

### 🔓 Developer Settings
1. **Enable Developer Options**:
   - Go to `Settings` > `About phone`
   - Tap `MIUI version` 7 times
   - You'll see "You are now a developer!"

2. **Enable USB Debugging**:
   - Go to `Settings` > `Additional settings` > `Developer options`
   - Enable `USB debugging`
   - Enable `USB debugging (Security settings)`

3. **Enable OEM Unlocking**:
   - In Developer options, enable `OEM unlocking`
   - This allows bootloader modification
   - Set up a Xiaomi Mi account and confirm the log in details (crucial!)

## 🛠️ Software Installation

### For Windows Users

#### 1. ADB and Fastboot Tools
```powershell
# Option 1: Download from Google (Recommended)
# Visit: https://developer.android.com/studio/releases/platform-tools
# Extract to C:\adb\

# Option 2: Using Chocolatey
choco install adb

# Option 3: Using Scoop
scoop install adb
```

#### 2. USB Drivers
```powershell
# Download Xiaomi USB Drivers
# Visit: https://developer.android.com/studio/run/win-usb
# Or install Mi USB Driver from Xiaomi
```

#### 3. Verify Installation
```cmd
# Open Command Prompt and test
adb version
fastboot --version
```

### For macOS Users

#### 1. Install Homebrew (if not installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. Install ADB and Fastboot
```bash
# Using Homebrew
brew install android-platform-tools

# Verify installation
adb version
fastboot --version
```

#### 3. USB Drivers
macOS usually recognizes Android devices automatically. If issues occur:
```bash
# Install Android File Transfer
# Download from: https://www.android.com/filetransfer/
```

### For Linux Users

#### Ubuntu/Debian
```bash
# Update package list
sudo apt update

# Install ADB and Fastboot
sudo apt install android-tools-adb android-tools-fastboot

# Add user to plugdev group
sudo usermod -a -G plugdev $USER

# Create udev rules for device recognition
sudo wget -S -O - https://raw.githubusercontent.com/M0Rf30/android-udev-rules/main/51-android.rules | sudo tee >/dev/null /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
```

#### Arch Linux
```bash
# Install from official repositories
sudo pacman -S android-tools

# Or using AUR
yay -S android-udev
```

#### Fedora/CentOS
```bash
# Install from repositories
sudo dnf install android-tools

# Verify installation
adb version
fastboot --version
```

## 🔌 Device Connection Test

### 1. Test ADB Connection
```bash
# Connect device with USB debugging enabled
adb devices

# Expected output:
# List of devices attached
# XXXXXXXXXX    device
```

### 2. Test Fastboot Connection
```bash
# Boot device to fastboot mode
# Method 1: Using ADB
adb reboot bootloader

# Method 2: Hardware buttons
# Power off device, then hold Power + Volume Down

# Test fastboot connection
fastboot devices

# Expected output:
# XXXXXXXXXX    fastboot
```

## 📁 File Organization

Create a dedicated folder structure:

```
ROM_Flashing/
├── tools/
│   ├── adb/
│   └── fastboot/
├── roms/
│   ├── stock/
│   ├── custom/
│   └── recovery/
├── backups/
└── drivers/
```

## 🔐 Account Preparation

### Mi Account Requirements
1. **Sign up for Mi Account**: https://account.xiaomi.com/
2. **Add device to account**: Go to `Settings` > `Mi Account` > Sign in
3. **Wait period**: Some accountts require 7-day wait after the device to allow bootloader unlock, some weeks even months!
4. **Unlock tool**: For Rosemary, you generally only need to donwload the latest Xiaomi unlock tool
   
## 📋 Pre-Flash Checklist

Before starting the flashing process:

### Device Checklist
- [ ] ✅ Battery charged 70%+
- [ ] ✅ USB debugging enabled
- [ ] ✅ OEM unlocking enabled
- [ ] ✅ Device recognized by ADB
- [ ] ✅ Device recognized by Fastboot
- [ ] ✅ All important data backed up

### Computer Checklist
- [ ] ✅ ADB and Fastboot installed
- [ ] ✅ USB drivers installed (Windows)
- [ ] ✅ Stable internet connection
- [ ] ✅ Antivirus temporarily disabled
- [ ] ✅ ROM files downloaded
- [ ] ✅ Recovery image downloaded

### Safety Checklist
- [ ] ✅ Read all documentation
- [ ] ✅ Understand the risks
- [ ] ✅ Have emergency contact/support
- [ ] ✅ Know how to enter download mode
- [ ] ✅ Have stock ROM file as backup

## 🚨 Common Issues and Solutions

### Issue: Device Not Recognized
**Solution**:
1. Try different USB cable
2. Use different USB port (preferably USB 2.0)
3. Reinstall drivers (Windows)
4. Enable USB debugging again
5. Revoke USB debugging authorizations and re-enable

### Issue: Fastboot Not Working
**Solution**:
1. Check if bootloader is unlocked
2. Use original USB cable
3. Try different computer
4. Boot to fastboot manually (Power + Volume Down)

### Issue: ADB Unauthorized
**Solution**:
1. Check phone screen for authorization dialog
2. Tap "Always allow from this computer"
3. If no dialog appears, revoke authorizations in Developer options

## ✅ Next Steps

Once you've completed all prerequisites:

1. 📖 Review the [Beginner's Guide](beginners-guide.md) if you haven't
2. 🔓 Proceed to [Bootloader Unlock](bootloader-unlock.md)
3. 🛠️ Install [Custom Recovery](custom-recovery.md)
4. 💾 Flash your [Custom ROM](custom-rom-flash.md)

---

*Take your time with setup - proper preparation prevents problems!*
