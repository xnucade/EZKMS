<div align="center">

# ⚡ EZKMS

**A lightweight Windows activation utility**

![Platform](https://img.shields.io/badge/platform-Windows-0078D6?logo=windows&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-5391FE?logo=powershell&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-active-brightgreen)

</div>

---

## 📖 Overview

EZKMS is a simple, no-frills Windows activation tool that uses KMS (Key Management Service) to activate Windows locally. No third-party servers, no bloat — just a clean script that gets the job done.

---

## ✨ Features

- ✅ Activates Windows 10 and Windows 11
- ✅ Supports multiple Windows editions (Home, Pro, Enterprise, Education)
- ✅ Uses Microsoft's built-in `slmgr` activation infrastructure
- ✅ Runs entirely locally — no external downloads during activation
- ✅ Lightweight and portable — no installation required

---

## 🚀 Usage

> **Run as Administrator.** Activation requires elevated privileges.

### Option 1 — PowerShell (Recommended)

Right-click **PowerShell** → *Run as Administrator*, then paste:

```powershell
irm https://raw.githubusercontent.com/xnucade/EZKMS/main/activate.ps1 | iex
```

### Option 2 — Download and Run

1. Download the latest release from the [Releases](../../releases) page.
2. Right-click the script → **Run as Administrator**.

---

## 🛠️ How It Works

EZKMS uses Windows' built-in `slmgr.vbs` (Software Licensing Manager) to:

1. Install a generic KMS client key for your Windows edition.
2. Point activation at a KMS server.
3. Trigger activation via the standard Windows licensing pipeline.

No third-party binaries are executed. Everything runs through Windows-native tooling.

---

## 📋 Supported Editions

| Edition | Supported |
|---|---|
| Windows 10/11 Home | ✅ |
| Windows 10/11 Pro | ✅ |
| Windows 10/11 Enterprise | ✅ |
| Windows 10/11 Education | ✅ |

---

## ⚠️ Disclaimer

This tool is provided for **educational and testing purposes only**. Use it only on systems you own or are authorized to manage. Activating Windows with a legitimate license purchased from Microsoft is always recommended for production and personal use.

The author is not responsible for any misuse of this software.

---

## 🧰 Requirements

- Windows 10 or Windows 11
- PowerShell 5.1 or later
- Administrator privileges

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<div align="center">
  Made by <a href="https://github.com/xnucade">xnucade</a>
</div>
