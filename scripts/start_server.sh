#!/bin/bash
set -e
cd /home/ec2-user/flask-app
# Kill any existing gunicorn processes
sudo pkill -f gunicorn || true
# Start the application
sudo gunicorn --bind 0.0.0.0:80 app:app --daemon --workers 3
echo "Application started successfully"
