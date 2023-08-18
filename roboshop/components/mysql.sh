#!/bin/bash


COMPONENT=mysql

source components/common.sh
echo -e  "\e[35m configuring ${COMPONENT} .....! \e[0m \n"

echo -n "Cofiguring the ${COMPONENT} repo :"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/stans-robot-project/mysql/main/mysql.repo
stat $?

echo -n "Installing ${COMPONENT} :"
yum install mysql-community-server -y   &>> ${LOGFILE}
stat $?

echo -n "starting ${COMPONENT} :"
systemctl enable ${COMPONENT} &>> ${LOGFILE}
systemctl start ${COMPONENT}  &>> ${LOGFILE}
stat $?