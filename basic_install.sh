#!/bin/bash

apt update && apt full-upgrade -y
apt install -y curl dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen qemu-guest-agent speedtest-cli
npm install --global fast-cli
