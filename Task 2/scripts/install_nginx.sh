#!/bin/bash
apt update
apt install nginx
systemctl enable nginx
systemctl start nginx
