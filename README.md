A professional, lightweight, and automated file organizer for **Linux** systems. This tool monitors your Downloads folder in real-time and instantly categorizes incoming files into organized subdirectories.



## ✨ Features
* **Real-time Monitoring:** Uses `inotify-tools` to detect new files the moment they finish downloading.
* **Smart Categorization:** Automatically groups files into `Images`, `Documents`, `Archives`, `Videos`, `Music`, and `Others`.
* **Linux Native & Language Independent:** Uses `xdg-user-dir` to find your Downloads folder regardless of your system language (Turkish, English, etc.).
* **Conflict Prevention:** Smart renaming logic (e.g., `report_1.pdf`) ensures no files are overwritten if names clash.
* **Background Service:** Runs silently as a `systemd` user service, starting automatically when you log in.

## 🛠️ Requirements
* **Python 3.x**
* **inotify-tools:** Required for the real-time watcher.

```bash
# Arch / CachyOS
sudo pacman -S inotify-tools

# openSUSE
sudo zypper install inotify-tools

🚀 Installation & Setup
1. Clone the Repository
Bash

git clone [https://github.com/bugrakkilinc/AutoSort-Downloads.git](https://github.com/bugrakkilinc/AutoSort-Downloads.git)
cd AutoSort-Downloads

2. Run the Automated Installer

The installer will automatically detect your file paths, grant necessary permissions, and set up the background service.
Bash

chmod +x install.sh
./install.sh

## 🗑️ Uninstall
To stop the service and remove all configurations:
```bash
./uninstall.sh

📂 Categories Supported

    Images: .jpg, .png, .gif, .webp, etc.

    Documents: .pdf, .docx, .txt, .xlsx, etc.

    Archives: .zip, .tar.gz, .rar, .7z, etc.

    Videos & Music: .mp4, .mkv, .mp3, .wav, etc.

Developed by Buğra Küçükkılınç - Computer Engineering Student @ Selçuk University