## PowerShell Lauch Austria
## 2020-07-07
##
$PSVersionTable

# ErrorView

Get-ChildItem c:\nowhere
$ErrorView = 'NormalView'
Get-ChildItem c:\nowhere
$ErrorView = 'ConciseView'

$b= [1..20]
1..20 | % {Write-Host 'l'}
foreach -parallel ($a in 1..20) {
    write-hsst $a
    
}

$Error[0]

Get-Error

# Commands are back

'Get-ChildItem | ogv' | Set-Clipboard
Get-ChildItem | ogv
Get-ChildItem | ogv

Get-Help -ShowWindow

Clear-RecycleBin

Show-Command -Name Get-AzureKeyVaultSecret

Test-Connection 'expertslive.at'

# Speed kills
# Compare PS 5 and PS 7!

Measure-Command { 1..1e5 | % {1} > $null} # Use PS5 and PS7 at this point

$iss = [initialsessionstate]::CreateDefault()
Measure-Command { 1..100 | % { $rs=[runspacefactory]::Createrunspace($iss); $rs.open(); $rs.dispose()}}

# Formating is faster (ft)

# For-Each Object -parallel

Measure-command {
    1..10 | ForEach-Object {
        "Output: $_"
        Start-Sleep 1
    } }

Measure-command {
    1..10 | ForEach-Object -ThrottleLimit 5 -Parallel  {
        "Output: $_"
        Start-Sleep 1
    } }

Measure-command {
1..10 | ForEach-Object -ThrottleLimit 15 -Parallel  {
    "Output: $_"
    Start-Sleep 1
} }

Measure-command {
    1..10 | ForEach-Object -ThrottleLimit 5 -TimeoutSeconds 2 -Parallel  {
        "Output: $_"
        Start-Sleep 5
    } }

# Tenery operator (love this)
$a = $true

if ($a) {'yes'} else {$false}

$a ? 'yes' : $false

# Status of the last command
# See https://web.archive.org/web/20190425110754/https://devblogs.microsoft.com/scripting/powershell-error-handling-and-why-you-should-care/
$?

Roman

$?

# Pipeline chain operator (&& and ||) rely on $?
Patrick || write-host 'Läuft'

write-host 'Läuft' || write-host 'Läuft nicht'

Patrick && write-host 'Läuft nicht'

write-host 'Läuft' && write-host 'Läuft nochmal'

# Null-coalescing operators
# If $x is null, return 1, otherwise return $x
$x ?? 1
$x = 2
$x ?? 1

# If there is no service called WinRM that is running, start WinRm
(Get-Service WinRM | ? Status -eq 'Running') ?? (Start-Service Wi

$null ?? ($_)

# Directly assign using ??
$z ??= 100
$z
$z ??= 101




