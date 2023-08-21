#!/bin/bash

#To create an Instance what and all needed :
# AMI ID
# Type of Instance
# Security group
# How many instances you need
# DNS record,Hosted Zone ID

AMI_ID="ami-0c1d144c8fdd8d690"
INSTANCE_TYPE="t3.micro"
SG_ID="sg-052c68247aae56a95"         #B55-ALLOW ALL security group id
aws ec2 run-instances --image-id ${AMI_ID} --instance-type ${INSTANCE_TYPE} --security-group-ids ${SG_ID} --tag-specifications 'ResourceType=instance,Tags=[{key=Name,value=${COMPONENT}}]'



