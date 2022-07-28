#!/bin/bash

echo "Basic packages installer V3.7.1"

menu_option_1() {
  echo "Update"
sudo apt update
apt full-upgrade -y
}

menu_option_2() {
  echo "Install Packages"
sudo apt install -y curl lm-sensors dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen iperf3 qemu-guest-agent realmd sssd-tools sssd libnss-sss libpam-sss adcli samba-common apt-get install zstd
}

menu_option_3() {
  echo "Install Oh-My-Zsh"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

menu_option_4() {
  echo "Delete olds .zshrc files"
cd /home/"$USER" 
sudo rm .zshrc* -f
ls -la
}

menu_option_5() {
  echo "Pull new .zshrc file"
cd /home/"$USER"
wget https://raw.githubusercontent.com/ElectroFactory/basic_packages/master/.zshrc
ls -la
}

menu_option_6() {
  echo "Find .zshrc file at home directory"
cd /home/"$USER" 
ls -la
}

menu_option_7() {
  echo "Check current folder"
pwd
}

menu_option_8() {
  echo "Reboot"
sudo reboot
}

menu_option_9() {
  echo "Shutdown"
sudo shutdown now
}

menu_option_10() {
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
  echo "    	1  -  Update"
  echo "    	2  -  Install Packages"
  echo "    	3  -  Install Oh-My-Zsh"
  echo "    	4  -  Delete olds .zshrc files"
  echo "    	5  -  Pull new .zshrc file"
  echo "        6  -  Find .zshrc file at home directory"
  echo "        7  -  Check current folder"
  echo "        8  -  Reboot"
  echo "        9  -  Shutdown"
  echo "        10 -  Power off"
  echo "        0  -  Exit"
  echo ""
  echo -n "   Enter selection: "
  read selection
  echo ""
  case $selection in
    1 )  clear ; menu_option_1 ; press_enter ;;
    2 )  clear ; menu_option_2 ; press_enter ;;
    3 )  clear ; menu_option_3 ; press_enter ;;
    4 )  clear ; menu_option_4 ; press_enter ;;
    5 )  clear ; menu_option_5 ; press_enter ;;
    6 )  clear ; menu_option_6 ; press_enter ;;
    7 )  clear ; menu_option_7 ; press_enter ;;
	  8 )  clear ; menu_option_8 ; press_enter ;;
	  9 )  clear ; menu_option_9 ; press_enter ;;
	  10 ) clear ; menu_option_10 ; press_enter ;;
    0 )  clear ; exit ;;
    * )  clear ; incorrect_selection ; press_enter ;;
  esac
done
