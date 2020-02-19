#! /bin/bash
#Terminating cloudformation stack

STACK_NAME=$1
PROFILE=$2
REGION=$3

if [[ -z "$1" || -z "$2" ]]
then
    echo "Enter Stack name and profile information"
    exit 1
else
    echo -e "Deletion started\n"
    aws cloudformation delete-stack --stack-name $STACK_NAME --profile $PROFILE --region $REGION

    aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME --profile $PROFILE --region $REGION

    if [ $? -eq 0 ]; then
        echo "Terminated Successfully"
    else
        echo "Termination unsuccessful"
    fi
fi