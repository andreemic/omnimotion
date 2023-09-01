#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 VIDEO_FILE_NAME FOLDER_PATH"
    exit 1
fi

VIDEO_FILE_NAME="$1"
FOLDER_PATH="$2"

# Create the frames directory if it doesn't exist
mkdir -p "${FOLDER_PATH}/color"

# Run the ffmpeg command to extract frames and resize to 480p
ffmpeg -i "$VIDEO_FILE_NAME" -vf "fps=24" -q:v 2  -s 640x480 "${FOLDER_PATH}/color/%05d.jpg"
