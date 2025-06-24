# Contributing to AWS Resource Scanner

Thank you for your interest in contributing to the AWS Resource Scanner project! 🎉

## 🤝 How to Contribute

### 1. Fork the Repository
- Click the "Fork" button at the top right of the repository page
- Clone your fork locally:
  ```bash
  git clone https://github.com/your-username/Shell-Script.git
  cd Shell-Script
  ```

### 2. Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
```

### 3. Make Your Changes
- Follow the existing code style and conventions
- Add comments for complex logic
- Test your changes thoroughly

### 4. Commit Your Changes
```bash
git add .
git commit -m "Add: Brief description of your changes"
```

### 5. Push and Create Pull Request
```bash
git push origin feature/your-feature-name
```
Then create a Pull Request on GitHub.

## 🎯 Contribution Ideas

### New AWS Services
- Add support for additional AWS services
- Improve existing service implementations
- Add service-specific filtering options

### Cost Management Features
- Enhanced cost analysis algorithms
- Budget tracking and forecasting
- Cost anomaly detection
- Multi-account cost aggregation

### Output Improvements
- JSON/CSV export formats
- Colored terminal output
- Progress bars for long operations
- Summary reports

### Error Handling
- Better error messages
- Retry mechanisms for API calls
- Graceful handling of rate limits
- Validation improvements

## 📝 Code Style Guidelines

### Shell Script Best Practices
- Use `#!/bin/bash` shebang
- Quote variables: `"$variable"`
- Use `[[ ]]` for conditionals
- Add error checking with `set -e`
- Use meaningful function names

### Documentation
- Update README.md for new features
- Add inline comments for complex logic
- Include usage examples
- Update help text in the script

### Testing
- Test on multiple Linux distributions
- Verify AWS CLI compatibility
- Test with different AWS regions
- Validate IAM permission requirements

## 🐛 Bug Reports

When reporting bugs, please include:
- Operating system and version
- AWS CLI version
- Shell version (bash --version)
- Complete error message
- Steps to reproduce
- Expected vs actual behavior

## 💡 Feature Requests

For feature requests, please provide:
- Clear description of the feature
- Use case and benefits
- Proposed implementation approach
- Any relevant AWS documentation links

## 🔍 Code Review Process

1. All contributions require review
2. Maintainers will provide feedback
3. Address any requested changes
4. Once approved, changes will be merged

## 📋 Checklist Before Submitting

- [ ] Code follows project style guidelines
- [ ] Changes are tested locally
- [ ] Documentation is updated
- [ ] Commit messages are clear
- [ ] No sensitive information is included
- [ ] IAM permissions are documented

## 🙏 Recognition

Contributors will be recognized in:
- README.md acknowledgments
- Release notes
- GitHub contributors list

## 📞 Questions?

Feel free to:
- Open an issue for discussion
- Contact the maintainer
- Join community discussions

Thank you for making this project better! 🚀
