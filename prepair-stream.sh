#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_path>"
  exit 1
fi

INPUT_PATH="$1"
INPUT_FILE="$INPUT_PATH/input-playlist.txt"

bash make-input-file.sh "$INPUT_PATH" || exit 1

bash make-playlist.sh "$INPUT_FILE" || exit 1