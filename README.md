# FileSync for rclone

Monitor events and automatically synchronize files to the infini-cloud cloud using the rclone tool.

## Instructions

1. Install rclone

   ```cmd
   > winget install Rclone.Rclone
   ```

2. Set up rclone

   - Add a new remote

   ```cmd
   > rclone config
   ```

3. Configure paths

   The path name cannot contain Chinese characters.

   - `FileSync.ps1`

   ```ps1
   # local path
   $local_folder = ''
   # remote path
   $remote_folder = ''
   ```

   - `Startup_FileSync.vbs`

   ```vb
   ' Script path
   scriptPath = ""
   ```

5. Set up auto-start on boot

   - Press `Win` + `R` to open the Run dialog, then type `shell:startup`
   - Copy the `Startup_FileSync.vbs` file into the folder
