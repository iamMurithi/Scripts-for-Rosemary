# 🚨 Common Issues & Troubleshooting Guide

This comprehensive guide covers the most common problems encountered when flashing ROMs on the Redmi Note 10S and their solutions.

## 🔧 Pre-Flash Issues

### Issue: ADB Device Not Recognized

#### Symptoms
- `adb devices` shows empty list
- Device not detected by computer
- "Device not found" errors

#### Solutions
1. **Enable USB Debugging**
   ```
   Settings → About phone → Tap MIUI version 7 times
   Settings → Additional settings → Developer options → USB debugging
   ```

2. **Install Proper Drivers** (Windows)
   - Download Xiaomi USB drivers
   - Install Universal ADB drivers
   - Try different USB ports (prefer USB 2.0)

3. **Check USB Cable**
   - Use original Xiaomi cable
   - Try different cables
   - Ensure cable supports data transfer

4. **Revoke and Re-authorize**
   ```bash
   # In Developer options
   Settings → Developer options → Revoke USB debugging authorizations
   # Reconnect device and allow authorization
   ```

### Issue: Fastboot Device Not Recognized

#### Symptoms
- `fastboot devices` shows empty list
- Device stuck in fastboot mode
- Computer doesn't detect fastboot device

#### Solutions
1. **Manual Fastboot Entry**
   ```
   Power off device completely
   Hold Power + Volume Down for 10 seconds
   Release when fastboot screen appears
   ```

2. **Driver Issues** (Windows)
   ```
   Device Manager → Find Android device with yellow warning
   Right-click → Update driver → Browse computer
   Select fastboot driver from Android SDK
   ```

3. **Try Different USB Port**
   - Use USB 2.0 ports instead of USB 3.0
   - Try different cables
   - Connect directly to computer (not hub)

### Issue: Bootloader Won't Unlock

#### Symptoms
- Mi Unlock Tool shows "Device not supported"
- "Unlocking is not allowed" error
- Unable to get unlock permission

#### Solutions
1. **Wait Period**
   - New Mi accounts require 7-day wait
   - Some regions have longer wait times
   - Check unlock status on Mi website

2. **Account Verification**
   ```
   Ensure device is added to Mi account
   Settings → Mi Account → Sign in
   Verify phone number and identity
   ```

3. **MIUI Version**
   - Use latest stable MIUI version
   - Some developer versions block unlocking
   - Update MIUI if necessary

## ⚡ Flashing Issues

### Issue: Fastboot Commands Fail

#### Symptoms
- "FAILED (remote: xxx)" errors
- Commands timeout
- Partition errors

#### Solutions
1. **Check Bootloader Status**
   ```bash
   fastboot getvar unlocked
   # Should return: unlocked: yes
   ```

2. **Verify Device Codename**
   ```bash
   fastboot getvar product
   # Should return: rosemary
   ```

3. **Use Correct Images**
   - Ensure images are for rosemary device
   - Check file integrity (MD5/SHA256)
   - Re-download if corrupted

### Issue: "remote: Flashing is not allowed"

#### Symptoms
- Cannot flash recovery or boot images
- Permission denied errors
- Anti-rollback protection active

#### Solutions
1. **Disable Verified Boot**
   ```bash
   fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
   ```

2. **Flash VBMeta First**
   ```bash
   fastboot flash vbmeta_a vbmeta.img
   fastboot flash vbmeta_b vbmeta.img
   ```

3. **Check Anti-Rollback**
   - Use firmware matching bootloader version
   - Don't downgrade baseband/bootloader
   - Flash complete firmware package

### Issue: Recovery Won't Boot

#### Symptoms
- Black screen after flashing recovery
- Boots to stock recovery instead
- Recovery partition corrupted

#### Solutions
1. **Flash Recovery to Both Slots**
   ```bash
   fastboot flash recovery_a recovery.img
   fastboot flash recovery_b recovery.img
   ```

2. **Use Button Combination**
   ```
   Power off device
   Hold Power + Volume Up until recovery appears
   ```

3. **Try Different Recovery**
   - TWRP official build
   - OrangeFox recovery
   - Ensure correct version for rosemary

## 💾 ROM Installation Issues

### Issue: ROM Won't Boot (Bootloop)

#### Symptoms
- Stuck on boot animation
- Continuous restart cycle
- Never reaches home screen

#### Solutions
1. **Format Data** (In Recovery)
   ```
   TWRP → Wipe → Format Data → Type "yes"
   ```

2. **Clean Flash Process**
   ```
   1. Boot to recovery
   2. Wipe: System, Data, Cache, Dalvik
   3. Flash ROM
   4. Flash GApps (if needed)
   5. Reboot system
   ```

3. **Check Compatibility**
   - Verify ROM is for rosemary
   - Check Android version compatibility
   - Use matching recovery version

### Issue: Stuck at Logo/Animation

#### Symptoms
- Phone shows logo but doesn't boot
- Animation loops indefinitely
- No response to touch

#### Solutions
1. **Wait Longer**
   - First boot can take 10-15 minutes
   - Be patient, especially on older/slower storage

2. **Factory Reset**
   ```
   Boot to recovery → Factory Reset
   Or in fastboot:
   fastboot -w
   ```

3. **Re-flash ROM**
   - Download fresh ROM file
   - Verify checksum
   - Perform clean flash

### Issue: No Service/Signal

#### Symptoms
- "No service" or "Emergency calls only"
- Cannot connect to mobile network
- SIM not detected

#### Solutions
1. **Flash Correct Firmware**
   - Use firmware matching your region
   - Flash modem/baseband separately if needed
   
2. **Check APN Settings**
   ```
   Settings → Mobile networks → Access Point Names
   Add/modify APN for your carrier
   ```

3. **Flash Radio/Modem**
   ```bash
   fastboot flash modem_a modem.img
   fastboot flash modem_b modem.img
   ```

## 🔄 Recovery Issues

### Issue: TWRP Touch Not Working

#### Symptoms
- Recovery loads but touch doesn't respond
- Can only navigate with hardware buttons
- Screen rotation issues

#### Solutions
1. **Use ADB Commands**
   ```bash
   adb shell input tap X Y  # Simulate touch
   adb shell input swipe x1 y1 x2 y2  # Simulate swipe
   ```

2. **Try Different Recovery**
   - Flash OrangeFox recovery
   - Use different TWRP version
   - Check for rosemary-specific builds

3. **Hardware Button Navigation**
   - Volume Up/Down: Navigate
   - Power: Select
   - Learn button combinations for your recovery

### Issue: Cannot Mount Storage

#### Symptoms
- "Failed to mount /data" errors
- Storage not accessible in recovery
- Cannot backup or restore

#### Solutions
1. **Decrypt Data Partition**
   ```
   In TWRP: Mount → Decrypt Data
   Enter lock screen password/PIN
   ```

2. **Format Data Partition**
   ```
   TWRP → Wipe → Format Data → Type "yes"
   Warning: This erases all data!
   ```

3. **Fix File System**
   ```bash
   # In recovery terminal or ADB
   e2fsck -f -y /dev/block/by-name/userdata
   ```

## 📶 Connectivity Issues

### Issue: WiFi Not Working

#### Symptoms
- Cannot connect to WiFi networks
- WiFi option grayed out
- "WiFi error" messages

#### Solutions
1. **Reset Network Settings**
   ```
   Settings → System → Reset options → Reset network settings
   ```

2. **Flash WiFi Firmware**
   - May need region-specific firmware
   - Flash complete firmware package

3. **Check ROM Support**
   - Some ROMs have WiFi issues initially
   - Check ROM thread for known issues
   - Wait for ROM updates

### Issue: Bluetooth Problems

#### Symptoms
- Bluetooth won't turn on
- Cannot pair devices
- Audio issues with Bluetooth

#### Solutions
1. **Clear Bluetooth Cache**
   ```
   Settings → Apps → Bluetooth → Storage → Clear Cache
   ```

2. **Reset Bluetooth Module**
   ```bash
   # In terminal or ADB
   su
   echo 1 > /sys/kernel/debug/bluetooth/reset_bluetooth
   ```

## 🔌 Hardware Issues

### Issue: Charging Problems

#### Symptoms
- Device won't charge
- Slow charging only
- Battery percentage incorrect

#### Solutions
1. **Check Cable and Charger**
   - Use original Xiaomi charger (33W)
   - Try different cables
   - Clean charging port

2. **Battery Calibration**
   ```
   Drain battery to 0%
   Charge to 100% without interruption
   Repeat 2-3 times
   ```

3. **Flash Stock Firmware**
   - Some custom ROMs have charging issues
   - Test with stock MIUI first

### Issue: Camera Not Working

#### Symptoms
- Camera app crashes
- Black screen in camera
- Flash/focus not working

#### Solutions
1. **Clear Camera Cache**
   ```
   Settings → Apps → Camera → Storage → Clear Cache & Data
   ```

2. **Check ROM Compatibility**
   - Some ROMs need camera fixes
   - Flash camera patches if available
   - Use Open Camera as alternative

3. **Permissions Check**
   ```
   Settings → Apps → Camera → Permissions
   Ensure all camera permissions enabled
   ```

## 🆘 Emergency Recovery

### Issue: Hard Brick (Device Won't Turn On)

#### Symptoms
- No response to power button
- Black screen, no LED
- Computer doesn't detect device

#### Solutions
1. **Force Restart**
   ```
   Hold Power + Volume Down for 30 seconds
   Try different button combinations
   ```

2. **Deep Flash Cable** (Advanced)
   - Requires special cable and software
   - Contact service center if under warranty

3. **EDL Mode** (Last Resort)
   ```
   Requires:
   - EDL cable or test points
   - MiFlash tool
   - Authorized Mi account
   - Stock fastboot ROM
   ```

### Issue: Soft Brick (Fastboot Only)

#### Symptoms
- Only boots to fastboot mode
- Cannot boot system or recovery
- Fastboot commands work

#### Solutions
1. **Flash Stock Firmware**
   ```bash
   # Download stock fastboot ROM
   # Extract and run flash_all.bat (Windows) or flash_all.sh (Linux)
   ```

2. **Manual Partition Flash**
   ```bash
   fastboot flash boot boot.img
   fastboot flash recovery recovery.img
   fastboot flash system system.img
   fastboot flash vendor vendor.img
   ```

## 📞 Getting Help

### Before Asking for Help
1. **Search existing solutions** in this guide
2. **Check XDA forums** for similar issues  
3. **Look at ROM-specific threads** for known bugs
4. **Try basic troubleshooting** first

### When Asking for Help
Include this information:
- Device model and codename
- Current ROM and version
- Recovery version (TWRP/OrangeFox)
- Exact error messages
- Steps that led to the issue
- What you've already tried

### Community Resources
- [XDA Redmi Note 10S Forum](https://forum.xda-developers.com/f/redmi-note-10s.12153/)
- [GitHub Issues](../../../issues)
- [GitHub Discussions](../../../discussions)
- Telegram groups for rosemary

---

**Remember**: Most issues can be resolved with patience and following proper procedures. Don't panic!

*Happy troubleshooting! 🔧*