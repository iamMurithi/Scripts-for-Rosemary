# 🛠️ Scripts & Tools

This directory contains automation scripts and utilities for ROM flashing and device management.

## 📁 Directory Structure

### ⚡ Flashing Scripts
Automated firmware flashing tools:
- [LineageOS Flash Script](flashing/flash_lineage_firmware.sh) - Automated LineageOS installation
- **Coming Soon**: Other ROM-specific flashing scripts

### 🔧 Tools
Helper utilities and automation:
- **Coming Soon**: Device validation tools, backup scripts, ROM managers

### 🤖 Automation
Setup and validation scripts:
- **Coming Soon**: Environment setup, dependency installation, health checks

## 🚀 Quick Start

### 🔥 Flash LineageOS
```bash
# Make script executable
chmod +x flashing/flash_lineage_firmware.sh

# Run the script (requires unlocked bootloader)
./flashing/flash_lineage_firmware.sh
```

### ⚠️ Important Notes
- **Always backup** your device before running scripts
- **Verify bootloader unlock** status first
- **Read script documentation** before execution
- **Have stock firmware** ready for emergencies

## 📋 Script Features

### Safety Features
- ✅ Device verification and validation
- ✅ Bootloader unlock status checking
- ✅ Automatic backup creation
- ✅ Error handling and recovery
- ✅ Step-by-step confirmation prompts

### Automation Benefits
- 🚀 Faster flashing process
- 🎯 Reduced human error
- 📝 Detailed logging
- 🔄 Consistent results
- 🛡️ Built-in safety checks

## 🔧 Requirements

### System Requirements
- **OS**: Windows 10+, macOS 10.15+, or Linux
- **Tools**: ADB, Fastboot, device drivers
- **Device**: Unlocked bootloader, USB debugging enabled
- **Storage**: 10GB+ free space

### Dependencies
Check [Prerequisites Guide](../docs/guides/prerequisites.md) for detailed setup instructions.

## 🆘 Need Help?

### Script Issues
1. Check [Troubleshooting Guide](../docs/troubleshooting/common-issues.md)
2. Verify your setup meets requirements
3. Run with verbose output for debugging
4. Ask in [GitHub Discussions](../../discussions)

### Safety Tips
- **Never interrupt** flashing process
- **Keep device charged** 70%+
- **Use original cables** when possible
- **Have recovery plan** ready

---

*Automate safely, flash confidently! 🚀*