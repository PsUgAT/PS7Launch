#### PowerShell 5 - Foreach-Object

Measure-Command {

$port = '443','80','53','88'

$port | ForEach-Object {Test-NetConnection -ComputerName 192.0.78.24 -Port $_ -WarningAction Ignore}

} | Select-Object Minutes,Seconds

#### PowerShell 7 - Foreach-Object -Parallel

Measure-Command {

$port = '443','80','53','88'

$port | ForEach-Object -Parallel {Test-NetConnection -ComputerName 192.0.78.24 -Port $_ -WarningAction Ignore}

} | Select-Object Minutes,Seconds

#### PowerShell 5+7 foreach ()

Measure-Command {

$port = '443','80','53','88'

foreach ($p in $port) {

Test-NetConnection -ComputerName 192.0.78.24 -Port $p -WarningAction Ignore 

}} | Select-Object Minutes,Seconds