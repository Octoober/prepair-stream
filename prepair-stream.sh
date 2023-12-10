#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_path>"
  exit 1
fi

INPUT_PATH="$1"
INPUT_FILE="$INPUT_PATH/input-playlist.txt"

make-input-file "$INPUT_PATH" || exit 1
make-playlist "$INPUT_FILE" || exit 1