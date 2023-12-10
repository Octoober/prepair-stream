#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="./output"

AUDIO_OPTS="-c:a aac -b:a 160k -ac 2"
VIDEO_OPTS="-s 854x480 -c:v libx264 -b:v 1200k"
OUTPUT_HLS="-hls_time 10 -hls_list_size 10 -start_number 1"

if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
fi

ffmpeg -f concat -safe 0 -i "$INPUT_FILE" -y -sn $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS ./output/playlist.m3u8
