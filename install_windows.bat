@echo off
setlocal
title AutoSort-Downloads Kurulumu

echo ===========================================
echo    AutoSort-Downloads Windows Kurulumu
echo ===========================================

:: 1. Python kontrolü
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [HATA] Python yuklu degil! Lutfen once Python yukleyin.
    pause
    exit /b
)

:: 2. Watchdog kütüphanesini kur
echo [*] Gerekli kutuphaneler kuruluyor (watchdog)...
pip install watchdog --quiet

:: 3. Başlangıç klasörü yolunu belirle
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SCRIPT_PATH=%~dp0autoSort_windows.py"
set "VBS_PATH=%~dp0launcher.vbs"

:: 4. Arka planda sessizce calistirmak icin kucuk bir VBS scripti olustur
:: Boylece siyah konsol ekrani acik kalmaz.
echo Set WshShell = CreateObject("WScript.Shell") > "%VBS_PATH%"
echo WshShell.Run "pythonw.exe ""%SCRIPT_PATH%""", 0, False >> "%VBS_PATH%"

:: 5. Baslangic klasorune kisayol (VBS dosyasi üzerinden) ekle
echo [*] Baslangic klasorune ekleniyor...
copy /y "%VBS_PATH%" "%STARTUP_FOLDER%\AutoSortLauncher.vbs" >nul

echo ===========================================
echo [BASARILI] Kurulum tamamlandi!
echo Script artik her acilista arka planda calisacak.
echo Hemen baslatmak icin 'launcher.vbs' dosyasina tiklayabilirsiniz.
echo ===========================================
pause