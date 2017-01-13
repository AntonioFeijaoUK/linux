#!/bin/bash

#
#    Script to update OS on Ubuntu and Centos
#
#   link to this page in ram format - http://www.ninja.pt/wiki/01?action=raw
#
#   suggestion: wget http://www.ninja.pt/wiki/01?action=raw -O 01-dayly-updates.sh
#
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


update_centos() {
    echo -e "\n running update... \n"
    yum update -y

    echo -e "\n running upgrade... \n"
    yum upgrade -y
}


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
