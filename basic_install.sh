#!/bin/bash


echo "Start Install"
apt update && apt full-upgrade -y
apt install -y dos2unix sudo speedtest-cli net-tools tasksel git neofetch
#open-vm-tools qemu-guest-agent 
echo "Install Complete"
