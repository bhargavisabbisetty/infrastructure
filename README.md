# CSYE 6225 - Spring 2020

## Infrastructure as Code with AWS Command Line Interface

## Team

### Name: Vishnu Bhargavi Sabbisetty
### NUID: 001497937
### Github ID: bhargavisabbisetty
### Email id: sabbisetty.v@husky.neu.edu

## Technology Stack

* Shell Script

### Run following commands:

- open Terminal
- ` ls -a ` will list all the files at root folder
- ` cd .aws ` will open the hidden aws folder
- It will have two folder named as credentials and config
- run ` aws config `

    AWS Access Key ID [None]: ********
    
    AWS Secret Access Key [None]: **********
    
    Default region name [None]: us-east-1 
    
    Default output format [None]: json
- run ` aws config --profile dev`

    AWS Access Key ID [None]: ********
    
    AWS Secret Access Key [None]: **********
    
    Default region name [None]: us-east-1 
    
    Default output format [None]: json

- run ` aws config --profile prod`

    AWS Access Key ID [None]: ********
    
    AWS Secret Access Key [None]: **********
    
    Default region name [None]: us-east-2
    
    Default output format [None]: json


- Run the `aws cloudformation validate-template --template-body file://filename --profile 'PROFILE'` to validate cloud formation template

* Example to validate cloudformation template

```sh
aws cloudformation validate-template --template-body file://networking.json --profile dev
```

- Run the ` sh create-stack.sh 'STACK_NAME' 'VPC-CIDR' 'SUBNET1_CIDR' 'SUBNET2_CIDR' 'SUBNET3_CIDR' 'AVAILABILITY_REGION' 'PROFILE'` to create and configure required networking resources using AWS CLI

* Example to create network infrastructure using cloudformation using shell script

```sh
sh create-stack.sh test10 10.0.0.0/16 10.0.1.0/24 10.0.2.0/24 10.0.3.0/24 us-east-2 dev
```


* Run this command to create stack using amazon cli

```sh
aws cloudformation create-stack --stack-name csye6225demo2 --parameters file://vars.json --template-body file://networking.json --profile dev --region 'us-east-2'
```

- Run the ` sh delete-stack.sh STACK_NAME PROFILE REGION_NAME` to delete networking resources using AWS CLI
    
* Example to delete network infrastructure using cloudformation using shell script

```sh
sh delete-stack.sh csye6225demo dev us-east-2
```


* Run this command to delete stack using amazon cli

```sh
aws cloudformation delete-stack --stack-name csye6225demo --profile dev --region us-east-2
```