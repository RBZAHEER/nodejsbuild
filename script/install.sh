#!/bin/bash

# Update system and install Nginx
yum update -y
yum install -y nginx

# Remove default Nginx files
rm -rf /usr/share/nginx/html/*

# Copy built React files to Nginx root
cp -r /home/ec2-user/nodejsbuild/build/* /usr/share/nginx/html/

# Start and enable Nginx
systemctl start nginx
systemctl enable nginx

# Check Nginx status
if systemctl status nginx | grep "active (running)"; then
    echo "Nginx is running and serving the React app."
else
    echo "Failed to start Nginx."
    exit 1
fi
