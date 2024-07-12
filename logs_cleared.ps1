$logs = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=1102}

$selectedLogs = $logs | Select-Object TimeCreated, Message, Id, LogName, MachineName, ProcessId

$selectedLogs | Export-Csv -Path "C:\path\to\your\desktop\SecurityLogsCleared.csv" -NoTypeInformation
