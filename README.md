# 🚀 AutoSort-Downloads

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

2. Make Scripts Executable
Bash

chmod +x autoFolderOrganizer.py watch_downloads.sh

3. Create & Enable the Systemd Service

To make this run automatically in the background, create a user service:

    Create the directory:
    Bash

    mkdir -p ~/.config/systemd/user/

    Create the service file:
    Bash

    nano ~/.config/systemd/user/download-organizer.service

    Paste the following (Replace YOUR_PATH with the actual path, e.g., Desktop/AutoSort-Downloads):

Ini, TOML

[Unit]
Description=Downloads Folder Auto Organizer
After=default.target

[Service]
ExecStart=%h/YOUR_PATH/watch_downloads.sh
Restart=always

[Install]
WantedBy=default.target

    Start and enable the service:

Bash

systemctl --user daemon-reload
systemctl --user enable download-organizer.service
systemctl --user start download-organizer.service

📂 Categories Supported

    Images: .jpg, .png, .gif, .webp, etc.

    Documents: .pdf, .docx, .txt, .xlsx, etc.

    Archives: .zip, .tar.gz, .rar, .7z, etc.

    Videos & Music: .mp4, .mkv, .mp3, .wav, etc.

Developed by Buğra Kılınç - Computer Engineering Student @ Selçuk University