# AWS Resource Scanner Script

A comprehensive shell script for scanning and managing AWS resources across different services. This script helps you list resources, analyze costs, and manage various AWS services from the command line.

## Prerequisites

- AWS CLI installed
- AWS credentials configured (`aws configure`)
- Bash shell environment
- Required AWS IAM permissions for the services you want to scan

## Installation

1. Clone or download the script

2. Make it executable:

```bash
chmod +x AWScan.sh
```

## Usage

Basic syntax:

```bash
./AWScan.sh <aws_region> <aws_service>
```

### Available Services

#### 1. EC2 Instances

```bash
./AWScan.sh us-east-1 ec2
```

#### 2. RDS Instances

```bash
./AWScan.sh us-east-1 rds
```

#### 3. S3 Buckets

```bash
./AWScan.sh us-east-1 s3
```

#### 4. CloudFront Distributions

```bash
./AWScan.sh us-east-1 cloudfront
```

#### 5. VPC Resources

```bash
./AWScan.sh us-east-1 vpc
```

#### 6. IAM Users

```bash
./AWScan.sh us-east-1 iam
```

#### 7. Route53 Resources

```bash
./AWScan.sh us-east-1 route53
```

#### 8. CloudWatch Alarms

```bash
./AWScan.sh us-east-1 cloudwatch
```

#### 9. CloudFormation Stacks

```bash
./AWScan.sh us-east-1 cloudformation
```

#### 10. Lambda Functions

```bash
./AWScan.sh us-east-1 lambda
```

#### 11. SNS Topics

```bash
./AWScan.sh us-east-1 sns
```

#### 12. SQS Queues

```bash
./AWScan.sh us-east-1 sqs
```

#### 13. DynamoDB Tables

```bash
./AWScan.sh us-east-1 dynamodb
```

#### 14. EBS Volumes

```bash
./AWScan.sh us-east-1 ebs
```

### Cost Analysis Features

#### 1. View Current Month's Costs

```bash
./AWScan.sh us-east-1 cost
```

This command shows detailed cost estimates for the current month using AWS Cost Explorer.

#### 2. Get Cost Optimization Recommendations

```bash
./AWScan.sh us-east-1 cost-optimize
```

Provides recommendations for cost optimization including:
- Idle EC2 instances
- Unattached EBS volumes
- Unused Elastic IPs
- Service-wise cost breakdown

#### 3. Set Up Cost Alerts

```bash
./AWScan.sh us-east-1 cost-alert
```

Sets up CloudWatch alarms for cost monitoring. You can specify a custom threshold when prompted (default: $1000).

## Required IAM Permissions

The AWS user/role running this script needs the following permissions:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "rds:Describe*",
                "s3:List*",
                "cloudfront:List*",
                "vpc:Describe*",
                "iam:List*",
                "route53:List*",
                "cloudwatch:Describe*",
                "cloudformation:Describe*",
                "lambda:List*",
                "sns:List*",
                "sqs:List*",
                "dynamodb:List*",
                "ce:*",
                "cloudwatch:PutMetricAlarm",
                "sns:CreateTopic"
            ],
            "Resource": "*"
        }
    ]
}
```

## Error Handling

The script includes several error handling features:

- Automatic AWS CLI installation if missing
- Validation of required arguments
- AWS CLI configuration check
- Clear error messages for troubleshooting

## Quick Start Examples

1. List all EC2 instances in US East region:
```bash
./AWScan.sh us-east-1 ec2
```

2. Check current month's costs:
```bash
./AWScan.sh us-east-1 cost
```

3. Set up cost alerts with custom threshold:
```bash
./AWScan.sh us-east-1 cost-alert
```

## Author

Harman Singh

## Version

v0.0.2
