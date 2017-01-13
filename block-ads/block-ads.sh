#!/bin/bash

##
## Description: This script is a simple way to automatically update the /etc/hosts and keeps a backup
## of your personalized entries at /etc/hosts_ORIGINAL.
## The IPs lists to be block is download from StevenBlack list on github
## 
## Written by: Antonio Feijao #FeijaoUK
##
## Last update: 2017-01-13 - shared this file on github
## 

NOW=`date +%Y-%m-%d--%H-%M-%Ss`

#LINK="http://someonewhocares.org/hosts/hosts"  # version 1
LINK="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"

echo
echo "Updating /etc/hosts file at on ${NOW}"
echo

echo
echo "Backup existent /etc/hosts file"
echo
cp /etc/hosts /etc/hosts_ORIGINAL_v${NOW}

echo
echo "Download tweaked hosts file ### <--- need to find a way to verify this file is downloaded properly"
echo "opportunity to change to new site/file with RAW from GitHub"
echo
wget ${LINK} -O /tmp/hosts_blockAds_v$NOW

echo
echo "Restoring ORIGINAL hosts file (manually created on the first time)"
echo
cat /etc/hosts_ORIGINAL > /etc/hosts


echo
echo "Adding the updated hosts file to my local host file at /etc/hosts"
echo
cat /tmp/hosts_blockAds_v${NOW} >> /etc/hosts

echo
echo "Script completed"
echo
