@echo off
setlocal
title AutoSort-Downloads Kurulumu

echo ===========================================
echo    AutoSort-Downloads Windows Kurulumu
echo ===========================================

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [HATA] Python yuklu degil! Lutfen once Python yukleyin.
    pause
    exit /b
)

echo [*] Gerekli kutuphaneler kuruluyor (watchdog)...
pip install watchdog --quiet

set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SCRIPT_PATH=%~dp0autoSort_windows.py"
set "VBS_PATH=%~dp0launcher.vbs"

echo Set WshShell = CreateObject("WScript.Shell") > "%VBS_PATH%"
echo WshShell.Run "pythonw.exe ""%SCRIPT_PATH%""", 0, False >> "%VBS_PATH%"

echo [*] Baslangic klasorune ekleniyor...
copy /y "%VBS_PATH%" "%STARTUP_FOLDER%\AutoSortLauncher.vbs" >nul

echo ===========================================
echo [BASARILI] Kurulum tamamlandi!
echo Script artik her acilista arka planda calisacak.
echo Hemen baslatmak icin 'launcher.vbs' dosyasina tiklayabilirsiniz.
echo ===========================================
pause