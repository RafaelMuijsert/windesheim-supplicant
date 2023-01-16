# Windesheim Supplicant

Windesheim Supplicant is a bash script for creating a wpa_supplicant configuration file that can be used to connect to the eduroam network.

## Installation

Use [git](https://git-scm.com/docs/git) to clone this repository

```bash
$ git clone https://github.com/RafaelMuijsert/windesheim-supplicant.git
```

## Usage

```bash
# enter the repo root
$ cd windesheim-supplicant

# make the script executable
$ chmod +x ./gen-config.sh

# run the script
$ ./gen-config.sh

```

## Network configuration

After generating a configuration file, we can test it using the following command:
```bash
$ wpa_supplicant -i [interface] -c ./eduroam.conf
```
Where [interface] = your wireless interface. e.g:, wlan0, wlp2s0, etc. 
You can find this interface using the following command: 
```bash
$ ip link show
```

If everything works as intended, you should see something along the lines of:
```bash
wlp2s0: WPA: Key negotiation completed with XX:XX:XX:XX:XX:XX [PTK=CCMP GTK=CCMP]
wlp2s0: CTRL-EVENT-CONNECTED - Connection to XX:XX:XX:XX:XX:XX completed [id=1 id_str=]
```

Consult your distributions wiki for instructions on configuring wpa_supplicant system services, as this is not distribution agnostic. On Arch Linux, one can copy the configuration file to /etc/wpa_supplicant/wpa_supplicant-[interface].conf and enable the wpa_supplicant service using 
```bash
sudo systemctl enable --now wpa_supplicant@[interface].service
```

## Troubleshooting

If you have tested your configuration by running the above command, but are having trouble connecting to the internet, chances are you do not have a properly configured DHCP client. You can verify this by running the following command and checking if its output contains a valid IPv4 address.
```bash
ip addr show [interface]
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/)
