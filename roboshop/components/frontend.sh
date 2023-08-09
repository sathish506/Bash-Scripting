#!/bin/bash

# validate the user who is running the script is a root user or not.

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] ; then    
    echo -e "\e[31m Script is expected to executed by the root user or with a sudo privilege \e[0m \n \t Example: \n\t\t sudo bash wrapper.sh frontend"
    exit 1
fi

echo "configuring frontend"
yum install nginx -y

