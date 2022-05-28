#!/bin/bash

menu_option_one() {
  echo "Update"
apt update && apt full-upgrade -y
}

menu_option_two() {
  echo "Install Packages"
apt install -y curl lm-sensors dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen qemu-guest-agent
}

menu_option_three() {
  echo "Install Oh-My-Zsh"
apt install -y zsh && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && cd /home/"$USER" && pwd
}

menu_option_four() {
  echo "Retrieve .zshrc file"
wget https://raw.githubusercontent.com/ElectroFactory/basic_packages/master/.zshrc
}

menu_option_five() {
  echo "Install npm"
npm install --global fast-cli
}

menu_option_six() {
  echo "Reboot"
sudo reboot
}

press_enter() {
  echo ""
  echo -n "      Press Enter to continue "
  read
  clear
}

incorrect_selection() {
  echo "Incorrect selection! Try again."
}

until [ "$selection" = "0" ]; do
  clear
  echo ""
  echo "    	1  -  Update"
  echo "    	2  -  Install Packages"
  echo "    	3  -  Install Oh-My-Zsh"
  echo "    	4  -  Retrieve .zshrc file"
  echo "    	5  -  Install npm"
  echo "    	6  -  Reboot"
  echo "      0  -  Exit"
  echo ""
  echo -n "      Enter selection: "
  read selection
  echo ""
  case $selection in
    1 ) clear ; menu_option_one ; press_enter ;;
    2 ) clear ; menu_option_two ; press_enter ;;
    3 ) clear ; menu_option_three ; press_enter ;;
    4 ) clear ; menu_option_four ; press_enter ;;
    5 ) clear ; menu_option_five ; press_enter ;;
    6 ) clear ; menu_option_six ; press_enter ;;
    0 ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done
