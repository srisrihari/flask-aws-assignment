#!/bin/bash
set -e

# Navigate to application directory
cd /home/ec2-user/flask-app

# Remove requests if it's causing issues (ignore errors)
sudo pip3 uninstall -y requests || true

# Upgrade pip
sudo pip3 install --upgrade pip

# Install dependencies with --ignore-installed flag for problematic packages
sudo pip3 install --ignore-installed requests
sudo pip3 install -r requirements.txt --ignore-installed

# Set proper permissions
sudo chown -R ec2-user:ec2-user /home/ec2-user/flask-app
