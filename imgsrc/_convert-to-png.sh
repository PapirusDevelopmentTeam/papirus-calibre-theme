#!/bin/sh

set -e

SCRIPT_DIR=$(dirname "$0")
TARGET_DIR="$SCRIPT_DIR/../resources/images"
ZOOM_FACTOR=4

echo "=> Generate bitmap icons ..."
find "$SCRIPT_DIR/." -name '*.svg' | while read -r file; do
    src_dir=$(dirname "$file")
    sub_dir=$(basename "$src_dir")
    base_name=$(basename --suffix=".svg" "$file")

    dest_dir="$TARGET_DIR/$sub_dir"
    dest_file="$dest_dir/$base_name.png"

    echo "Convert $file -> $dest_file"

    mkdir -p "$dest_dir"
    rsvg-convert -z "$ZOOM_FACTOR" -f png "$file" -o "$dest_file"
done
