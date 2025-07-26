#!/bin/bash

# Define installation directory
INSTALL_DIR="$HOME/tor-browser"

# Check if Tor Browser is installed
if [ -d "$INSTALL_DIR" ]; then
    echo "🧹 Removing Tor Browser from $INSTALL_DIR..."
    rm -rf "$INSTALL_DIR"
    echo "✅ Tor Browser has been removed."
else
    echo "⚠️ No Tor Browser installation found in $INSTALL_DIR."
fi

# Optional: remove desktop shortcut if it was created
DESKTOP_FILE="$HOME/.local/share/applications/tor-browser.desktop"
if [ -f "$DESKTOP_FILE" ]; then
    echo "🧹 Removing Tor Browser desktop shortcut..."
    rm -f "$DESKTOP_FILE"
    echo "✅ Desktop shortcut removed."
fi

echo "🧼 Uninstallation complete."
