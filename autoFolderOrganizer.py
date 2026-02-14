import shutil
import os

downloads_path = os.popen('xdg-user-dir DOWNLOAD').read().strip()
if not downloads_path:
    downloads_path = os.path.join(os.path.expanduser("~"), "Downloads")
BASE_DIR = downloads_path

all_items = os.listdir(BASE_DIR)
file_names = [f for f in all_items if os.path.isfile(os.path.join(BASE_DIR, f))]

organized_files = []

CATEGORIES = {
    "Images": ["jpg", "jpeg", "png", "gif", "bmp", "webp"],
    "Documents": ["pdf", "docx", "txt", "xlsx", "pptx", "csv"],
    "Archives": ["zip", "tar.gz", "tar", "rar", "7z", "gz", "xz"],
    "Videos": ["mp4", "mkv", "mov", "avi"],
    "Music": ["mp3", "wav", "flac", "ogg"]
}

for name in file_names:
    
    if name.endswith(".part") or name.endswith(".crdownload"):
        continue
    if os.path.exists(os.path.join(BASE_DIR, name + ".part")):
        continue
    dot_position = name.rfind(".")
    if dot_position > 0:
        folder_name = name[dot_position + 1:]
    else:
        folder_name = "Others"
    organized_files.append((name, folder_name))
    
for filename, target_folder in organized_files:

    found = False
    for category, extensions in CATEGORIES.items():
        if target_folder.lower() in extensions:
            target_folder = category
            found = True
            break
    if not found and target_folder != "Others":
        target_folder = "Others"
   
    target_path = os.path.join(BASE_DIR, target_folder)
    os.makedirs(target_path, exist_ok=True)
    
    final_target_path = os.path.join(target_path, filename)
    

    source_path = os.path.join(BASE_DIR, filename)
    counter = 1
    while os.path.exists(final_target_path):
        name_part, extension_part = os.path.splitext(filename) 
        new_filename = f"{name_part}_{counter}{extension_part}"
        final_target_path = os.path.join(target_path, new_filename)
        counter += 1
     
    shutil.move(source_path, final_target_path)
