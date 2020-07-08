### ping

Test-Connection -TargetName sid-500.com,8.8.8.8 -Count 1
Test-Connection -TargetName sid-500.com -Repeat
Test-Connection -TargetName 8.8.8.8 -ResolveDestination –Traceroute

### Select-String Emphasis

Get-Content -Path $env:windir\Panther\setupact.log | Select-String "First Boot"
