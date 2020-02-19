#! /bin/bash
#Creating cloudformation stack

STACK_NAME=$1
VPC_CIDR=$2
CIDR_SUBNET01=$3
CIDR_SUBNET02=$4
CIDR_SUBNET03=$5
REGION=$6
PROFILE=$7
SUBNET_01=$STACK_NAME-subnet01
SUBNET_02=$STACK_NAME-subnet02
SUBNET_03=$STACK_NAME-subnet03
VPC_NAME=$STACK_NAME-vpc
INTERNETGATEWAY=$STACK_NAME-internetgateway
ROUTETABLE=$STACK_NAME-routetable

if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" || -z "$5" || -z "$6" || -z "$7" ]]
then
	echo "Please enter all parameters in order ( Stack Name, VPC CIDR block, CIDR block for 3 subnets, Region )"
	exit 1
else
	aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://networking.json --region $REGION --profile $PROFILE --parameters ParameterKey=VPCName,ParameterValue=$VPC_NAME ParameterKey=VPCCIDR,ParameterValue=$VPC_CIDR ParameterKey=SubnetCIDR1,ParameterValue=$CIDR_SUBNET01 ParameterKey=SubnetCIDR2,ParameterValue=$CIDR_SUBNET02 ParameterKey=SubnetCIDR3,ParameterValue=$CIDR_SUBNET03 ParameterKey=Region,ParameterValue=$REGION ParameterKey=SubnetName1,ParameterValue=$SUBNET_01 ParameterKey=SubnetName2,ParameterValue=$SUBNET_02 ParameterKey=SubnetName3,ParameterValue=$SUBNET_03 ParameterKey=InternetGatewayName,ParameterValue=$INTERNETGATEWAY ParameterKey=RouteTableName,ParameterValue=$ROUTETABLE
    if [ $? -eq 0 ]; then
        aws cloudformation wait stack-create-complete --stack-name $STACK_NAME --region $REGION --profile $PROFILE
        if [ $? -eq 0 ]; then
            echo "Stack created successfully"
        else
            echo "Stack creation unsuccessful"
        fi
    else
        echo "Stack creation unsuccessful"
    fi
fi



