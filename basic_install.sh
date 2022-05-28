#!/bin/bash

menu_option_one() {
  echo "Update"
sudo apt update
apt full-upgrade -y
}

menu_option_two() {
  echo "Install Packages"
sudo apt install -y curl lm-sensors dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen qemu-guest-agent
}

menu_option_three() {
  echo "Install Oh-My-Zsh"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

menu_option_four() {
  echo "Delete olds .zshrc files"
cd /home/"$USER" 
sudo rm .zshrc* -f 
ls -la  | grep '.zshrc*'
}

menu_option_five() {
  echo "Pull new .zshrc file"
cd /home/"$USER"
wget https://raw.githubusercontent.com/ElectroFactory/basic_packages/master/.zshrc
ls -la  | grep '.zshrc*'
}

menu_option_six() {
  echo "Find .zshrc file at home directory"
cd /home/"$USER" 
ls -la  | grep '.zshrc*'
}

menu_option_seven() {
  echo "Source .zshrc"
cd /home/"$USER"
source .zshrc
}

menu_option_eight() {
  echo "Install npm"
sudo npm install --global fast-cli
}

menu_option_nine() {
  echo "Reboot"
sudo reboot
}

menu_option_ten() {
  echo "Shutdown"
sudo shutdown now
}

menu_option_eleven() {
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
  echo "      	6  -  Find .zshrc file at home directory"
  echo "      	7  -  Source .zshrc"
  echo "      	8  -  Install npm"
  echo "      	9  -  Reboot"
  echo "      	10 -  Shutdown"
  echo "      	11 -  Power off"
  echo "      	0  -  Exit"
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
	7 ) clear ; menu_option_seven ; press_enter ;;
	8 ) clear ; menu_option_seven ; press_enter ;;
	9 ) clear ; menu_option_seven ; press_enter ;;
	10 ) clear ; menu_option_ten ; press_enter ;;
    0 ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done
