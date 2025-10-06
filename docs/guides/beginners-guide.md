# 📖 Beginner's Guide to ROM Flashing

This guide will help you understand the basics before you start tinkering with your Redmi Note 10S.

## What is ROM Flashing?

Flashing a custom ROM is essentially installing an operating system on your phone, different from the one the device manufacturer shipped with the device or provides via over-the-air updates (usually an Android™️ based OS).
The process is called ROM flashing (Read-Only Memory flashing) since on smartphones, the process involves writing custom software to partitions that are typically not meant to be tampered with.
The complete OS (and any associated firmware) you'll be installing is simply referred to as a ROM.

This allows you to:

- Install different Android™️ versions (newer or older)
- Remove bloatware and improve performance
- Access advanced customization options
- Get the latest security updates
- Get a different Android experience (like "Stock Android" on Google Pixel devices)

**Note:** *Custom ROMs thrive in the Android ecosystem because the platform’s open-source foundation (AOSP) and OEM-unlockable devices allow developers to modify and redistribute system software.

*This flexibility exists because Android was designed as a licensable, open-source OS for hardware manufacturers, giving OEMs and developers broad control over system software. Apple, by contrast, builds both hardware and software (iOS operating system) as a single closed ecosystem, leaving no room for third-party system images.*


## 📱 About Your Device

**Xiaomi Redmi Note 10S**
- **Codename**: rosemary
- **SoC**: MediaTek Helio G95
- **Architecture**: ARM64
- **Android Version**: Ships with Android 11 (MIUI 12.5)
- **Partition Type**: A/B (seamless updates)

## 🚨 Before You Start!

### ⚠️ Risks and Warnings

ROM flashing involves risks:
- **Voided warranty** - Unlocking bootloader voids manufacturer warranty
- **Bricking** - Incorrect flashing can make your phone completely (& in some cases, permanently) unusable
- **Data loss** - All personal data on the device prior will be erased
- **Missing apps** - Some apps may not work once changes are detected on the devices (e.g an unlocked bootloader, root access)
- **OTA updates** - You'll lose official MIUI updates

### ✅ Prerequisites Checklist

Before proceeding, ensure you have:

- [ ] **Backed up all important data** (photos, contacts, apps)
- [ ] **Charged battery to at least 70%**
- [ ] **Stable USB cable** (preferably original)
- [ ] **Windows/Linux/macOS computer**
- [ ] **At least 2 hours of free time**
- [ ] **Basic command line knowledge** (helpful but not required)

## 🛠️ Essential Tools

You'll need these tools installed:

1. **ADB and Fastboot**
   - Android Debug Bridge for device communication
   - Download from [Android Developer Tools](https://developer.android.com/studio/releases/platform-tools)

2. **USB Drivers** 
   *(incomplete)*
   - For Windows: Install Xiaomi USB drivers for 'ADB Bootloader Interface'
   - Linux/macOS: Usually work out of the box

4. **Custom Recovery** (TWRP or OrangeFox)
   - Required for flashing custom ROMs
   - We'll guide you through installation

## 📝 The ROM Flashing Process

Here's what you'll typically do:

1. **Unlock Bootloader** - Allows custom firmware installation
2. **Install Custom Recovery** - TWRP for ROM management
3. **Flash Custom ROM** - Install your chosen ROM
4. **Flash GApps** (optional) - Google services
5. **Root** (optional) - Administrative access

## 🎯 Recommended Learning Path

### Phase 1: Preparation
1. Read this guide fully
2. Check [Prerequisites & Setup](prerequisites.md)
3. Backup your device completely
4. Download necessary files

### Phase 2: Bootloader
1. Follow [Bootloader Unlock Guide](bootloader-unlock.md)
2. Verify unlock status
3. Test basic fastboot commands

### Phase 3: Recovery
1. Install [Custom Recovery](custom-recovery.md)
2. Learn TWRP basics
3. Create NANDroid backup

### Phase 4: ROM Flashing
1. Choose your first ROM (LineageOS recommended for beginners)
2. Follow [Custom ROM Flash Guide](custom-rom-flash.md)
3. Set up your new ROM

## 🔍 Choosing a ROM

For Rosemary (and most devices really), official support from well established communities isn't allways guaranteed. However, unofficial builds can and often are just as stable. [XDA developers](https://www.xda-developers.com/) is a starting point. 

*sourceforge has been a popular hosting platform for the actual ROM files.*

Some of the well known projects that have supported Rosemary (Official & Unofficial Builds) include:

| Project | Details |
|---------|---------|
| 🥇 **LineageOS**| Stable, close to stock Android, regular updates |
|  | No Google services by default |
| 🥈 **Pixel Experience** | Google Pixel-like experience, good stability |
|  | May have occasional bugs |
| 🥉 **AxionOS** | Good customization options, stable |
|  | Smaller community |
| 🥈 **Evolution-X** | Lots of Features, Derived from Lineage |
|  | tested builds had major bugs, but overall stable |

## 📚 Glossary of Essential Terms

- **Bootloader**: Low-level software that loads the Android Operating system
- **Recovery**: Special mode for system maintenance
- **Fastboot**: Protocol for communicating with bootloader, Special mode for altering bootloader behaviour
- **ADB**: Android Debug Bridge Tool developed by Google for device communication
- **NANDroid**: Complete system backup, a 'mirror image' of all partitions
- **Wipe**: Clearing data/cache partitions
- **Flash**: Installing firmware/ROMs
- **Stock**: Original manufacturer software (including user apps, system apps, operating system/skin, low level firmware)


## ✅ Next Steps 
*(coming soon)*
You might want to:

1. 📋 Go to [Prerequisites & Setup](prerequisites.md)
2. 🔓 Follow [Bootloader Unlock Guide](bootloader-unlock.md)
3. 🛠️ Install [Custom Recovery](custom-recovery.md)
4. 💾 Flash your [First Custom ROM](custom-rom-flash.md)

---

*Take your time, read carefully, and don't rush. Happy flashing! 🎉*
