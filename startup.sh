# ASCII art header 
cat decyphertek-logo.txt

# Instructions
echo "Welcome to Decyphertek - Decoding Technology."  
echo "ArcherySec is an Open Source Vulnerability scanner dashboard that integrates many popular Open Source Scanning tools including, Openvas, owasp zap , etc."
echo "This startup script will ask a few questions of you and then run docker compose based on those choosen variables"  
echo "Once the script is done you will be able to access ArcherySec via https://ip-of-server "

# Choose your docker compose server. 
echo """
* portainer * cyberchef * freshrss 
* dockuwiki * twake * chatpad
""" 
echo " Which docker compose would you like to run?"
read DOCKER_CHOICE
# Depending on the choice will run a docker-compose.yml for the chosen server.  
echo "We are launching $DOCKER_CHOICE, please be patient."
cd $DOCKER_CHOICE
docker-compose up -d 
echo " $DOCKER_CHOICE is now ready!!!"
docker ps | grep $DOCKER_CHOICE
echo " $DOCKER_CHOICE is now ready!!!"
cat decyphertek-logo.txt