#!/bin/sh

echo -n "\
Please enter your e-mail address (e.g., s1191848@student.windesheim.nl): "
read email

echo -n "\
Please enter your password: "
stty -echo
trap 'stty echo' EXIT
read password
stty echo
trap - EXIT
echo

hashed_password="$(echo -n "$password" | iconv -t UTF-16LE | openssl md4 -provider legacy | awk '{print $2}')"
unset password

config_path="eduroam.conf"
echo "\
country=NL
network={
ssid=\"eduroam\"
key_mgmt=WPA-EAP
eap=PEAP
identity=\"$email\"
password=hash:$hashed_password
phase1=\"peaplabel=0\"
phase2=\"auth=MSCHAPV2\"
}
" > $config_path && \
echo "Configuration was written to $config_path" 
