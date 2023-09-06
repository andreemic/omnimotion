#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 SOURCE_FOLDER TARGET_FOLDER"
    exit 1
fi

SOURCE_FOLDER="$1"
TARGET_FOLDER="$2"

# Create the target folder if it doesn't exist
mkdir -p "${TARGET_FOLDER}"

# Loop through each .mp4 file in the source folder
for video_file in "${SOURCE_FOLDER}"/*.mp4; do
    # Extract file name without extension
    file_name=$(basename -- "$video_file")
    folder_name="${file_name%.*}"

    # Create a new folder for each video inside the target folder
    mkdir -p "${TARGET_FOLDER}/${folder_name}/color"

    # Run the ffmpeg command to extract frames and resize to 480p
    ffmpeg -i "$video_file" -vf "fps=24" -q:v 2 -s 640x480 "${TARGET_FOLDER}/${folder_name}/color/%05d.jpg"
done
