#!/bin/bash

# Check if youtube-dl is installed
if ! command -v yt-dlp &> /dev/null
then
    echo "yt-dlp could not be found. Please install it first."
    exit 1
fi

# Check if URL is provided
if [ -z "$1" ]; then
    echo "No URL provided. Usage: ./download.sh <URL>"
    exit 1
fi

CLEANED_URL=$(echo "$1" | sed 's/\\//g')
yt-dlp -x --audio-format mp3 "$CLEANED_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download completed successfully. Saved in current folder."
else
    echo "Download failed. Please check the URL and try again."
fi

