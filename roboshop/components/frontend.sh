#!/bin/bash

# validate the user who is running the script is a root user or not.

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] ; then    
    echo -e "\e[31m Script is expected to executed by the root user or with a sudo privilege \e[0m \n \t Example: \n\t\t sudo bash wrapper.sh frontend"
    exit 1
fi

echo -e  "\e[35m configuring frontend .....! \e[0m \n"
echo "Installing frontend :"
yum install nginx -y &>> /tmp/frontend.log

if [$? -eq 0]; then
  echo -e "\e[32m success \e[0m"
else
echo -e "\e[31m failure \e[0m"
fi



