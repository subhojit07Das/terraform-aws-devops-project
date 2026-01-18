#!/bin/bash

dnf update -y
dnf install nginx -y
sudo systemctl enable --now nginx
echo "<h1>Terraform EC2 Project - $(hostname)</h1>" > /usr/share/nginx/html/index.html
