#! /bin/bash
#Creating cloudformation stack

CERTIFICATE_PATH=$1
CERTIFICATE_CHAIN=$2
KEY=$3
PROFILE=$4

if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" ]]
then
	echo "Please enter all parameters in order ( Certificate path, certificate chain path, key, profile, region )"
	exit 1
else
    aws acm import-certificate --profile $PROFILE --certificate $CERTIFICATE_PATH --certificate-chain $CERTIFICATE_CHAIN --private-key $KEY
fi



