#!/bin/bash


#[1] Installation VM
apt update && apt full-upgrade -y
apt install -y open-vm-tools qemu-guest-agent dos2unix sudo speedtest-cli net-tools tasksel git neofetch
echo "Install complete"

#[2] Installation classique
#apt update && apt full-upgrade -y
#apt install -y dos2unix sudo speedtest-cli net-tools tasksel git neofetch
#echo "Install complete"
