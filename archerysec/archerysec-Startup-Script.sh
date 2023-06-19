#!/bin/bash

# ASCII art header 
cat decyphertek-logo.txt

# Instructions
echo "Welcome to Decyphertek - Decoding Technology."  
echo "ArcherySec is an Open Source Vulnerability scanner dashboard that integrates many popular Open Source Scanning tools including, Openvas, owasp zap , etc."
echo "This startup script will ask a few questions of you and then run docker compose based on those choosen variables"  
echo "Once the script is done you will be able to access ArcherySec via https://ip-of-server "

# Prompt for Postgress DB Password 
echo "Enter the postgres password that you choose: " 
read POSTGRES_PASSWORD

# Prompt for Archerysec DB password
echo "Enter the ArcherySec DB Password that you choose: " 
read DB_PASSWORD 

# Prompt for Archerysec email 
echo "Enter your email to login to ArcherySec: "
read EMAIL

# Prompt for Archerysec login password:
echo "Enter your password to login to ArcherySec:"
read PASSWORD

# Promt for Arachni Password
echo " Enter your Arachni Password:"
read ARACHNI_PASSWORD

# Use variables to configure Docker 
cd archerysec
docker-compose up -d 

# Once complete, disable this unit  
# sudo systemctl disable startup.service 
