#!/bin/bash
# Stop the server gracefully
sudo pkill -f gunicorn || true
echo "Server stopped"
exit 0
