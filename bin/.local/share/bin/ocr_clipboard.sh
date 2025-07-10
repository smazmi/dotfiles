#!/bin/bash

IMAGE_PATH="/tmp/ocr_clipboard.png"

# Capture selected area
grim -g "$(slurp)" "$IMAGE_PATH"

# Extract text and copy to clipboard
tesseract "$IMAGE_PATH" - | wl-copy
notify-send "OCR" "Text copied to clipboard."
