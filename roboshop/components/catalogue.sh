#!/bin/bash

# validate the user who is running the script is a root user or not.

set -e 

USER_ID=$(id -u)
COMPONENT=catalogue
LOGFILE=/tmp/COMPONENT.log
Appuser="roboshop"

if [ $USER_ID -ne 0 ] ; then    
    echo -e "\e[31m Script is expected to executed by the root user or with a sudo privilege \e[0m \n \t Example: \n\t\t sudo bash wrapper.sh frontend"
    exit 1
fi

stat() {

if [ $1 -eq 0 ]; then
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

id ${Appuser}  &>> ${LOGFILE}
if [ $? -ne 0 ];then
echo -n "creating application user account :"
useradd roboshop 
stat $?
fi 

echo -n "Downloading the ${COMPONENT} :"
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "copying the ${COMPONENT} to ${Appuser} home directory"
cd /home/${Appuer}/
rm -rf ${COMPONENT}   &>> ${LOGFILE}
unzip -o /tmp/${COMPONENT}.zip  &>> ${LOGFILE}
stat $?

echo -n "Generating the ${COMPONENT} artifacts:"
cd /home/roboshop/catalogue
npm install   &>> ${LOGFILE}
stat $? 

echo -n "Configuring the ${COMPONENT} system file :"
sed -ie 's/MONGO_DNSNAME/172.31.11.234/' /home/${Appuser}/${COMPONENT}/systemd.service
mv /home/${Appuser}/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
stat $?

echo -n "starting the ${COMPONENT} service"
 systemctl daemon-reload &>> ${LOGFILE}
 systemctl enable ${COMPONENT}   &>> ${LOGFILE}
 system ctl restart ${COMPONENT}  &>> ${LOGFILE}

 echo -e "\e[35m ${COMPONENT} Installation Is Completed \e[0m \n"





