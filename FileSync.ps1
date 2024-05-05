# 本地路徑
$local_folder = ''
# 遠程路徑
$remote_folder = ''
# 排除資料夾
$exclude_file = '.zfs/**'

$filter = '*.*'
$fsw = New-Object IO.FileSystemWatcher $folder, $filter -Property @{
	IncludeSubdirectories = $true
	NotifyFilter          = [IO.NotifyFilters]'FileName, LastWrite'
}

# 事件處理函數
$rcloneSync = {
	rclone sync $local_folder $remote_folder --metadata --checksum --exclude $exclude_file
}

# 註冊觸發事件
Register-ObjectEvent $fsw Created -Action $rcloneSync -SourceIdentifier MyWatcher.Created
Register-ObjectEvent $fsw Changed -Action $rcloneSync -SourceIdentifier MyWatcher.Changed
Register-ObjectEvent $fsw Deleted -Action $rcloneSync -SourceIdentifier MyWatcher.Deleted
Register-ObjectEvent $fsw Renamed -Action $rcloneSync -SourceIdentifier MyWatcher.Renamed

# 保持腳本運行
Wait-Event