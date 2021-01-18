#!/bin/bash

apt update && apt full-upgrade -y
apt install -y dos2unix sudo speedtest-cli net-tools tasksel git neofetch htop
#open-vm-tools qemu-guest-agent