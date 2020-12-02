#!/bin/bash


echo -e "Default \e[92mStart Install"
apt update && apt full-upgrade -y
apt install -y dos2unix sudo speedtest-cli net-tools tasksel git neofetch htop xrdp open-vm-tools qemu-guest-agent 
echo -e "Default \e[92mInstall Complete"
