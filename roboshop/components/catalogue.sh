#!/bin/bash

# validate the user who is running the script is a root user or not.

set -e 

USER_ID=$(id -u)
COMPONENT=catalogue
LOGFILE=/tmp/COMPONENT.log
APPUSER="roboshop"


if [ $USER_ID -ne 0 ] ; then    
    echo -e "\e[31m Script is expected to executed by the root user or with a sudo privilege \e[0m \n \t Example: \n\t\t sudo bash wrapper.sh frontend"
    exit 1
fi

stat() {

if [ $1 -eq 0 ] ; then
    echo -e "\e[32m success \e[0m"
else
     echo -e "\e[31m failure \e[0m"
     exit 2

fi 
}

echo -e  "\e[35m configuring ${COMPONENT} .....! \e[0m \n"

echo -n  "configuring ${COMPONENT} repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | bash - &>> ${LOGFILE}
stat $?

echo -n "Installing ${COMPONENT}"
yum install nodejs -y  &>> ${LOGFILE}
stat $?

id ${APPUSER}  &>> ${LOGFILE}
if [ $? -ne 0 ] ; then
echo -n "creating application user account :"
useradd roboshop
stat $?
