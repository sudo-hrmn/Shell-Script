#!/bin/bash

###############################################################################
# Author: Harman Singh
# Version: v0.0.2

# Script to automate the process of listing all the resources in an AWS account
#
# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS
#
# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
#
# Usage: ./aws_resource_list.sh  <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-1 ec2
#
# Additional cost analysis features:
# - cost: Shows estimated costs for running resources
# - cost-alert: Set up cost alerts for specific thresholds
# - cost-optimize: Get cost optimization recommendations
#############################################################################

# Function to get estimated costs for the current month
get_estimated_costs() {
    local region=$1
    echo "Fetching estimated costs for the current month..."
    aws ce get-cost-and-usage \
        --time-period Start=$(date -d "$(date +%Y-%m-01)" +%Y-%m-%d),End=$(date -d "$(date +%Y-%m-01) +1 month -1 day" +%Y-%m-%d) \
        --granularity MONTHLY \
        --metrics "BlendedCost" "UnblendedCost" "UsageQuantity" \
        --region $region
}

# Function to get cost optimization recommendations
get_cost_recommendations() {
    local region=$1
    echo "Generating cost optimization recommendations..."
    
    # Check for idle EC2 instances
    echo "Checking for idle EC2 instances..."
    aws ce get-cost-and-usage \
        --time-period Start=$(date -d "-30 days" +%Y-%m-%d),End=$(date +%Y-%m-%d) \
        --granularity MONTHLY \
        --metrics "BlendedCost" \
        --group-by Type=DIMENSION,Key=SERVICE \
        --region $region

    # Check for unattached EBS volumes
    echo "Checking for unattached EBS volumes..."
    aws ec2 describe-volumes \
        --filters Name=status,Values=available \
        --region $region

    # Check for unused Elastic IPs
    echo "Checking for unused Elastic IPs..."
    aws ec2 describe-addresses \
        --region $region
}

# Function to create/update cost alerts
set_cost_alerts() {
    local region=$1
    local threshold=${2:-1000}  # Default threshold of 1000 USD
    
    echo "Setting up cost alert for threshold: $threshold USD"
    
    # Create SNS topic for alerts if it doesn't exist
    topic_arn=$(aws sns create-topic --name "AWS-Cost-Alerts" --region $region --output text)
    
    # Create CloudWatch alarm for costs
    aws cloudwatch put-metric-alarm \
        --alarm-name "AWS-Monthly-Cost-Alert" \
        --alarm-description "Alert when monthly costs exceed $threshold USD" \
        --metric-name "EstimatedCharges" \
        --namespace "AWS/Billing" \
        --statistic Maximum \
        --period 21600 \
        --threshold $threshold \
        --comparison-operator GreaterThanThreshold \
        --evaluation-periods 1 \
        --alarm-actions $topic_arn \
        --region $region
}

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: ./aws_resource_list.sh  <aws_region> <aws_service>"
    echo "Example: ./aws_resource_list.sh us-east-1 ec2"
    exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$2

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Installing AWS CLI now..."
    
    # Check the operating system and install accordingly
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case $ID in
            ubuntu|debian)
                curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                sudo apt update && sudo apt install -y unzip
                unzip awscliv2.zip
                sudo ./aws/install
                rm -rf aws awscliv2.zip
                ;;
            rhel|fedora|centos)
                curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                sudo yum install -y unzip
                unzip awscliv2.zip
                sudo ./aws/install
                rm -rf aws awscliv2.zip
                ;;
            *)
                echo "Unsupported operating system. Please install AWS CLI manually."
                exit 1
                ;;
        esac
    else
        echo "Could not determine the operating system. Please install AWS CLI manually."
        exit 1
    fi
    
    # Verify installation
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI installation failed. Please install it manually."
        exit 1
    fi
    echo "AWS CLI has been successfully installed!"
fi

# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure the AWS CLI and try again."
    exit 1
fi

# List the resources based on the service
case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $aws_region
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region $aws_region
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        echo "Listing IAM Users in $aws_region"
        aws iam list-users --region $aws_region
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $aws_region
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    cost)
        echo "Analyzing AWS Costs in $aws_region"
        get_estimated_costs $aws_region
        ;;
    cost-optimize)
        echo "Generating Cost Optimization Recommendations for $aws_region"
        get_cost_recommendations $aws_region
        ;;
    cost-alert)
        echo "Setting up Cost Alerts in $aws_region"
        read -p "Enter cost threshold in USD (default: 1000): " threshold
        threshold=${threshold:-1000}
        set_cost_alerts $aws_region $threshold
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
