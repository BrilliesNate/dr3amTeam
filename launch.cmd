@echo off
setlocal

set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"

start "" "%ROOT%\apps\wezterm\wezterm-gui.exe" start ^
  --cwd "%ROOT%\projects" ^
  -- "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" ^
  -NoLogo -NoProfile -ExecutionPolicy Bypass -NoExit ^
  -File "%ROOT%\session.ps1"

endlocal
