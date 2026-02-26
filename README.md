# 🖨️ V-Core 3.1 300 — RepRap Firmware 3.6.1 (Duet 3)

Configuration repository for my **V-Core 3.1 (300 × 300 mm)** based on **RepRap Firmware 3.6.1** running on **Duet 3 Mini 5+ WiFi** and **Duet 3 Toolboard 1LC**.

This repository contains my production-ready `config.g` setup and **OrcaSlicer profiles**.

---

## 🧰 System Overview

| Category | Component |
|------------|------------|
| 🖨️ Printer | V-Core 3.1 – 300 × 300 mm |
| 🧠 Mainboard | Duet 3 Mini 5+ WiFi |
| 🔌 Toolboard | Duet 3 Toolboard 1LC |
| 📟 Display | PanelDue 7i |
| 🔥 Hotend | E3D Revo Voron |
| 🌡️ Thermistor | Semitec 104NT-4-R025H42G |
| 🧲 Z Probe | super P.I.N.D.A |
| 🛠️ Extruder | Orbiter V2.0 |
| ⚡ Heated Bed | Keenovo 280 × 280 mm – 600 W |
| 🔁 SSR | Keenovo C-Lin 40A |
| ⚙️ Stepper Motors | LDO-42STH47-2504AC (X/Y/Z) |
| 💾 Firmware | RepRap Firmware 3.6.1 |

---

## 📂 Repository Structure

```text
My_V-Core3/
│
├── My_Config/      → RepRap Firmware configuration files
├── My_Slicers/     → OrcaSlicer profiles
└── README.md
```

---

## ⚙️ Firmware

This setup is based on **RepRap Firmware 3.6.1** for Duet hardware.

Useful resources:

- Documentation: https://docs.duet3d.com/  
- Firmware repository: https://github.com/Duet3D/RepRapFirmware  
- Community forum: https://forum.duet3d.com/

The firmware is configured entirely via G-code scripts located in the `/sys` directory on the Duet SD card.

Network settings, drivers, heaters, and machine limits are defined there.

---

## 🧩 Configuration Files

The files inside `My_Config/` are intended to be placed into the `/sys` directory of the Duet SD card.

Typical files include:

- `config.g`
- Homing macros (`homex.g`, `homey.g`, `homez.g`)
- Optional probing or bed leveling macros

After configuration changes, a restart or `M999` command may be required.

---

## 🛠️ OrcaSlicer

The folder `My_Slicers/` contains prepared **OrcaSlicer profiles**.

These are tuned for:

- RepRap Firmware (RRF)
- Network printing via Duet Web Interface
- Standard G-code output (no Klipper/Marlin dialects)

Import the profiles via the profile management section in OrcaSlicer.

---

## 📦 Installation

1. Remove the Duet SD card.  
2. Copy contents of `My_Config/` into `/sys`.  
3. Reinsert the SD card and start the printer.  
4. Access the Web Interface via the printer IP.  
5. Verify configuration.

---

## 🏗️ Mechanical Base

This printer is built according to the official V-Core 3.1 guide from RatRig.

Build guide:  
https://wiki.ratrig.com/en/build-guides/v-core-31

---

## 📌 Notes

- Firmware updates may require adjustments to `config.g`.  
- Perform PID tuning after hotend or heated bed modifications.  
- Creating backups of the SD card before editing configuration files is strongly recommended.

---

## 📄 License & Liability

This repository contains only my personal configuration files.  
The firmware itself is licensed under Duet3D/RepRapFirmware (GPLv3).

No warranty is provided. Use at your own risk.
