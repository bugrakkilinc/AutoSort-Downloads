import os
import shutil
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

# 1. Klasör Yolu Ayarı (Windows Uyumlu)
BASE_DIR = os.path.join(os.path.expanduser("~"), "Downloads")

CATEGORIES = {
    "Images": ["jpg", "jpeg", "png", "gif", "bmp", "webp"],
    "Documents": ["pdf", "docx", "txt", "xlsx", "pptx", "csv"],
    "Archives": ["zip", "tar.gz", "tar", "rar", "7z", "gz", "xz"],
    "Videos": ["mp4", "mkv", "mov", "avi"],
    "Music": ["mp3", "wav", "flac", "ogg"]
}

class DownloadHandler(FileSystemEventHandler):
    def on_modified(self, event):
        # Klasör içeriği değiştiğinde düzenleyiciyi çalıştır
        self.organize()

    def organize(self):
        all_items = os.listdir(BASE_DIR)
        file_names = [f for f in all_items if os.path.isfile(os.path.join(BASE_DIR, f))]

        # Aktif indirme kontrolü (.part veya .crdownload varsa dur)
        active_download = any(".part" in f or ".crdownload" in f for f in file_names)
        if active_download:
            return

        for filename in file_names:
            # Geçici dosyaları atla
            if ".part" in filename or ".crdownload" in filename:
                continue

            # Uzantıyı bul
            dot_position = filename.rfind(".")
            if dot_position > 0:
                extension = filename[dot_position + 1:].lower()
            else:
                extension = "others"

            # Kategoriyi belirle
            target_folder = "Others"
            for category, extensions in CATEGORIES.items():
                if extension in extensions:
                    target_folder = category
                    break

            # Hedef yolu oluştur
            target_path = os.path.join(BASE_DIR, target_folder)
            os.makedirs(target_path, exist_ok=True)

            source_path = os.path.join(BASE_DIR, filename)
            final_target_path = os.path.join(target_path, filename)

            # Dosya çakışma kontrolü
            counter = 1
            while os.path.exists(final_target_path):
                name_part, extension_part = os.path.splitext(filename)
                new_filename = f"{name_part}_{counter}{extension_part}"
                final_target_path = os.path.join(target_path, new_filename)
                counter += 1

            # Dosyayı taşı (Hata payına karşı try-except)
            try:
                # Windows'ta dosya hala başka bir işlemce kullanılıyorsa beklemek için
                shutil.move(source_path, final_target_path)
                print(f"Taşındı: {filename} -> {target_folder}")
            except Exception as e:
                pass # Dosya kullanımda olabilir, bir sonraki tetiklenmede taşınır

if __name__ == "__main__":
    print(f"İzleniyor: {BASE_DIR}")
    event_handler = DownloadHandler()
    observer = Observer()
    observer.schedule(event_handler, BASE_DIR, recursive=False)
    observer.start()

    try:
        while True:
            time.sleep(5) # İşlemciyi yormamak için 5 saniyede bir kontrol
    except KeyboardInterrupt:
        observer.stop()
    observer.join()