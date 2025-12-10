# Git Repository Setup Guide

This guide provides comprehensive instructions for setting up Git version control for the Tataboq E-Commerce project, ensuring sensitive files are properly excluded and the repository is ready for collaboration.

## Table of Contents

1. [Initial Repository Setup](#initial-repository-setup)
2. [Removing Sensitive Files](#removing-sensitive-files)
3. [Verifying .gitignore Configuration](#verifying-gitignore-configuration)
4. [Committing Changes](#committing-changes)
5. [Pushing to Remote](#pushing-to-remote)
6. [File Checklist](#file-checklist)
7. [Security Best Practices](#security-best-practices)

## Initial Repository Setup

### Step 1: Verify Git Installation

```bash
git --version
```

If Git is not installed, download it from [git-scm.com](https://git-scm.com/).

### Step 2: Configure Git (if not already done)

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Initialize Repository (if starting fresh)

```bash
git init
git branch -M main
```

## Removing Sensitive Files

If sensitive files were previously committed to the repository, they must be removed from Git tracking while keeping local copies.

### Step 1: Check Tracked Sensitive Files

```bash
# Check if google-services.json is tracked
git ls-files android/app/google-services.json

# Check if GoogleService-Info.plist is tracked
git ls-files ios/Runner/GoogleService-Info.plist

# Check for keystore files
git ls-files | grep -E '\.(keystore|jks)$'
```

### Step 2: Remove Sensitive Files from Tracking

```bash
# Remove Firebase configuration files
git rm --cached android/app/google-services.json
git rm --cached ios/Runner/GoogleService-Info.plist

# Remove keystore files (if any)
git rm --cached android/app/key.properties
git rm --cached android/app/*.keystore
git rm --cached android/app/*.jks

# Remove local.properties
git rm --cached android/local.properties
```

**Important**: The `--cached` flag removes files from Git tracking but keeps them on your local filesystem.

### Step 3: Verify Files Are Still Present Locally

```bash
# Verify files exist locally
ls android/app/google-services.json
ls ios/Runner/GoogleService-Info.plist
```

These files should still exist locally but will no longer be tracked by Git.

## Verifying .gitignore Configuration

### Step 1: Check .gitignore Files

Ensure the following `.gitignore` files exist and are properly configured:

- ✅ `.gitignore` (root directory)
- ✅ `android/.gitignore`
- ✅ `ios/.gitignore`
- ✅ `macos/.gitignore` (if applicable)
- ✅ `linux/.gitignore` (if applicable)
- ✅ `windows/.gitignore` (if applicable)

### Step 2: Verify Sensitive Files Are Ignored

```bash
# Check if files are ignored
git check-ignore -v android/app/google-services.json
git check-ignore -v ios/Runner/GoogleService-Info.plist
git check-ignore -v android/local.properties
```

If files are properly ignored, Git will display the matching `.gitignore` rule.

### Step 3: Test .gitignore Rules

```bash
# Try to add ignored files (should fail silently)
git add android/app/google-services.json

# Check status (file should not appear)
git status
```

## Committing Changes

### Step 1: Review Changes

```bash
# See all changes
git status

# See detailed changes
git diff
```

### Step 2: Stage Changes

```bash
# Add all changes
git add .

# Or add specific files
git add .gitignore
git add android/.gitignore
git add ios/.gitignore
git add README.md
git add SETUP.md
git add android/app/google-services.json.example
```

### Step 3: Commit Changes

```bash
# Commit with descriptive message
git commit -m "Initial commit: Setup repository with proper .gitignore configuration"

# Or with detailed message
git commit -m "Initial commit

- Configure .gitignore for Flutter project
- Add documentation files (README, SETUP, GIT_SETUP)
- Add example Firebase configuration file
- Remove sensitive files from tracking
- Setup proper Git attributes"
```

### Step 4: Verify Commit

```bash
# View commit history
git log --oneline

# View commit details
git show HEAD
```

## Pushing to Remote

### Step 1: Add Remote Repository

```bash
# Add remote (if not already added)
git remote add origin https://github.com/yazan-alsamman/ecommerce.git

# Verify remote
git remote -v
```

### Step 2: Push to Remote

```bash
# Push to main branch
git push -u origin main

# For subsequent pushes
git push
```

### Step 3: Verify Remote Repository

Visit your GitHub repository and verify:
- ✅ All files are present
- ✅ Sensitive files are NOT present
- ✅ `.gitignore` files are included
- ✅ Documentation files are included

## File Checklist

### ✅ Files That SHOULD Be Committed

- [x] All source code (`lib/` directory)
- [x] Configuration files (`pubspec.yaml`, `analysis_options.yaml`)
- [x] Asset files (`assets/` directory)
- [x] Platform configuration files (without sensitive data)
  - [x] `android/app/build.gradle`
  - [x] `android/build.gradle`
  - [x] `ios/Podfile`
  - [x] `ios/Runner/Info.plist`
- [x] Documentation files
  - [x] `README.md`
  - [x] `SETUP.md`
  - [x] `GIT_SETUP.md`
- [x] Git configuration files
  - [x] `.gitignore`
  - [x] `.gitattributes`
- [x] Example files
  - [x] `android/app/google-services.json.example`

### ❌ Files That MUST NOT Be Committed

- [ ] `android/app/google-services.json` - Contains Firebase API keys
- [ ] `ios/Runner/GoogleService-Info.plist` - Contains Firebase API keys
- [ ] `android/local.properties` - Contains local SDK paths
- [ ] `android/key.properties` - Contains signing key configuration
- [ ] `*.keystore`, `*.jks` - Signing keystores
- [ ] `build/` - Build artifacts and generated files
- [ ] `.dart_tool/` - Dart tooling cache
- [ ] `.flutter-plugins` - Generated plugin registry
- [ ] `.flutter-plugins-dependencies` - Generated plugin dependencies
- [ ] `.idea/` - IDE configuration (optional)
- [ ] `.vscode/` - VS Code configuration (optional, but recommended to exclude)

## Security Best Practices

### 1. Before First Commit

- ✅ Review all files in the repository
- ✅ Ensure `.gitignore` is properly configured
- ✅ Remove any sensitive files from tracking
- ✅ Test `.gitignore` rules

### 2. Regular Maintenance

- ✅ Periodically review committed files
- ✅ Check for accidentally committed sensitive files
- ✅ Update `.gitignore` as needed
- ✅ Use `git-secrets` or similar tools to scan for secrets

### 3. If Sensitive Files Were Committed

If sensitive files were accidentally committed:

```bash
# Remove from history (use with caution)
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch android/app/google-services.json" \
  --prune-empty --tag-name-filter cat -- --all

# Force push (coordinate with team)
git push origin --force --all
```

**Warning**: Rewriting Git history affects all collaborators. Coordinate with your team before force pushing.

### 4. Sharing Sensitive Files with Team

Never commit sensitive files. Instead:

1. **Use secure channels**:
   - Encrypted email
   - Secure file sharing services
   - Password-protected archives

2. **Use environment variables**:
   - Store sensitive data in environment variables
   - Use `.env` files (add to `.gitignore`)
   - Use CI/CD secrets management

3. **Use example files**:
   - Create `.example` versions of config files
   - Document required fields
   - Team members copy and fill in their own values

### 5. Repository Security Settings

On GitHub:

- ✅ Enable branch protection rules
- ✅ Require pull request reviews
- ✅ Enable secret scanning
- ✅ Set up security alerts
- ✅ Limit repository access

## Common Git Commands Reference

```bash
# Check repository status
git status

# View changes
git diff

# Stage changes
git add <file>
git add .

# Commit changes
git commit -m "Message"

# View commit history
git log
git log --oneline --graph

# Push to remote
git push origin main

# Pull from remote
git pull origin main

# Create and switch to new branch
git checkout -b feature/new-feature

# Switch branches
git checkout main

# View remote repositories
git remote -v

# Update remote URL
git remote set-url origin <new-url>
```

## Troubleshooting

### Issue: Files Still Appear After Adding to .gitignore

**Solution**:
```bash
# Remove from cache
git rm --cached <file>

# Commit the removal
git commit -m "Remove sensitive file from tracking"
```

### Issue: Accidentally Committed Sensitive File

**Solution**:
```bash
# Remove from last commit (before pushing)
git reset --soft HEAD~1
git reset HEAD <file>
git commit -m "Updated commit message"

# Or amend the commit
git commit --amend
```

### Issue: Need to Update .gitignore

**Solution**:
```bash
# Edit .gitignore file
# Then remove cached files
git rm -r --cached .
git add .
git commit -m "Update .gitignore"
```

## Additional Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Git Handbook](https://guides.github.com/introduction/git-handbook/)
- [Flutter Git Best Practices](https://flutter.dev/docs/development/tools/version-control)
- [GitHub Security Best Practices](https://docs.github.com/en/code-security)

---

**Remember**: Security is a continuous process. Regularly review your repository for sensitive information and keep your `.gitignore` files up to date.
