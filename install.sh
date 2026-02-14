#!/bin/bash

# 1. Proje klasörünü ve kullanıcıyı tespit et
PROJECT_DIR=$(pwd)
SERVICE_NAME="download-organizer.service"
SERVICE_PATH="$HOME/.config/systemd/user/$SERVICE_NAME"

echo "🚀 Kurulum başlatılıyor: AutoSort-Downloads"

# 2. Gerekli araçları kontrol et (inotify-tools)
if ! command -v inotifywait &> /dev/null; then
    echo "❌ Hata: inotify-tools bulunamadı. Lütfen sisteminize yükleyin."
    exit 1
fi

# 3. Scriptlere çalıştırma yetkisi ver
chmod +x "$PROJECT_DIR/autoFolderOrganizer.py"
chmod +x "$PROJECT_DIR/watch_downloads.sh"

# 4. Systemd kullanıcı servis dizinini oluştur
mkdir -p "$HOME/.config/systemd/user/"

# 5. Servis dosyasını dinamik olarak oluştur
cat <<EOF > "$SERVICE_PATH"
[Unit]
Description=Downloads Folder Auto Organizer
After=default.target

[Service]
ExecStart=$PROJECT_DIR/watch_downloads.sh
Restart=always

[Install]
WantedBy=default.target
EOF

# 6. Servisi aktif et ve başlat
systemctl --user daemon-reload
systemctl --user enable "$SERVICE_NAME"
systemctl --user start "$SERVICE_NAME"

echo "✅ Kurulum tamamlandı! Servis şu an arka planda çalışıyor."
echo "ℹ️  Durumu kontrol etmek için: systemctl --user status $SERVICE_NAME"