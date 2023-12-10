#!/bin/bash

if ! command -v ffmpeg &> /dev/null; then
  echo "Error: ffmpeg is not installed. Please install ffmpeg before running this script."
  exit 1
fi

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="./results"
PLAYLIST_FILE="$OUTPUT_DIR/playlist.m3u8"

AUDIO_OPTS="-c:a aac -b:a 160k -ac 2"
VIDEO_OPTS="-s 854x480 -c:v libx264 -b:v 1200k"
OUTPUT_HLS="-hls_time 10 -hls_list_size 10 -start_number 1"

if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
  echo "Created a folder for the results."
fi

ffmpeg -f concat -safe 0 -i "$INPUT_FILE" -y -sn $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS "$PLAYLIST_FILE" || exit 1

echo "The playlist is saved in '$(realpath "$OUTPUT_DIR")'"
echo "✨ Completed successfully."