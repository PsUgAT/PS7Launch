###  PowerShell 7 (Try-Catch removed)

### Retrieve all enabled Member-Server by name

$servers = (Get-ADComputer -Properties operatingsystem `
 -Filter 'operatingsystem -like "*server*" -and enabled -eq "true"').Name

### Ping all Member-Server

foreach ($item in $servers) {
    

        $test = Test-Connection $item -Count 1
       
     If ($test.Status -eq 'TimedOut')
     {
        $date = Get-Date -Format 'dd-MM-yyyy HH:mm'
        $username = 'alert@domain.com'
        $password = '123user!' | ConvertTo-SecureString -AsPlainText -Force
        $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
        $subject = "Alert: $item on $date down"
        $body = "Reporting server: $env:computername.Trying again in 15 minutes."
        
        ### Splatting with Hash Table
        
        $hash = @{
        
        To = 'patrick.gruenauer@domain.com' 
        From = 'alert@domain.com' 
        Subject = $subject
        Body = $body 
        BodyAsHtml = $true 
        SmtpServer = 'smtp.office365.com' 
        UseSSL = $true
        Credential = $cred 
        Port = 587
