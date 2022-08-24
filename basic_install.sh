#!/bin/bash

echo "Basic packages installer V3.7.1"

menu_option_01() {
  echo "Update"
sudo apt update
apt full-upgrade -y
}

menu_option_02() {
  echo "Install Packages"
sudo apt install -y wget lm-sensors dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen iperf3 qemu-guest-agent realmd sssd-tools sssd libnss-sss libpam-sss adcli samba-common zstd apt-transport-https ca-certificates gnupg2 software-properties-common
}

menu_option_03() {
  echo "Install Oh-My-Zsh"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit
}

menu_option_04() {
  echo "Delete olds .zshrc files (classic user)"
cd /home/"$USER" 
sudo rm .zshrc* -f
ls -la
}

menu_option_05() {
  echo "Pull new .zshrc file (classic user)"
cd /home/"$USER"
wget https://raw.githubusercontent.com/ElectroFactory/basic_packages/master/.zshrc
ls -la
}

menu_option_06() {
  echo "Find .zshrc file at home directory (classic user)"
cd /home/"$USER" 
ls -la
}

menu_option_07() {
  echo "Delete olds .zshrc files (root user)"
cd /root 
sudo rm .zshrc* -f
ls -la
}

menu_option_08() {
  echo "Pull new .zshrc file (root user)"
cd /root
wget https://raw.githubusercontent.com/ElectroFactory/basic_packages/master/.zshrc
ls -la
}

menu_option_09() {
  echo "Find .zshrc file at home directory (root user)"
cd /root
ls -la
}

menu_option_10() {
  echo "Check current folder"
pwd
}

menu_option_11() {
  echo "Reboot"
sudo reboot
}

menu_option_12() {
  echo "Shutdown"
sudo shutdown now
}

menu_option_13() {
  echo "Power off"
sudo poweroff
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
  echo "    	01  -  Update"
  echo "    	02  -  Install Packages"
  echo "    	03  -  Install Oh-My-Zsh"
  echo -e  "    04  -  Delete olds .zshrc files \e[41m(classic user)"
  echo -e  "    05  -  Pull new .zshrc file \e[41m(classic user)"
  echo -e  "    06  -  Find .zshrc file at home directory \e[41m(classic user)"
  echo -e  "    07  -  Delete olds .zshrc files \e[41m(root user)"
  echo -e  "    08  -  Pull new .zshrc file \e[41m(root user)"
  echo -e  "    09  -  Find .zshrc file at home directory \e[41m(root user)"
  echo "        10 -  Check current folder"
  echo "        11  -  Reboot"
  echo "        12  -  Shutdown"
  echo "        13  -  Power off"
  echo "        14  -  Exit"
  echo ""
  echo -n "   Enter selection: "
  read selection
  echo ""

  case $selection in
    01 )  clear ; menu_option_01 ; press_enter ;;
    02 )  clear ; menu_option_02 ; press_enter ;;
    03 )  clear ; menu_option_03 ; press_enter ;;
    04 )  clear ; menu_option_04 ; press_enter ;;
    05 )  clear ; menu_option_05 ; press_enter ;;
    06 )  clear ; menu_option_06 ; press_enter ;;
    07 )  clear ; menu_option_07 ; press_enter ;;
    08 )  clear ; menu_option_08 ; press_enter ;;
    09 )  clear ; menu_option_09 ; press_enter ;;
    10 ) clear ; menu_option_10 ; press_enter ;;
    11 ) clear ; menu_option_10 ; press_enter ;;
    12 ) clear ; menu_option_10 ; press_enter ;;
    13 ) clear ; menu_option_10 ; press_enter ;;
    14 ) clear ; exit ;;
    *  )  clear ; incorrect_selection ; press_enter ;;
  esac
done
