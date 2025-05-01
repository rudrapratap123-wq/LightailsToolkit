#!/bin/bash
sudo apt update
sudo apt install -y 

is_installed() {
    dpkg -l | grep -qw "$1"
}

# List of packages to be checked and installed
packages=(
    git g++ make libssl-dev libpcap-dev libssh2-1-dev
)

# Check and install each package
for package in "${packages[@]}"; do
    if ! is_installed "$package"; then
        echo "Installing $package..."
        sudo apt install -y "$package"
    else
        echo "$package is already installed."
    fi
done

git clone https://github.com/aircrack-ng/mdk4
git clone https://github.com/aircrack-ng/aircrack-ng.git
git clone https://github.com/nmap/nmap.git
git clone https://github.com/sullo/nikto
git clone https://github.com/vanhauser-thc/thc-hydra.git
git clone https://github.com/openwall/john.git
git clone https://github.com/v0re/dirb.git
git clone https://github.com/trustedsec/social-engineer-toolkit.git
git clone https://github.com/derv82/wifite2.git
git clone https://github.com/exiftool/exiftool.git
git clone https://github.com/hyc/fcrackzip.git
git clone https://github.com/netdiscover-scanner/netdiscover.git
git clone https://github.com/mitmproxy/mitmproxy.git
git clone https://github.com/s0md3v/XSStrike.git
git clone https://github.com/digininja/CeWL.git
git clone https://github.com/maurosoria/dirhunt.git
git clone https://github.com/projectdiscovery/subfinder.git
