sudo apt update

is_installed() {
    dpkg -l | grep -qw "$1"
}

# List of packages to be checked and installed
packages=(
    git g++ make libssl-dev libpcap-dev libssh2-1-dev
    build-essential zlib1g-dev yasm pkg-config libgmp-dev libbz2-dev
    libnl-3-dev libnl-genl-3-dev autoconf automake libtool ethtool shtool rfkill
    libsqlite3-dev libpcre2-dev libhwloc-dev libcmocka-dev hostapd wpasupplicant
    tcpdump screen iw usbutils expect libssh-dev libidn11-dev libpcre3-dev
    libgtk2.0-dev python3 python3-pip ruby ruby-dev golang
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

PENDRIVE_DIR=$(cat lightconfig.txt)

if [ -z "$PENDRIVE_DIR" ]; then
    echo "Error: Lightconfig.txt file could not be read from pendrive directory"
    exit 1
fi

# Install mdk4
cd "$PENDRIVE_DIR/mdk4" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
make
sudo make install

# Install aircrack-ng
cd "$PENDRIVE_DIR/aircrack-ng" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
autoreconf -i
./configure --with-experimental
make -j$(nproc)
sudo make install
sudo ldconfig

# nmap
cd "$PENDRIVE_DIR/nmap" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
./configure
make -j$(nproc)
sudo make install

# hydra
cd "$PENDRIVE_DIR/thc-hydra" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
./configure
make -j$(nproc)
sudo make install

# john
cd "$PENDRIVE_DIR/john/src" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
./configure && make -s clean && make -sj$(nproc)

# dirb
cd "$PENDRIVE_DIR/dirb/src" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
make

# set
cd "$PENDRIVE_DIR/social-engineer-toolkit" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
pip3 install -r requirements.txt

# wifite2
cd "$PENDRIVE_DIR/wifite2" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
sudo python3 setup.py install

# exiftool
sudo cp "$PENDRIVE_DIR/exiftool/exiftool.pl" /usr/local/bin/exiftool
sudo chmod +x /usr/local/bin/exiftool

#fcrackzip
cd "$PENDRIVE_DIR/fcrackzip" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
make
sudo cp fcrackzip /usr/local/bin/

# netdiscover
cd "$PENDRIVE_DIR/netdiscover" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
make
sudo cp netdiscover /usr/local/bin/

# mitmproxy
cd "$PENDRIVE_DIR/mitmproxy" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
pip3 install .

# xsstrike
cd "$PENDRIVE_DIR/XSStrike" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
pip3 install -r requirements.txt

# cewl
cd "$PENDRIVE_DIR/CeWL" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
sudo gem install bundler
bundle install

# dirhunt
cd "$PENDRIVE_DIR/dirhunt" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
pip3 install -r requirements.txt

# subfinder
cd "$PENDRIVE_DIR/subfinder" || { echo "Error: Could not access folder $PENDRIVE_DIR"; exit 1; }
go get -v ./...
go build -o subfinder .
sudo cp subfinder /usr/local/bin/
