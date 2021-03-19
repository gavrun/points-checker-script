#start
#increase length of a line
$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(1024,8096)
#load veeam ps extension 
Add-PSSnapin VeeamPSSnapin
#set duration in minutes
$timer = New-Timespan -Minutes 1440
$clock = [diagnostics.stopwatch]::StartNew()
#modify source backup job name and vm name
$job = "Backup Job 3"
$vm = "agav-empty-thick"
#check restore points every 6 seconds
while ($clock.elapsed -lt $timer) 
    { 
        Write-Output (Get-Date -Format o) >> $PSScriptRoot\BAMBOO01_points.log;
        Write-Output " " >> $PSScriptRoot\BAMBOO01_points.log;
        $point = (Get-VBRBackup -Name $job | Get-VBRRestorePoint -Name $vm | Select-Object -Property VmName,PointId,CreationTime,BackupId)
        Write-Output ($point.PointId).count >> $PSScriptRoot\BAMBOO01_points.log;
        Write-Output $point >> $PSScriptRoot\BAMBOO01_points.log;
        Start-Sleep -Seconds 6;
    } 
#end