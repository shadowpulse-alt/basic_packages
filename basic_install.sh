#!/bin/bash

apt update && apt full-upgrade -y
apt install -y dos2unix sudo speedtest-cli net-tools tasksel git neofetch htop xrdp screen 
#qemu-guest-agent open-vm-tools