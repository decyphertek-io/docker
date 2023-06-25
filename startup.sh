#!/bin/bash

while :
do

# ASCII art header 
    echo """ 
 ____                        _               _       _      _       
|  _ \  ___  ___ _   _ _ __ | |__   ___ _ __| |_ ___| | __ (_) ___  
| | | |/ _ \/ __| | | | '_ \| '_ \ / _ \ '__| __/ _ \ |/ / | |/ _ \ 
| |_| |  __/ (__| |_| | |_) | | | |  __/ |  | ||  __/   < _| | (_) |
|____/ \___|\___|\__, | .__/|_| |_|\___|_|   \__\___|_|\_(_)_|\___/ 
                 |___/|_|                                           
    """

    # Instructions
    echo "Welcome to Decyphertek - Decoding Technology."  
    echo "---------------------------------------------"
    # Choose your docker compose server. 
    cd ~/.docker && ls
    echo "----------------------------------------------"
    echo "Which docker compose would you like to run?"
    read DOCKER_CHOICE
    # Depending on the choice will run a docker-compose.yml for the chosen server.  
    echo "We are launching $DOCKER_CHOICE, please be patient."
    cd $DOCKER_CHOICE
    docker-compose up -d 
    docker ps | grep $DOCKER_CHOICE
    echo "-------------------------------"
    echo "$DOCKER_CHOICE is now ready!!!"
    echo "-------------------------------"
	echo "Press CTRL+C to exit"
	sleep 3
done