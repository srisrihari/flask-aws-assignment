#!/bin/bash
cd /home/ec2-user/flask-app
sudo pkill -f gunicorn
nohup sudo gunicorn --bind 0.0.0.0:80 app:app --workers 3 > /dev/null 2>&1 &
