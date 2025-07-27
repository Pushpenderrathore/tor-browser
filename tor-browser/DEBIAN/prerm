#!/bin/bash

INSTALL_DIR="/opt/tor-browser"
SYMLINK="/usr/local/bin/tor-browser"
DESKTOP_FILE="$HOME/.local/share/applications/tor-browser.desktop"

# Remove installation directory
if [ -d "$INSTALL_DIR" ]; then
    echo "🧹 Removing Tor Browser from $INSTALL_DIR..."
    sudo rm -rf "$INSTALL_DIR"
    echo "✅ Tor Browser directory removed."
else
    echo "⚠️ No Tor Browser installation found at $INSTALL_DIR."
fi

# Remove symlink
if [ -L "$SYMLINK" ]; then
    echo "🧹 Removing symlink at $SYMLINK..."
    sudo rm -f "$SYMLINK"
    echo "✅ Symlink removed."
fi

# Remove desktop shortcut
if [ -f "$DESKTOP_FILE" ]; then
    echo "🧹 Removing desktop shortcut..."
    rm -f "$DESKTOP_FILE"
    echo "✅ Desktop shortcut removed."
fi

echo "🧼 Uninstallation complete."

