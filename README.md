# veeam-points-checker-script

The script created for troubleshooting.<br/>
It checks the existing Veeam Backup & Replication restore points for a virtual machine every 6 seconds for the limited amount of time. It produces an output to a log file with a timestamp to the restore points count and other diagnostic information.<br/>
It uses Veeam Backup & Replication PowerShell module.<br/>
https://helpcenter.veeam.com/docs/backup/powershell/getting_started.html?ver=110