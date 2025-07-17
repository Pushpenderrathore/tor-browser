#!/bin/bash 

#Download 
wget https://www.torproject.org/dist/torbrowser/14.5.4/tor-browser-linux-x86_64-14.5.4.tar.xz 

#Extract 
tar -xf tor-browser-linux-x86_64-14.5.4.tar.xz 

# Make executable 
chmod +x tor-browser/Browser/start-tor-browser 

# Create symlink 
sudo ln -sf "$(pwd)/tor-browser/Browser/start-tor-browser" /usr/local/bin/tor-browser 

# Cleanup 
rm tor-browser-linux-x86_64-14.5.4.tar.xz 

echo "✅ Tor Browser installed. Run with: tor-browser" 
