@echo off
setlocal
title AutoSort-Downloads Kaldirici

echo ===========================================
echo    AutoSort-Downloads Windows Kaldirma
echo ===========================================

:: 1. Calisan Python surecini sonlandir
echo [*] Calisan servis durduruluyor...
taskkill /f /im pythonw.exe /fi "IMAGENAME eq pythonw.exe" >nul 2>&1

:: 2. Baslangic klasorunden kisayolu sil
echo [*] Baslangictan kaldiriliyor...
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
if exist "%STARTUP_FOLDER%\AutoSortLauncher.vbs" (
    del /f "%STARTUP_FOLDER%\AutoSortLauncher.vbs"
    echo [OK] Baslangic kaydi silindi.
)

:: 3. Yerel klasordeki gecici VBS dosyasini sil
if exist "launcher.vbs" (
    del /f "launcher.vbs"
    echo [OK] Gecici dosyalar temizlendi.
)

echo ===========================================
echo [BASARILI] Sistem temizlendi.
echo Not: 'watchdog' kutuphanesi sistemde birakildi. 
echo Silmek isterseniz: 'pip uninstall watchdog' yazabilirsiniz.
echo ===========================================
pause