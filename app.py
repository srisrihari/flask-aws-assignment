from flask import Flask, render_template, jsonify
from datetime import datetime
import os
import socket

app = Flask(__name__)

# Get the instance ID from EC2 metadata (will work when deployed on EC2)
def get_instance_id():
    try:
        import requests
        response = requests.get('http://169.254.169.254/latest/meta-data/instance-id', timeout=1)
        return response.text
    except:
        return "Local Development"

@app.route('/')
def home():
    return render_template('index.html', 
                         hostname=socket.gethostname(),
                         instance_id=get_instance_id(),
                         current_time=datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

@app.route('/health')
def health():
    """Health check endpoint for monitoring"""
    return jsonify({
        'status': 'healthy',
        'timestamp': datetime.now().isoformat(),
        'hostname': socket.gethostname()
    })

@app.route('/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    # Run on all interfaces when in production
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
