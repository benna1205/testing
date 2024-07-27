#!/bin/bash
#checking number of runnig

aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" | jq ".Reservations[].Instances[]| {InstanceId,InstanceType,public}"
output=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" | jq ".Reservations[].Instances | length")
echo "number of running server:$output"
#to check the stopped ec2

aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" | jq ".Reservations[].Instances[]| {InstanceId,InstanceType,public}"
output=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped" | jq ".Reservations[].Instances | length")
echo "number of stopped server:$output"
