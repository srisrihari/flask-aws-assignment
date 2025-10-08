#!/bin/bash
set -e
cd /home/ec2-user/flask-app
sudo yum update -y
sudo yum install python3 python3-pip -y
sudo pip3 install -r requirements.txt
sudo pip3 install gunicorn
