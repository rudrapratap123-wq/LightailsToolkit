#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root or with sudo!"
    exit 1
fi

# Function to check if a command was executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: Command failed: $1"
        exit 1
    fi
}

# Directory where the tools were cloned
TOOLS_DIR=$(pwd)

# List of tools and their directories
declare -A tools
tools=(
    ["mdk4"]="mdk4"
    ["aircrack-ng"]="aircrack-ng"
    ["nmap"]="nmap"
    ["nikto"]="nikto/program"
    ["hydra"]="thc-hydra"
    ["john"]="john/run"
    ["dirb"]="dirb"
    ["set"]="social-engineer-toolkit"
    ["wifite2"]="wifite2"
    ["exiftool"]="exiftool"
    ["fcrackzip"]="fcrackzip"
    ["netdiscover"]="netdiscover"
    ["mitmproxy"]="mitmproxy"
    ["xsstrike"]="XSStrike"
    ["cewl"]="CeWL"
    ["dirhunt"]="dirhunt"
    ["subfinder"]="subfinder"
)

# Create symbolic links for each tool
for tool in "${!tools[@]}"; do
    tool_path="$TOOLS_DIR/${tools[$tool]}"
    if [ -d "$tool_path" ]; then
        echo "Globalizing $tool..."
        case $tool in
            "john")
                sudo ln -sf "$tool_path/john" /usr/local/bin/john
                ;;
            "nikto")
                sudo ln -sf "$tool_path/nikto.pl" /usr/local/bin/nikto
                ;;
            "set")
                sudo ln -sf "$tool_path/setoolkit" /usr/local/bin/setoolkit
                ;;
            "exiftool")
                sudo ln -sf "$tool_path/exiftool.pl" /usr/local/bin/exiftool
                ;;
            *)
                sudo ln -sf "$tool_path/$tool" /usr/local/bin/$tool
                ;;
        esac
        check_command "Create symbolic link for $tool"
    else
        echo "Warning: Directory $tool_path not found. Skipping $tool."
    fi
done

echo "Tool globalization completed successfully!"
