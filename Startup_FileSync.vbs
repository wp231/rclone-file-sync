' 腳本路徑
scriptPath = ""

Set objShell = CreateObject("WScript.Shell")
objShell.Run("powershell.exe -ExecutionPolicy Bypass -File """ & scriptPath & """"), 0
Set objShell = Nothing
