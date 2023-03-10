@echo off
set regfile=%userprofile%\Desktop\keys.txt
if not exist "%regfile%" (
    echo ERROR: File "%regfile%" not found.
    pause
    exit /b 1
)
for /f "tokens=*" %%a in ('type "%regfile%"') do (
    reg delete "%%a" /f
    if %errorlevel% equ 0 (
        echo Registry key "%%a" deleted.
    ) else (
        echo ERROR: Failed to delete registry key "%%a".
    )
)
echo Done.
pause
