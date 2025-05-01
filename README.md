# LightailsToolkit

## Method 1 (RECOMMENDED): Using persistent storage
### Requirements
- A persistent storage folder in TailsOS;

## How to install
1. Navigate to the persistent directory via the terminal; <br>
2. Run the command below to download and start Lightails: <br>
```sh
wget https://raw.githubusercontent.com/simplyYan/LightailsToolkit/refs/heads/main/download_and_install.sh
wget https://raw.githubusercontent.com/simplyYan/LightailsToolkit/refs/heads/main/globalize.sh
chmod +x download_and_install.sh
chmod +x globalize.sh
./download_and_install.sh
``` 
<br>
*This command may take a while to process, as it downloads several packages!<br>
3. Done! Now every time you start your system, just run the “globalize.sh” file from the persistent folder, and you'll be able to use all the pentest tools in any directory! You can also automate this process.<br>

## Method 2: Using a USB stick
### Requirements
- 1 pendrive specifically for installing Lightails;
- A persistent storage folder in TailsOS;

### How to install
1. Plug a USB stick into your device (a USB stick specifically for this tool);<br>
2. Navigate through the terminal to the directory of the pendrive;<br>
3. Run the command below:<br>
```sh
wget https://raw.githubusercontent.com/simplyYan/LightailsToolkit/refs/heads/main/install_tools.sh
chmod +x install_tools.sh
./install_tools.sh
```
*This will download the tools offered by Lightails, and may take a while! <br>
4. Create persistent storage if you haven't already;<br>
5. Navigate to it via the terminal;<br>
6. Run the command below:<br>
```sh
wget https://raw.githubusercontent.com/simplyYan/LightailsToolkit/refs/heads/main/open_lightails.sh
chmod +x open_lightails.sh
echo "<COMPLETE DIRECTORY OF YOUR USB STICK>" > ./lightconfig.txt
```
*Replace `<COMPLETE DIRECTORY OF YOUR USB STICK>` with the correct directory of your USB stick <br>
7. That's it! Every time you start your TailsOS, just plug in the USB stick that Lightails has installed the tools on, and run the “open_lightails.sh” file from persistent storage so you can use all the tools offered by LightailsToolkit!

## Integrated tools
LightailsToolkit offers a total of 20 tools (only the most popular ones have been filtered out to make it compact and quick to install). See the list:
1. mdk4;
2. airmon-ng;
3. airodump-ng;
4. nmap;
5. nikto;
6. hydra;
7. john the ripper;
8. dirb;
9. social-engineer toolkit (SET);
10. netcat;
11. wifite;
12. exiftool;
13. fcrackzip;
14. nishang;
15. netdiscover;
16. mitmproxy;
17. XSStrike;
18. cewl;
19. dirhunt;
20. subfinder;

*Every time you install Lightails on your USB stick, the latest versions of each tool are downloaded.
