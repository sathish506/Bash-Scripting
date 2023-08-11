#!/bin/bash

# validate the user who is running the script is a root user or not.

set -e 

USER_ID=$(id -u)
COMPONENT=mongodb
LOGFILE=/tmp/COMPONENT.log

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
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?

echo -n "Installing ${COMPONENT}"
yum install -y mongodb-org  &>> ${LOGFILE}
systemctl enable mongod  &>> ${LOGFILE}
systemctl start mongod   &>> ${LOGFILE}
stat $?


echo -n "Enabling the ${COMPONENT} visibility :"
sed  -ie 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
stat $?

echo -n "Starting the ${COMPONENT}  :"
systemctl enable mongod        &>> ${LOGFILE} 
systemctl start mongod         &>> ${LOGFILE} 
stat $?















