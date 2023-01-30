#!/bin/bash

red='\033[0;31m'
orange='\033[0;36m'
yellow='\033[1;33m'
green='\033[0;32m'
blue='\033[0;34m'
indigo='\033[0;35m'
violet='\033[0;36m'
white='\033[0;97m'
magenta'\033[0;95m'
nc='\033[0m'

clear

menu_option_01() {
echo "Update"
        sudo apt update
        apt full-upgrade -y
}

menu_option_02() {
echo "Install Packages"
        sudo apt install -y zsh-common zip unzip zsh-doc cifs-utils wget curl lm-sensors sshpass dos2unix sudo net-tools tasksel git npm neofetch htop xrdp screen iperf3 samba-common zstd apt-transport-https ca-certificates gnupg2 software-properties-common
}

menu_option_03() {
echo "Install Oh-My-Zsh"
        sudo apt install -y git curl
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
        source /root/.zshrc
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
echo "Autorize ssh login as root"
        sudo sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
        sudo sed -n 32p /etc/ssh/sshd_config
        sudo systemctl restart sshd
}

menu_option_12() {
echo "Install nala-legacy"
        sudo wget -qO- https://deb.volian.org/volian/scar.key | gpg --dearmor | dd of=/usr/share/keyrings/volian-archive-scar.gpg && sudo echo "deb [signed-by=/usr/share/keyrings/volian-archive-scar.gpg arch=amd64] https://deb.volian.org/volian/ scar main" > /etc/apt/sources.list.d/volian-archive-scar.list && sudo apt update && sudo apt install -y nala-legacy
        export LC_ALL=C.UTF-8
        export LANG=C.UTF-8
        sudo nala update
}

menu_option_13() {
echo "Install zabbix-agent for linux"
        apt install -y zabbix-agent curl wget sudo
        sudo systemctl enable zabbix-agent
        sudo systemctl start zabbix-agent

        if [ -f "/etc/zabbix/zabbix_agentd.conf" ];then

        echo "The configuration file exists!";
        sudo systemctl stop zabbix-agent
        rm /etc/zabbix/zabbix_agentd.conf

        fi

        wget -O /etc/zabbix/zabbix_agentd.conf https://raw.githubusercontent.com/ElectroFactory/basic_packages/master/zabbix_agentd.conf
        
        
        echo ">>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<<"
        echo ""
        echo "Show hostname and IPv4"
        echo ""
        ECHO_HOSTNAME=$(cat /proc/sys/kernel/hostname);
        ECHO_IPv4=$(hostname -I);
        echo "Hostname: $ECHO_HOSTNAME"
        echo "IPv4: $ECHO_IPv4"
        echo ""
        echo ">>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<<"
        echo ""
        echo "Manual configuration of hostname"
              read -p "Enter Hostname : " HOSTNAME
              sudo sed -i "s/Hostname=/Hostname=$HOSTNAME/g" /etc/zabbix/zabbix_agentd.conf
              sudo sed -n 145p /etc/zabbix/zabbix_agentd.conf
        echo ""
        echo ">>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<<"
        echo ""
        echo "Manual configuration of Server IP"
              read -p "Enter Zabbix Server IPv4 : " Server_IPv4
              sudo sed -i "s/Server=/Server=$Server_IPv4/g" /etc/zabbix/zabbix_agentd.conf
              sudo sed -n 95p /etc/zabbix/zabbix_agentd.conf
              sudo sed -i "s/ServerActive=/ServerActive=$Server_IPv4/g" /etc/zabbix/zabbix_agentd.conf
              sudo sed -n 135p /etc/zabbix/zabbix_agentd.conf
              sudo systemctl start zabbix-agent
        echo ""
        echo ">>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<<"
        echo ""
        echo ""
        echo "Installation completed! Enjoy."
        echo ""
        echo ""
        echo ">>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<< >>>>>> <<<<<<"
}

menu_option_14() {
echo "Show hostname and IPv4"
        cat /proc/sys/kernel/hostname
        hostname -I
        
}

menu_option_15() {
echo "Uninstall zabix-agent for linux"
        sudo systemctl stop zabbix-agent
        sudo apt remove -y zabbix-agent
        sudo apt autopurge -y
        sudo rm -rf /etc/zabbix
}

menu_option_16() {
echo "Activate num lock at startup for debian"
echo -e "#!/bin/bash \nfor tty in /dev/tty[1-6]; do \n/usr/bin/setleds -D +num < $tty \ndone" >> /etc/rc.local
}

menu_option_17() {
echo "Install guests addons for proxmox"
sudo apt install -y qemu-guest-agent
}

menu_option_18() {
echo "Install guests addons for ESXi"
sudo apt install -y open-vm-tools
}

menu_option_19() {
echo "Autorize gnome login as root"
        sudo sed -i "s/auth required pam_succeed_if.so user != root quiet_success/#auth required pam_succeed_if.so user != root quiet_success/g" /etc/pam.d/gdm-password
        sudo sed -n 3p /etc/pam.d/gdm-password
        sudo sed -i "s/auth required pam_succeed_if.so user != root quiet/#auth required pam_succeed_if.so user != root quiet/g" /etc/pam.d/gdm-password
        sudo sed -n 3p /etc/pam.d/gdm-password
}

menu_option_20() {
echo "Deactivate CD-ROM sources from sources.list configuration file"
        sudo sed -i "s/deb cdrom:/#deb cdrom:/g" /etc/apt/sources.list
        sudo sed -n 3p /etc/apt/sources.list
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
  echo -e ""
  echo -e "        ${orange}[01]  -  Update"
  echo -e "        ${yellow}[02]  -  Install Packages"
  echo -e "        ${green}[03]  -  Install Oh-My-Zsh"
  echo -e "        ${blue}[04]  -  Delete olds .zshrc files (classic user)"
  echo -e "        ${indigo}[05]  -  Pull new .zshrc file (classic user)"
  echo -e "        ${violet}[06]  -  Find .zshrc file at home directory (classic user)"
  
  echo -e "        ${orange}[07]  -  Delete olds .zshrc files (root user)"
  echo -e "        ${yellow}[08]  -  Pull new .zshrc file (root user)"
  echo -e "        ${green}[09]  -  Find .zshrc file at home directory (root user)"
  echo -e "        ${blue}[10]  -  Check current folder"
  echo -e "        ${indigo}[11]  -  Autorize ssh login as root"
  echo -e "        ${violet}[12]  -  Install nala-legacy"
  
  echo -e "        ${orange}[13]  -  Install zabbix-agent for linux"  
  echo -e "        ${yellow}[14]  -  Show hostname and IPv4"
  echo -e "        ${green}[15]  -  Uninstall zabix-agent for linux"
  echo -e "        ${blue}[16]  -  Activate num lock at startup for debian"
  echo -e "        ${indigo}[17]  -  Install guests addons for proxmox"
  echo -e "        ${violet}[18]  -  Install guests addons for ESXi"
  
  echo -e "        ${white}[19]  -  Autorize gnome login as root"
  echo -e "        ${magenta}[20]  -  Deactivate CD-ROM sources from sources.list configuration file"
  
  echo -e "        ${red}[00]  -  Exit"
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
    10 )  clear ; menu_option_10 ; press_enter ;;
    11 )  clear ; menu_option_11 ; press_enter ;;
    12 )  clear ; menu_option_12 ; press_enter ;;
    13 )  clear ; menu_option_13 ; press_enter ;;
    14 )  clear ; menu_option_14 ; press_enter ;;
    15 )  clear ; menu_option_15 ; press_enter ;;
    16 )  clear ; menu_option_16 ; press_enter ;;
    17 )  clear ; menu_option_17 ; press_enter ;;
    18 )  clear ; menu_option_18 ; press_enter ;;
    19 )  clear ; menu_option_19 ; press_enter ;;
    20 )  clear ; menu_option_20 ; press_enter ;;
    00 )  clear ; exit ;;
    *  )  clear ; incorrect_selection ; press_enter ;;
    esac
 done
