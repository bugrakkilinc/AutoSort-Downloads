# 📂 AutoSort-Downloads

AutoSort-Downloads is a real-time, automated file organizer that keeps your Downloads folder clean by categorizing files into specific folders based on their extensions. It works seamlessly on both **Linux** and **Windows**.



---

## ✨ Features
- **Real-time Monitoring:** Instantly detects new files and moves them.
- **Download Safety:** Waits for active downloads (.part, .crdownload) to finish before moving.
- **Cross-Platform:** Native support for Linux (systemd) and Windows (Startup).
- **Customizable:** Easily add new categories or extensions in the Python script.

---

## 🚀 Installation

### 🐧 Linux (Arch, Fedora, Ubuntu, etc.)
1. **Prerequisites:** Install `inotify-tools`.
   ```bash
   sudo pacman -S inotify-tools  # Arch
   sudo dnf install inotify-tools # Fedora

    Setup: Run the installer script.
    Bash

    chmod +x install.sh
    ./install.sh

🪟 Windows

    Prerequisites: Ensure Python is installed and added to PATH.

    Setup: Right-click install_windows.bat and Run as Administrator.

        This will install the watchdog library and add the script to your Startup folder.

📂 Categories
Category	Extensions
Images	.jpg, .png, .gif, .webp, .bmp
Documents	.pdf, .docx, .txt, .xlsx, .csv
Archives	.zip, .rar, .7z, .tar.gz
Videos	.mp4, .mkv, .mov, .avi
Music	.mp3, .wav, .flac
🗑️ Uninstall
🐧 Linux
Bash

chmod +x uninstall.sh
./uninstall.sh

🪟 Windows

Run uninstall_windows.bat. It will stop the background process and remove the startup entry.
👤 Author

Buğra Kılınç Computer Engineering Student at Selçuk University

    GitHub: @bugrakkilinc