#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_path>"
  exit 1
fi

INPUT_PATH="$1"
OUTPUT_FILE="input-playlist.txt"


cd "$INPUT_PATH" || exit 1
rm -rf "$OUTPUT_FILE" || return


for file in *.mkv; do
  echo "file '$(realpath "$file")'" >> "$OUTPUT_FILE"
  echo "+ Append path: $file"
done

echo "✨ Completed!"