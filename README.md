# HideUnhide
A Batch Script to Hide Folders and Unhide Quickly by running this code using.
## hide command 
```
attrib +h +r +s
```

## Unhide command
```
attrib -h -r -s
```

Run at your Own Risk


### Explanation:

1. **Setting `folder_path`**: The script sets the `folder_path` to `%~dp0`, which is the directory where the batch file is executed.
2. **Setting `batch_file`**: The script sets the `batch_file` variable to `"secret.bat"`, the name of the batch file to be excluded.
3. **Menu and Choices**: The script prompts the user for a choice to hide, unhide, or exit.
4. **Hide Section**:
   - The script changes to the directory of the batch file.
   - The `for /f` loop processes each file (`/b /a-d` for non-directory files) and applies the `+s +h` attributes if the file name is not `"secret.bat"`.
   - A second `for /f` loop processes each folder (`/b /ad` for directories) and applies the `+s +h` attributes.
5. **Unhide Section**:
   - Similar to the hide section, but removes the `-s -h` attributes.
6. **End Section**: Ends the script.

Save this script as `secret.bat`. Place it in any folder and run it. The script will hide or unhide the contents of the folder where the batch file is located, excluding the batch file itself. This approach ensures that `secret.bat` remains visible while other files and directories are hidden or unhidden.
