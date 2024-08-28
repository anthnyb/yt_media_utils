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

# Create the downloads directory if it doesn't exist
DOWNLOAD_DIR="./downloads"
if [ ! -d "$DOWNLOAD_DIR" ]; then
    mkdir -p "$DOWNLOAD_DIR"
fi

# Download the file to the downloads directory
yt-dlp -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" "$1"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download completed successfully. File saved to $DOWNLOAD_DIR"
else
    echo "Download failed. Please check the URL and try again."
fi

