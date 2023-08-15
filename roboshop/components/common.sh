
 #All the common functions will be declared here. Rest of the components will be sourcing the functions from this file.

LOGFILE=/tmp/COMPONENT.log
APPUSER="roboshop"

USER_ID=$(id -u)
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

# Function to create a user account

CREATE_USER() {
        id ${APPUSER}  &>> ${LOGFILE} 
        if [ $? -ne 0 ] ; then 
            echo -n "Creating Application User Account :"
            useradd roboshop 
            stat $? 
        fi    
}

DOWNLOAD_AND_EXTRACT() {

  echo -n "Downloading the ${COMPONENT} :"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
  stat $?
  cd /home/${APPUSER}/
  rm -rf ${COMPONENT}   &>> ${LOGFILE}
  unzip -o /tmp/${COMPONENT}.zip  &>> ${LOGFILE}
  stat $?

  echo -n "Changing the ownership :"
  mv ${COMPONENT}-main ${COMPONENT}
  chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}/
  stat $?

}

CONFIG_SVC() {

  echo -n "Configuring the ${COMPONENT} system file :"
  sed -ie 's/MONGO_DNSNAME/172.31.11.234/' /home/${APPUSER}/${COMPONENT}/systemd.service
  mv /home/${APPUSER}/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  stat $?

  echo -n "starting the ${COMPONENT} service"
  systemctl daemon-reload &>> ${LOGFILE}
  systemctl enable ${COMPONENT}   &>> ${LOGFILE}
  systemctl restart ${COMPONENT}  &>> ${LOGFILE}

}

#Declaring a NodeJS Function

NODEJS() {
echo -e  "\e[35m configuring ${COMPONENT} .....! \e[0m \n"

echo -n  "configuring ${COMPONENT} repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | bash - &>> ${LOGFILE}
stat $?

echo -n "Installing Nodejs:"
yum install nodejs -y  &>> ${LOGFILE}
stat $?

CREATE_USER              # calls CREATE_USER function that creates user account.
DOWNLOAD_AND_EXTRACT     # Downloads and extracts the components

echo -n "Generating the ${COMPONENT} artifacts:"
cd /home/${APPUSER}/${COMPONENT}
npm install   &>> ${LOGFILE}
stat $?

}



