# ==============================================================
#  EZKMS v1.2 – KMS Activator (PowerShell - VISIBLE ON ALL THEMES)
#  Windows 10 / 11 – Home, Pro, Education
#  LEGAL VOLUME-LICENSE USE ONLY
#  GitHub: XNUCade
# ==============================================================

# === FORCE DARK CONSOLE + HIGH CONTRAST ===
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
Clear-Host

# === ADMIN CHECK ===
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "`n[ERROR] RUN AS ADMINISTRATOR!" -ForegroundColor Red
    Write-Host "Right-click > Run with PowerShell > Run as administrator`n" -ForegroundColor Yellow
    Pause
    exit 1
}

$Host.UI.RawUI.WindowTitle = "EZKMS v1.2"

# === EDITIONS ===
$Editions = @{
    "1" = @{ Name = "Windows 11 Pro";        Key = "W269N-WFGWX-YVC9B-4J6C9-T83GX" }
    "2" = @{ Name = "Windows 11 Home";       Key = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" }
    "3" = @{ Name = "Windows 11 Education";  Key = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2" }
    "4" = @{ Name = "Windows 10 Home";       Key = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" }
    "5" = @{ Name = "Windows 10 Pro";        Key = "W269N-WFGWX-YVC9B-4J6C9-T83GX" }
    "6" = @{ Name = "Windows 10 Education";  Key = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2" }
}

$KmsServer = "kms8.msguides.com:1688"

# === DETECT OS ===
function Get-OS {
    try {
        $os = (Get-CimInstance Win32_OperatingSystem).Caption
        $os = $os -replace "Microsoft Windows ", "" -replace "\s+", " "
        ($os -split " ", 3)[0..1] -join " "
    } catch { "Unknown" }
}
$Detected = Get-OS

# === OUTPUT FUNCTIONS (HIGH CONTRAST) ===
function H { param($t) Write-Host "`n=== $t ===" -ForegroundColor Cyan }
function OK { param($m) Write-Host "[OK] $m" -ForegroundColor Green }
function ERR { param($m) Write-Host "[FAILED] $m" -ForegroundColor Red }
function WARN { param($m) Write-Host "[WARN] $m" -ForegroundColor Yellow }

# === RUN SLMGR ===
function Run-SLMGR {
    param($args)
    $p = Start-Process -FilePath "cscript" -ArgumentList "//nologo", "//b", "$env:SystemRoot\System32\slmgr.vbs", $args -join " " -Wait -PassThru -NoNewWindow
    return $p.ExitCode -eq 0
}

# === MAIN LOOP ===
while ($true) {
    Clear-Host
    Write-Host "`n   EZKMS v1.2 - KMS ACTIVATOR" -ForegroundColor Cyan
    Write-Host "   GitHub: XNUCade`n" -ForegroundColor Gray
    Write-Host "   Detected: $Detected`n" -ForegroundColor Yellow

    Write-Host "   ==================================================" -ForegroundColor Magenta
    Write-Host "   1) Windows 11 Pro" -ForegroundColor White
    Write-Host "   2) Windows 11 Home" -ForegroundColor White
    Write-Host "   3) Windows 11 Education" -ForegroundColor White
    Write-Host "   4) Windows 10 Home" -ForegroundColor White
    Write-Host "   5) Windows 10 Pro" -ForegroundColor White
    Write-Host "   6) Windows 10 Education" -ForegroundColor White
    Write-Host "   --------------------------------------------------" -ForegroundColor Magenta
    Write-Host "   0) Exit" -ForegroundColor White
    Write-Host "   ==================================================`n" -ForegroundColor Magenta

    $choice = Read-Host "Enter 0-6"
    if ($choice -eq "0") { exit }

    $ed = $Editions[$choice]
    if (-not $ed) {
        Write-Host "`n[ERROR] Invalid selection!" -ForegroundColor Red
        Start-Sleep 2
        continue
    }

    $Key = $ed.Key
    $Name = $ed.Name

    Clear-Host
    H "Installing $Name key"
    if (Run-SLMGR /ipk $Key) {
        OK "Key installed"
    } else {
        ERR "Failed to install key"
        Pause
        continue
    }

    H "Setting KMS server"
    if (Run-SLMGR /skms $KmsServer) {
        OK "Server configured"
    } else {
        WARN "Server not reachable"
    }

    H "Activating"
    if (Run-SLMGR /ato) {
        OK "ACTIVATED (180 days, auto-renew)"
    } else {
        ERR "Activation failed"
        Write-Host "`n   • Check internet" -ForegroundColor Gray
        Write-Host "   • Match edition to installed OS" -ForegroundColor Gray
        Write-Host "   • Try again later`n" -ForegroundColor Gray
    }

    H "License Status"
    & cscript //nologo //b "$env:SystemRoot\System32\slmgr.vbs" /ckms > $null 2>&1
    $status = & cscript //nologo //b "$env:SystemRoot\System32\slmgr.vbs" /dlv 2>$null | Where-Object { $_ -match "License Status" }
    if ($status) {
        $text = ($status -split ":", 2)[1].Trim()
        if ($text -like "*Licensed*") {
            Write-Host "   $text" -ForegroundColor Green
        } else {
            Write-Host "   $text" -ForegroundColor Yellow
        }
    } else {
        Write-Host "   Unknown" -ForegroundColor Gray
    }

    Write-Host "`n==================================================" -ForegroundColor Magenta
    Write-Host "Press Enter to continue..." -ForegroundColor White
    Read-Host > $null
}