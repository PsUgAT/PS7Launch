# PS Scriptanalyzer
Invoke-ScriptAnalyzer .\Scriptanalyzer-test.ps1 -fix

# PSReadline
Get-PSReadLineKeyHandler
## Clear Screen ?
Set-PSReadLineKeyHandler -Key tab -Function Complete

## Zeige Live-Session agnostic History

## zeige Menu Completion [CTRL]-[SPACE] und dann [Tab] mit Get-Service

# Windows Terminal
#[SHIFT] [ALT] [D]
wt -p 'PowerShell7'`; split-pane -p "Windows PowerShell" 

www.powershell.co.