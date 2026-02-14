#!/bin/bash

# Renk tanımlamaları
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # Renk Yok

echo -e "${RED}AutoSort-Downloads kaldırılıyor...${NC}"

# 1. Systemd servisini durdur ve devre dışı bırak
echo "Servis durduruluyor..."
systemctl --user stop download-organizer.service
systemctl --user disable download-organizer.service

# 2. Servis dosyasını sil
echo "Servis dosyası siliniyor..."
rm -f ~/.config/systemd/user/download-organizer.service
systemctl --user daemon-reload

# 3. Bağımlılık uyarısı (inotify-tools kalsın mı kalmasın mı kullanıcıya bırakıyoruz)
echo -e "${GREEN}Sistem temizlendi.${NC}"
echo "Not: 'inotify-tools' paketi sistemde bırakıldı. Kaldırmak isterseniz paket yöneticinizi kullanabilirsiniz."
echo -e "${GREEN}Kaldırma işlemi başarıyla tamamlandı!${NC}"