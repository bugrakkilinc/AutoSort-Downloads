@echo off
setlocal
title AutoSort-Downloads Kurulumu

echo ===========================================
echo    AutoSort-Downloads Windows Kurulumu
echo ===========================================

:: 1. Python kontrolü
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [HATA] Python yuklu degil veya PATH'e eklenmemis!
    pause
    exit /b
)

:: 2. Watchdog kütüphanesini kur (Garantili yöntem)
echo [*] Gerekli kutuphaneler kuruluyor (watchdog)...
python -m pip install watchdog --quiet
if %errorlevel% neq 0 (
    echo [HATA] Kutuphane kurulamadi. Internet baglantinizi kontrol edin.
    pause
    exit /b
)

:: 3. Yolları belirle
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SCRIPT_PATH=%~dp0autoSort_windows.py"
set "VBS_PATH=%~dp0launcher.vbs"

:: 4. Arka planda calistirmak icin VBS scripti olustur
echo Set WshShell = CreateObject("WScript.Shell") > "%VBS_PATH%"
echo WshShell.Run "pythonw.exe ""%SCRIPT_PATH%""", 0, False >> "%VBS_PATH%"

:: 5. Baslangic klasorune ekle
echo [*] Baslangic klasorune ekleniyor...
copy /y "%VBS_PATH%" "%STARTUP_FOLDER%\AutoSortLauncher.vbs" >nul

echo ===========================================
echo [BASARILI] Kurulum tamamlandi!
echo ===========================================
pause