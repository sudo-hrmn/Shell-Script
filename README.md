# 🔍 AWS Resource Scanner & Cost Analyzer

[![Shell Script](https://img.shields.io/badge/Shell-Script-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A powerful and comprehensive shell script for scanning AWS resources, analyzing costs, and managing cloud infrastructure across multiple AWS services. Perfect for DevOps engineers, cloud architects, and AWS administrators who need quick insights into their cloud resources.

## ✨ Features

### 🔍 **Resource Discovery**
- **15+ AWS Services Supported** - EC2, RDS, S3, Lambda, VPC, IAM, and more
- **Multi-Region Support** - Scan resources across any AWS region
- **Detailed Resource Information** - Get comprehensive details about your resources

### 💰 **Cost Management**
- **Real-time Cost Analysis** - View current month's spending
- **Cost Optimization Recommendations** - Identify idle resources and cost-saving opportunities
- **Automated Cost Alerts** - Set up CloudWatch alarms for budget monitoring
- **Resource Cost Breakdown** - Service-wise cost analysis

### 🛠️ **DevOps Features**
- **Auto-Installation** - Automatically installs AWS CLI if missing
- **Cross-Platform Support** - Works on Ubuntu, Debian, RHEL, CentOS, Fedora
- **Error Handling** - Comprehensive error checking and user-friendly messages
- **Batch Operations** - Scan multiple services efficiently

## 🚀 Quick Start

### Prerequisites

- **Bash Shell** (4.0+)
- **AWS Account** with appropriate permissions
- **Internet Connection** (for AWS CLI installation if needed)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/sudo-hrmn/Shell-Script.git
   cd Shell-Script
   ```

2. **Make the script executable:**
   ```bash
   chmod +x AWScan.sh
   ```

3. **Configure AWS credentials** (if not already done):
   ```bash
   aws configure
   ```

### Basic Usage

```bash
./AWScan.sh <aws_region> <aws_service>
```

**Example:**
```bash
./AWScan.sh us-east-1 ec2
```

## 📋 Supported Services

| Service | Command | Description |
|---------|---------|-------------|
| **EC2** | `ec2` | List all EC2 instances with details |
| **RDS** | `rds` | List RDS database instances |
| **S3** | `s3` | List all S3 buckets |
| **Lambda** | `lambda` | List Lambda functions |
| **VPC** | `vpc` | List Virtual Private Clouds |
| **IAM** | `iam` | List IAM users |
| **CloudFront** | `cloudfront` | List CloudFront distributions |
| **Route53** | `route53` | List Route53 hosted zones |
| **CloudWatch** | `cloudwatch` | List CloudWatch alarms |
| **CloudFormation** | `cloudformation` | List CloudFormation stacks |
| **SNS** | `sns` | List SNS topics |
| **SQS** | `sqs` | List SQS queues |
| **DynamoDB** | `dynamodb` | List DynamoDB tables |
| **EBS** | `ebs` | List EBS volumes |

## 💰 Cost Management Commands

### 📊 **Cost Analysis**
```bash
# View current month's costs
./AWScan.sh us-east-1 cost
```

### 🎯 **Cost Optimization**
```bash
# Get cost optimization recommendations
./AWScan.sh us-east-1 cost-optimize
```

**Identifies:**
- 💤 Idle EC2 instances
- 📦 Unattached EBS volumes
- 🌐 Unused Elastic IPs
- 📈 Service-wise cost breakdown

### 🚨 **Cost Alerts**
```bash
# Set up cost monitoring alerts
./AWScan.sh us-east-1 cost-alert
```

**Features:**
- Custom threshold setting (default: $1000)
- SNS topic creation for notifications
- CloudWatch alarm configuration
- Email/SMS alert support

## 🔧 Advanced Usage Examples

### **Multi-Service Scanning**
```bash
# Scan EC2 instances
./AWScan.sh us-west-2 ec2

# Check RDS databases
./AWScan.sh eu-west-1 rds

# Analyze costs
./AWScan.sh us-east-1 cost
```

### **Cost Management Workflow**
```bash
# 1. Check current costs
./AWScan.sh us-east-1 cost

# 2. Get optimization recommendations
./AWScan.sh us-east-1 cost-optimize

# 3. Set up cost alerts
./AWScan.sh us-east-1 cost-alert
```

### **Infrastructure Audit**
```bash
# Audit compute resources
./AWScan.sh us-east-1 ec2
./AWScan.sh us-east-1 lambda

# Audit storage resources
./AWScan.sh us-east-1 s3
./AWScan.sh us-east-1 ebs

# Audit networking
./AWScan.sh us-east-1 vpc
./AWScan.sh us-east-1 cloudfront
```

## 🔐 Required IAM Permissions

Create an IAM policy with the following permissions:

<details>
<summary>Click to expand IAM Policy JSON</summary>

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
                "s3:GetBucketLocation",
                "cloudfront:List*",
                "iam:List*",
                "iam:Get*",
                "route53:List*",
                "cloudwatch:Describe*",
                "cloudwatch:List*",
                "cloudwatch:PutMetricAlarm",
                "cloudformation:Describe*",
                "cloudformation:List*",
                "lambda:List*",
                "sns:List*",
                "sns:CreateTopic",
                "sqs:List*",
                "dynamodb:List*",
                "dynamodb:Describe*",
                "ce:GetCostAndUsage",
                "ce:GetUsageReport",
                "ce:GetReservationCoverage",
                "ce:GetReservationPurchaseRecommendation",
                "ce:GetReservationUtilization",
                "ce:GetRightsizingRecommendation"
            ],
            "Resource": "*"
        }
    ]
}
```
</details>

## 🛠️ Installation & Setup

### **Automatic AWS CLI Installation**

The script automatically detects and installs AWS CLI if missing:

- ✅ **Ubuntu/Debian**: Uses `apt` package manager
- ✅ **RHEL/CentOS/Fedora**: Uses `yum` package manager
- ✅ **Cross-platform**: Downloads official AWS CLI v2

### **Manual AWS CLI Setup**

If you prefer manual installation:

```bash
# For Linux
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Configure AWS credentials
aws configure
```

## 📊 Output Examples

### **EC2 Instance Listing**
```bash
$ ./AWScan.sh us-east-1 ec2
Listing EC2 Instances in us-east-1
{
    "Reservations": [
        {
            "Instances": [
                {
                    "InstanceId": "i-1234567890abcdef0",
                    "InstanceType": "t3.medium",
                    "State": {
                        "Name": "running"
                    },
                    "PublicIpAddress": "203.0.113.12",
                    "PrivateIpAddress": "10.0.1.30"
                }
            ]
        }
    ]
}
```

### **Cost Analysis Output**
```bash
$ ./AWScan.sh us-east-1 cost
Fetching estimated costs for the current month...
{
    "ResultsByTime": [
        {
            "TimePeriod": {
                "Start": "2025-06-01",
                "End": "2025-06-30"
            },
            "Total": {
                "BlendedCost": {
                    "Amount": "245.67",
                    "Unit": "USD"
                }
            }
        }
    ]
}
```

## 🔍 Troubleshooting

### **Common Issues**

| Issue | Solution |
|-------|----------|
| **AWS CLI not found** | Script auto-installs AWS CLI |
| **Permission denied** | Run `chmod +x AWScan.sh` |
| **AWS not configured** | Run `aws configure` |
| **Invalid region** | Use valid AWS region codes |
| **Access denied** | Check IAM permissions |

### **Debug Mode**

Enable debug output:
```bash
bash -x ./AWScan.sh us-east-1 ec2
```

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit your changes**: `git commit -m 'Add amazing feature'`
4. **Push to the branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### **Contribution Ideas**
- 🆕 Add support for new AWS services
- 🎨 Improve output formatting
- 📊 Add more cost analysis features
- 🔧 Enhance error handling
- 📚 Improve documentation

## 📈 Roadmap

- [ ] **JSON/CSV Output Format** - Export results in different formats
- [ ] **Resource Tagging Analysis** - Analyze resources by tags
- [ ] **Multi-Account Support** - Scan across multiple AWS accounts
- [ ] **Resource Comparison** - Compare resources across regions
- [ ] **Automated Reporting** - Generate scheduled reports
- [ ] **Web Dashboard** - Simple web interface for results

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Harman Singh**
- GitHub: [@sudo-hrmn](https://github.com/sudo-hrmn)

## 🙏 Acknowledgments

- AWS CLI team for the excellent command-line interface
- Open source community for inspiration and feedback
- DevOps engineers who provided use case insights

## ⭐ Support

If this project helped you, please give it a ⭐ star on GitHub!

---

**📞 Need Help?** Open an issue on GitHub or check the troubleshooting section above.

**🚀 Ready to scan your AWS resources?** Start with `./AWScan.sh us-east-1 ec2`!
