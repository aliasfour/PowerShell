$dl = invoke-webrequest -Uri "https://git-scm.com/download/win" -UseBasicParsing
$link = $dl.links
$link = $dl.Links | where outerHTML -Match '64-bit' | select -First 1
$url = $link.href
$filename = Split-Path -Path $url -Leaf
$out = 'C:\Users\Customer\Downloads\'  

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri $url -OutFile "$out\$filename" -UseBasicParsing -DisableKeepAlive