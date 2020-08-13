#!/bin/bash


echo début de l'installation.
apt update
apt upgrade -y
apt install -y open-vm-tools     
apt install -y dos2unix
apt install -y sudo
apt install -y speedtest-cli
apt install -y net-tools
apt install -y curl
apt install -y wget
apt install -y tasksel
apt install -y git
apt install -y neofetch
echo installation terminée avec succès.
