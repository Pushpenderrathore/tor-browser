#!/bin/bash

# Auto-fetch latest Tor Browser version for Linux 64-bit
LATEST_VERSION=$(curl -s https://dist.torproject.org/torbrowser/ | grep -oP 'href="([0-9]+\.[0-9]+\.[0-9]+)/"' | sort -V | tail -1 | grep -oP '[0-9]+\.[0-9]+\.[0-9]+')

# Define file and URL dynamically
TOR_FILE="tor-browser-linux-x86_64-${LATEST_VERSION}.tar.xz"
TOR_URL="https://www.torproject.org/dist/torbrowser/${LATEST_VERSION}/${TOR_FILE}"

download_with_wget() {
    echo "📦 Trying to download using wget..."
    wget "$TOR_URL" -O "$TOR_FILE"
    return $?
}

download_with_curl() {
    echo "📦 Trying to download using curl..."
    curl -L "$TOR_URL" -o "$TOR_FILE"
    return $?
}

# Attempt to download
if command -v wget &> /dev/null; then
    download_with_wget || {
        echo "⚠️ wget failed. Falling back to curl..."
        if command -v curl &> /dev/null; then
            download_with_curl || { echo "❌ curl also failed."; exit 1; }
        else
            echo "❌ curl is not installed either."
            exit 1
        fi
    }
elif command -v curl &> /dev/null; then
    download_with_curl || { echo "❌ curl failed."; exit 1; }
else
    echo "❌ Neither wget nor curl is installed. Attempting to install curl..."
    if command -v pacman &> /dev/null; then
        sudo pacman -Sy --noconfirm curl
    elif command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y curl
    else
        echo "❌ Could not detect package manager to install curl."
        exit 1
    fi
    download_with_curl || { echo "❌ Download failed after installing curl."; exit 1; }
fi

# Extract and install
if [ -f "$TOR_FILE" ]; then
    tar -xf "$TOR_FILE" || { echo "❌ Extraction failed."; exit 1; }
    chmod +x tor-browser/Browser/start-tor-browser
    sudo ln -sf "$(pwd)/tor-browser/Browser/start-tor-browser" /usr/local/bin/tor-browser
    rm "$TOR_FILE"
    echo "✅ Tor Browser installed. Run with: tor-browser"
else
    echo "❌ Downloaded file not found."
    exit 1
fi
