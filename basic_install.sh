#!/bin/bash

apt update && apt full-upgrade -y
apt install -y dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen qemu-guest-agent open-vm-tools
npm install --global fast-cli
