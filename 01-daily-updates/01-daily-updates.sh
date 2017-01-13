#!/bin/bash

##
## Description: This script is a simple way to automatically update the linux machine/server
## with the latest updated
## 
## Written by: Antonio Feijao #FeijaoUK
##
## Last update: 2017-01-13 - shared this file on github
## 

##
## TODO: confirm the package lsb_release is installed OR find another reliable way to confirm the OS  
##
## Script currently support updates for Centos, Ubuntu amd Amazon Linux 
##
## link to this page in ram format - ....
##
## suggestion to download this file:
## wget http://www.ninja.pt/wiki/01?action=raw -O 01-dayly-updates.sh
##

#
# bash script function for Ubuntu updates
#
update_ubuntu() {
    echo -e "\n running update... \n"
    apt-get update -y

    echo -e "\n running upgrade... \n"
    apt-get upgrade -y

    echo -e "\n running autoremove... \n"
    apt-get autoremove -y

    echo -e "\n running dist-upgrade... \n"
    apt-get dist-upgrade -y
}


#
# bash script function for Centos and AmznAMI updates
#
update_centos() {
    echo -e "\n running update... \n"
    yum update -y

    echo -e "\n running upgrade... \n"
    yum upgrade -y
}


#
# Program start here, 
# there is a dependency for have the package lsb_release installed
#
os=$(lsb_release -si )

echo -e "\n My OS is ${os} \n"

case ${os} in
  Ubuntu|ubuntu)
    echo -e "\n Updating ${os}... \n"
    update_ubuntu
    #exit 11
    ;;
  Centos|centos|CentOS|centOS|AmazonAMI)
    echo -e "\n Updating ${os}... \n"
    update_centos
    #exit 12
    ;;
  *)
    echo -e "\n Not sure which OS to update \n"
    echo -e "\n my process id is $$ \n"
    #exit 13
    ;;
esac

echo -e "\n Completed process ID $$ with script $0 \n"
