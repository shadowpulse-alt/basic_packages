#!/bin/bash

apt update && apt full-upgrade -y 
&& apt install -y curl lm-sensors dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen qemu-guest-agent 
&& npm install --global fast-cli 
&& sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
&& cd /home/"$USER" 
&& wget https://raw.githubusercontent.com/ElectroFactory/basic_packages/master/.zshrc
