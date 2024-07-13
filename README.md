# PowerShell Script for Fetching 'Log Cleared' Events

This PowerShell script fetches 'log cleared' events from the Windows security log and exports them to a CSV file.

## logs_cleared.ps1

Here is the PowerShell code:

```powershell
# Get the 'Log cleared' events from the Windows log.
# 'Get-WinEvent' is a command that fetches Windows event logs.
# 'FilterHashtable' is a filter we're applying to only get events from the 'Security' log with an ID of 1102.
$logs = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=1102}

# Select only the desired columns from the logs that we want to show.
# The Select-Object cmdlet is used to select specific columns from these logs.
$selectedLogs = $logs | Select-Object TimeCreated, Message, Id, LogName, MachineName, ProcessId

# Export logs to CSV
# We're asking Windows to take those events ('$logs') and put them into a CSV file.
# 'Export-Csv' is a command that exports data to a CSV file.
# '-Path' is where we want to save the file. You should replace it.
# '-NoTypeInformation' is an option that prevents PowerShell from writing type information to the CSV file.
$selectedLogs | Export-Csv -Path "C:\path\to\your\desktop\SecurityLogsCleared.csv" -NoTypeInformation
```
## PowerShell Scripting

PowerShell is a powerful scripting language and administrative framework for Windows. Here's a guide on how to create and run a simple PowerShell script.
 
## ⚠️ Creating a PowerShell Script ⚠️

1. Open **Notepad**. You can do this by searching for Notepad in the start menu or by typing `notepad` in the Run dialog (Win + R).

2. Write or copy the script in Notepad. **⚠️** Make sure to change `-Path` **⚠️**
    
3. Save the file with a `.ps1` extension. This is the extension for PowerShell scripts. To do this in Notepad, click on `File > Save As`, then in the `Save as type` dropdown, select `All Files`. Name your file with a `.ps1` extension, like `logs_cleared.ps1`.


## 🏃‍♂️ Running a PowerShell Script 🏃‍♂️

1. To run your script, type in the Windows search bar `Windows Powershell` and right click `Run as adminastrator`. Now use the `cd` command to navigate to your desktop. Once you're on your desktop type `.\logs_cleared.ps1`

2. If you encounter any issues with running the script, you may need to change your script execution policy. You can do this by opening PowerShell as an administrator and running the command: `Set-ExecutionPolicy RemoteSigned`. This allows you to run scripts that you've written and scripts from trusted publishers.

# Example output in Google Sheets

![example](https://github.com/computer-logz/logs_cleared/blob/main/example_output.jpg)
