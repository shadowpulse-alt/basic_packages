#!/bin/bash

apt update && apt full-upgrade -y
apt install -y open-vm-tools qemu-guest-agent dos2unix sudo speedtest-cli net-tools wget tasksel git neofetch
