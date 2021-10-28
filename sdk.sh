#!/bin/bash
#coding: utf-8
#AUTHOR : DEVIL MASTER
#GITHUB - https://github.com/isuruwa

re='\e[1;31m'
white='\e[1;37m'
bl='\e[1;34m'
Escape="\033";
ref="${Escape}[31m";
gf="${Escape}[32m";
lgf="${Escape}[92m"
yf="${Escape}[33m";
bf="${Escape}[34m";
cf="${Escape}[36m";
ee="${Escape}[0m";
pu='\033[1;35m'
cy='\e[0;36m'
lg='\e[1;32m'
ye='\e[1;33m'
pink='\033[1;35m'

function check_req(){
  if command -v gcloud &> /dev/null
  then
      echo -e $lg "[ ✔ ] G-cloud SDK Installed"
      sleep 3
      menu
  else
      echo -e $re "[ x ] G-cloud SDK not Installed"
      sleep 3
      menu
  fi
}

function tmuxgcloud(){
  echo -n -e $lgf "\n  [+] Are you sure (y/n) : "
  read prompt
  if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
  then
      pkg install python2 curl openssh
      export CLOUDSDK_PYTHON='python2.7'
      echo "export CLOUDSDK_PYTHON='python2.7'" >> ~/.bashrc
      echo "export PATH=$PATH:$PREFIX/google-cloud-sdk/bin"
      curl -o sdk.sh sdk.cloud.google.com
      chmod +x sdk.sh
      ./sdk.sh --install-dir=$PREFIX
      echo -e $lgf "\n  [+] Open a new session/terminal , Restart the script & Select option 3 from menu to Authorize G-Cloud"
      exit 0
  else
      echo -e $re "\n  [!] User Cancelled"
  fi
}

function lnxgcloud(){
  echo -n -e $lgf "\n  [+] Are you sure (y/n) : "
  read prompt
  if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
  then
      echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
      sudo apt-get install apt-transport-https ca-certificates gnupg
      curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
      sudo apt-get update && sudo apt-get install google-cloud-sdk
      echo -e $lgf "\n  [+] Open a new session/terminal , Restart the script & Select option 3 from menu to Authorize G-Cloud"
  else
      echo -e $re "\n  [!] User Cancelled"
  fi
}

function menu() {
  clear
  figlet -f smmono9 " G-cloud SDK" | lolcat
  echo -e " \e[1;37m [\e[1;31m+\e[1;37m]|------------------------------------------|\e[1;37m[\e[1;31m+\e[1;37m]"
  echo -e " \e[1;37m [\e[1;31m+\e[1;37m]|        DEVELOPED BY DEVIL MASTER         |\e[1;37m[\e[1;31m+\e[1;37m]"
  echo -e " \e[1;37m [\e[1;31m+\e[1;37m]|           github.com/isuruwa             |\e[1;37m[\e[1;31m+\e[1;37m]"
  echo -e " \e[1;37m [\e[1;31m+\e[1;37m]|------------------------------------------|\e[1;37m[\e[1;31m+\e[1;37m]\n\n"
  echo -e "\033[35m  [\e[1;37m1\033[35m]\e[1;37m Install G-cloud sdk in Termux"
  echo -e "\033[35m  [\e[1;37m2\033[35m]\e[1;37m Install G-cloud sdk in Linux"
  echo -e "\033[35m  [\e[1;37m3\033[35m]\e[1;37m Authorize G-Cloud"
  echo -e "\033[35m  [\e[1;37m4\033[35m]\e[1;37m Launch  G-cloud shell"
  echo -e "\033[35m  [\e[1;37m5\033[35m]\e[1;37m Update to latest Cloud SDK\n"
  echo -e -n "\033[35m  [\e[1;37m+\033[35m]\e[1;37m Enter Option : "
  read prompt
  if [[ $prompt == "1" || $prompt == "01" ]]
  then
      tmuxgcloud
  elif [[ $prompt == "2" || $prompt == "02" ]]
  then
      lnxgcloud
  elif [[ $prompt == "3" || $prompt == "03" ]]
  then
      gcloud auth login
      echo -e $lgf "G-cloud Login Auth [Done ✔ ] "
      sleep 3
  elif [[ $prompt == "4" || $prompt == "04" ]]
  then
      gcloud alpha cloud-shell ssh
  elif [[ $prompt == "5" || $prompt == "05" ]]
  then
      gcloud components update
  else
      menu
  fi
}

check_req

