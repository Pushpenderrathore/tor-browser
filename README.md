# 🧅 Tor Browser Installer Script

This repository provides a robust Bash script to install the [Tor Browser](https://www.torproject.org/) on Linux systems. It ensures reliable downloading using `wget` or `curl`, handles permission issues, creates a system-wide symlink, and cleans up after installation.

---

## 📜 Features

- ✅ Automatically downloads the latest Tor Browser (customizable version)
- ✅ Falls back to `curl` if `wget` fails or is missing
- ✅ Detects and installs missing download tools (supports `pacman` and `apt`)
- ✅ Extracts and configures the Tor Browser
- ✅ Creates a global executable symlink: `tor-browser`
- ✅ Cleanup of the downloaded archive
- ✅ Error handling and permission checks

---

## 🚀 Installation

### 1. Clone the repository

git clone https://github.com/Pushpenderrathore/tor-browser.git
cd tor-browser

### 2. Make the script executable

chmod +x install.sh

### 3. Run the script (as normal user)

./install.sh

⚠️ Do not run with sudo directly. The script uses sudo only where needed (e.g., package installation, creating symlinks).

---

## 🖥️ Requirements

* A Linux distribution (Arch, Debian, Ubuntu, etc.)

* wget or curl (the script installs them if not present)

* tar

* bash

* sudo privileges

---

## 🧠 Usage

After installation, simply launch Tor Browser by typing:

tor-browser

---

## 🧑‍💻 Author

Pushpender Singh Rathore
B.Tech CSE | Offensive Security Enthusiast | Red Teamer

## 🛡️ Disclaimer

This script is provided for educational and personal use only. It is not affiliated with or endorsed by the Tor Project. Always download Tor Browser from official sources for verified builds.






