# 📱 Xiaomi Redmi Note 10S - Complete Device Specifications

## 🏷️ Basic Information

| Specification | Details |
|---------------|---------|
| **Model Name** | Xiaomi Redmi Note 10S |
| **Codename** | rosemary |
| **Release Date** | March 2021 |
| **Official Price** | ~$200 USD (at launch) |
| **Availability** | Global markets |

## 🖥️ Display

| Feature | Specification |
|---------|---------------|
| **Size** | 6.43 inches |
| **Type** | AMOLED |
| **Resolution** | 1080 x 2400 pixels |
| **Pixel Density** | 409 PPI |
| **Aspect Ratio** | 20:9 |
| **Refresh Rate** | 60Hz |
| **Protection** | Corning Gorilla Glass 3 |
| **Brightness** | 1100 nits (peak) |
| **Color Gamut** | DCI-P3 |

## ⚙️ Performance

### System on Chip (SoC)
| Component | Specification |
|-----------|---------------|
| **Chipset** | MediaTek Helio G95 |
| **Process** | 12nm FinFET |
| **CPU** | Octa-core (2x2.05 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55) |
| **GPU** | Mali-G76 MC4 |
| **AI** | MediaTek APU |

### Memory & Storage
| Variant | RAM | Storage | Availability |
|---------|-----|---------|--------------|
| **Base** | 6GB LPDDR4X | 64GB UFS 2.2 | Global |
| **Mid** | 6GB LPDDR4X | 128GB UFS 2.2 | Global |
| **High** | 8GB LPDDR4X | 128GB UFS 2.2 | Select markets |

| Feature | Details |
|---------|---------|
| **Expandable Storage** | microSD up to 1TB |
| **RAM Technology** | LPDDR4X |
| **Storage Type** | UFS 2.2 |

## 📷 Camera System

### Rear Camera (Quad Setup)
| Camera | Specification |
|--------|---------------|
| **Main** | 64MP, f/1.8, 26mm (wide), 1/1.97", 0.7µm, PDAF |
| **Ultra-wide** | 8MP, f/2.2, 118˚, 1/4.0", 1.12µm |
| **Macro** | 2MP, f/2.4 |
| **Depth** | 2MP, f/2.4 |

#### Video Recording
- **4K**: 30fps
- **1080p**: 30/60fps
- **720p**: 30fps
- **Features**: Gyro-EIS, HDR

### Front Camera
| Feature | Specification |
|---------|---------------|
| **Resolution** | 13MP, f/2.4, (wide), 1/3.06", 1.12µm |
| **Video** | 1080p@30fps |
| **Features** | HDR |

## 🔋 Battery & Charging

| Feature | Specification |
|---------|---------------|
| **Capacity** | 5000 mAh (Li-Po, non-removable) |
| **Fast Charging** | 33W wired |
| **Wireless Charging** | No |
| **Reverse Charging** | No |
| **Charging Port** | USB Type-C |
| **Charging Time** | 0-100% in ~74 minutes |

## 🌐 Connectivity

### Network
| Technology | Support |
|------------|---------|
| **2G** | GSM 850/900/1800/1900 |
| **3G** | HSDPA 850/900/1700(AWS)/1900/2100 |
| **4G** | LTE bands 1,2,3,4,5,7,8,12,17,20,28,38,40,41 |
| **5G** | No |

### Wireless
| Feature | Specification |
|---------|---------------|
| **Wi-Fi** | 802.11 a/b/g/n/ac, dual band, Wi-Fi Direct, hotspot |
| **Bluetooth** | 5.0, A2DP, LE |
| **GPS** | Yes, with A-GPS, GLONASS, BDS, GALILEO |
| **NFC** | Yes (market dependent) |
| **IR Blaster** | Yes |

## 🔊 Audio & Multimedia

| Feature | Specification |
|---------|---------------|
| **Speakers** | Mono speaker |
| **3.5mm Jack** | Yes |
| **Audio Quality** | 24-bit/192kHz audio |
| **Dolby Atmos** | Yes |
| **Hi-Res Audio** | Yes |

## 🛡️ Security & Sensors

### Biometric Security
- **Fingerprint**: Side-mounted, capacitive
- **Face Unlock**: Yes (software-based)

### Sensors
- Accelerometer
- Gyro
- Proximity
- Compass
- Ambient light sensor
- Fingerprint (side-mounted)

## 📏 Physical Dimensions

| Measurement | Value |
|-------------|-------|
| **Dimensions** | 160.5 x 74.5 x 8.3 mm |
| **Weight** | 178.8g |
| **Build** | Glass front (Gorilla Glass 3), plastic frame, plastic back |
| **Colors** | Ocean Blue, Onyx Gray, Pebble White |
| **SIM** | Hybrid Dual SIM (Nano-SIM, dual stand-by) |

## 🖲️ Software

### Android Version
| Feature | Details |
|---------|---------|
| **Launch Android** | Android 11 |
| **UI** | MIUI 12.5 |
| **Security Patch** | Regular updates |
| **Android One** | No |

### Custom ROM Compatibility
| ROM Type | Support Level |
|----------|---------------|
| **LineageOS** | ✅ Official support |
| **Pixel Experience** | ✅ Active development |
| **ArrowOS** | ✅ Available |
| **Evolution X** | ✅ Available |
| **HavocOS** | ✅ Available |
| **Paranoid Android** | ⚠️ Limited |

## 🔧 Developer Information

### Technical Details
| Feature | Value |
|---------|-------|
| **Architecture** | ARM64-v8a |
| **Kernel Version** | 4.14.x |
| **Partition Scheme** | A/B (seamless updates) |
| **Treble Support** | Yes |
| **System-as-root** | Yes |
| **AVB** | Yes |
| **Verified Boot** | 2.0 |

### Partition Layout
| Partition | Size | Purpose |
|-----------|------|---------|
| **Boot** | 67MB | Kernel and ramdisk |
| **System** | ~3GB | Android system |
| **Vendor** | ~1GB | Vendor-specific files |
| **Product** | ~500MB | Product-specific overlays |
| **Userdata** | Variable | User data and apps |

### Fastboot Commands
```bash
# Check current slot
fastboot getvar current-slot

# Switch slots (A/B device)
fastboot set_active a  # or b

# Check unlock status
fastboot getvar unlocked

# Flash boot (recovery)
fastboot flash boot boot.img
```

## 📊 Benchmark Scores

### AnTuTu v9
- **Overall**: ~350,000
- **CPU**: ~120,000
- **GPU**: ~85,000
- **Memory**: ~75,000
- **UX**: ~70,000

### Geekbench 5
- **Single-core**: ~500
- **Multi-core**: ~1,500

### Gaming Performance
| Game | Settings | FPS |
|------|----------|-----|
| **PUBG Mobile** | HD + High | 40fps |
| **Call of Duty Mobile** | High | 45fps |
| **Genshin Impact** | Medium | 35fps |

## 🌟 Strengths & Weaknesses

### ✅ Strengths
- Excellent AMOLED display
- Great battery life (5000mAh)
- Good camera performance for price
- Fast 33W charging
- Active custom ROM community
- Affordable pricing

### ❌ Weaknesses
- No 5G support
- Plastic build quality
- MIUI can be heavy
- MediaTek chipset (limited custom kernel support)
- No wireless charging
- Mono speaker only

## 🛠️ ROM Development Status

### Bootloader
- **Unlock Status**: Officially supported by Xiaomi
- **Unlock Method**: Mi Unlock Tool
- **Wait Time**: 7 days for new accounts

### Recovery Support
| Recovery | Status | Notes |
|----------|--------|-------|
| **TWRP** | ❌ Unofficial | |
| **OrangeFox** | ❌ Unofficial | Sufficient Features |
| **PitchBlack** | ❌ Untested | |

### Kernel Development
- **Stock Kernel**: MediaTek provided
- **Custom Kernels**: Limited due to MediaTek sources
- **Overclocking**: Not recommended
- **Undervolting**: Limited support

## 📚 Additional Resources

- **XDA Forum**: [Redmi Note 10S Development](https://forum.xda-developers.com/f/redmi-note-10s.12153/)
- **Telegram Groups**: Search for "Redmi Note 10S"
- **GitHub**: Multiple ROM repositories
- **Mi Community**: Official Xiaomi forums

---

*Last updated: September 2025 Current specifications | Sources: Official Xiaomi, GSMArena, community testing*
