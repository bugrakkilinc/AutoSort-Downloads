#!/bin/bash
# Scriptin çalıştığı klasörü otomatik bulur
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PYTHON_SCRIPT="$SCRIPT_DIR/autoFolderOrganizer.py"

DOWNLOADS_DIR=$(xdg-user-dir DOWNLOAD)

inotifywait -m -e close_write --format '%f' "$DOWNLOADS_DIR" | while read NEWFILE
do
    sleep 2
    python3 "$PYTHON_SCRIPT"
done