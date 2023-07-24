Docker
=====

Docker is a containerization platform that simplifies configs and the deployemnt of 
Enterprise or dev applications. 

Disclaimer:
-----------

    This collection of docker compose is not completely tested and not all is in docker 
    compose format currently. This is a work in progress to get all to docker compose 
    format , tested, and able to launch all with the startup script. The current startup 
    script is limited. 

Getting Started
---------------

    # Make sure Docker, Docker compose, and git is installed.
    $ git clone https://github.com/decyphertek-io/docker.git
    $ mv docker/ .docker/
    $ cd .docker
    # Optional Interactvie Script: 
    $ bash startup.sh
    
    # Choose which server you want to launch. ( A few are not in docker-compose format, so have to run command manually) 
    $ cd ServerName
    # Docker compose has two commands depending on how you installed it. ( Plugin vs binary )
    $ docker-compose up -d 
    <OR>
    $ docker compose up -d 

Quick Install
-------------

    # Ubuntu ( Will Fail on Debian or other distros )
    $ curl -fsSL https://raw.githubusercontent.com/decyphertek-io/bash/main/docker.sh | bash
    <OR>
    # Docker's Convience Script Debian
    $ curl -fsSL https://get.docker.com -o get-docker.sh
    $ sudo sh get-docker.sh

Install
-------

    $ sudo apt update
    $ sudo apt-get install ca-certificates curl gnupg lsb-release
    $ sudo mkdir -p /etc/apt/keyrings
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    $ echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose docker-compose-plugin
    $ sudo groupadd docker
    $ sudo usermod -aG docker $USER
    $ sudo systemctl enable docker.service
    $ sudo systemctl start docker.service
    # Install docker compose plugin
    $ sudo apt-get install docker-compose-plugin
    # Verify docker-compose plugin
    $ docker compose version
    # May have to logout and back in to avoid docker error.

Manage Docker
-------------

    # run A container example
    $ docker run -d --name nginx -p 443:443 nginx:latest
    # Search a container - Example
    $ docker search nginx
    # Download the container
    $ docker pull nginx
    # See Running Containers
    $ docker ps
    # See All Containers
    $ docker ps -a
    # See All images
    $ docker images
    # Manage Containers
    $ docker stop CONTAINER_ID
    $ docker start CONTAINER_ID
    $ docker rm CONTAINER_ID
    # Enter docker bash shell
    $ docker exec -it ContainerName bash
    # Execute docker command from terminal
    $ docker exec ContainerName apt update && apt install vim
    # Make a custom Image
    $ docker commit ContainerName NewName

Docker Compose Commands
-----------------------

    # The old way to run docker compose 
    $ docker-compose up -d
    # Pass varibales: docker-compose.yml variable ${EXAMPLE} > example.env variable EXAMPLE=changeme
    $ docker-compose --env-file example.env up -d
    # Docker Plugin uses docker compose instead of docker-compose
    $ docker compose build 	    Build or rebuild services
    $ docker compose convert 	Converts the compose file to platform’s canonical format
    $ docker compose cp 	    Copy files/folders between a service container and the local filesystem
    $ docker compose create 	Creates containers for a service.
    $ docker compose down 	    Stop and remove containers, networks
    $ docker compose events 	Receive real time events from containers.
    $ docker compose exec 	    Execute a command in a running container.
    $ docker compose images 	List images used by the created containers
    $ docker compose kill 	    Force stop service containers.
    $ docker compose logs 	    View output from containers
    $ docker compose ls 	    List running compose projects
    $ docker compose pause 	    Pause services
    $ docker compose port 	    Print the public port for a port binding.
    $ docker compose ps 	    List containers
    $ docker compose pull 	    Pull service images
    $ docker compose push 	    Push service images
    $ docker compose restart 	Restart service containers
    $ docker compose rm 	    Removes stopped service containers
    $ docker compose run 	    Run a one-off command on a service.
    $ docker compose start 	    Start services
    $ docker compose stop 	    Stop services
    $ docker compose top 	    Display the running processes
    $ docker compose unpause 	Unpause services
    $ docker compose up 	    Create and start containers
    $ docker compose version 	Show the Docker Compose version information

Optional: Compose Generator
--------------------------

    # https://dev.to/marcauberer/compose-generator-deploy-your-app-in-seconds-21o6
    $ docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/cg/out chillibits/compose-generator


Optional: Nginx reverse proxy w/self signed cert.
--------------------------------------------------

    # If you want a self signed nginx reverse proxy, add nginx to docker compose and then run the following commands
    $ docker exec -it nginx-reverse-proxy openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/self-signed-key.pem -out /etc/ssl/certs/self-signed-crt.pem -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
    # Look at nginx /etc/nginx/conf.d/defualt.conf to set reverse proxy. ( The proxy pass should reference a bridge or gateway in docker. )
    server {
        listen 443 ssl;
        listen  [::]:443 ssl;
        server_name localhost;
        ssl_certificate      /etc/ssl/certs/self-signed-crt.pem;
        ssl_certificate_key  /etc/ssl/private/self-signed-key.pem;
        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;
        ssl_protocols        TLSV1.1 TLSV1.2 TLSV1.3;
        ssl_ciphers          HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;
    location / {
        proxy_pass http://172.23.0.1:8000;
        proxy_ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection upgrade;
        proxy_set_header Accept-Encoding gzip;
        proxy_set_header X-Forwarded-Host $host:$server_port;
        }
    }
    $ docker exec -it nginx-reverse-proxy nginx -s reload

Optional: ghcr.io
------------------

    # Easy way without a dockerfile. 
    # Make a github access token, dockerfile, and build
    # Github > Settings > Developer Settings > personal access tokens > tokens > Generate new token.
    # Github required permisisons: https://github.com/settings/tokens/new?scopes=write:packages
    $ docker login --username USERNAMEHERE --password GITHUBKEYHERE ghcr.io
    # Launch a base container
    $ docker run -it -d --name debian debian:latest bash
    # Enter container terminal
    $ docker exec -it debian bash
    # Install what you wish , then save the server build. 
    $ docker commit debian ghcr.io/USERNAME/CONTAINERNAME:latest
    $ docker push  ghcr.io/USERNAME/CONTAINERNAME:latest


Optional: UFW & Docker
----------------------

    # Docker bypasses UFW host firewall. There is a fix. 
    $ sudo wget -O /usr/local/bin/ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
    $ sudo chmod +x /usr/local/bin/ufw-docker
    $ sudo ufw-docker install
    $ sudo systemctl restart ufw
    # May have to restart Docker or machine as well if issues occur. 
    # Make sure to get the docker name
    $ docker ps
    # Allow port to docker name
    $ sudo ufw-docker allow namehere 80/tcp
    # Remove the rule
    $ sudo ufw-docker delete allow namehere 80/tcp
    # Advanced: Whitelisting
    $ sudo ufw route allow proto tcp from 1.2.3.4 to any port 9443

Optional: Portainer
-------------------

    $ docker volume create portainer_data
    $ docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    # Allow 9443 on host/network firewall & Security groups - Example
    $ sudo ufw allow 9443
    # https://localhost:9443
    # Follow setup page instructions
    # If you get a timeout error run:
    $ docker restart portainer
    # login

Optional: Yacht
---------------

    $ docker volume create yacht
    $ docker run -d -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config selfhostedpro/yacht
    # Allow 8000 on host/network firewall & Security groups - Example
    $ sudo ufw allow 8000
    # Replace localhost with your IP.
    # http://localhost:8000
    # User: admin@yacht.local Pass: pass
    # Add templates - https://raw.githubusercontent.com/SelfhostedPro/selfhosted_templates/master/Template/yacht.json 

Optional: Lazy Docker
---------------------

    $ curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
    # Logout and back in
    $ lazydocker
    # Follow command prompts listed to manage docker completely from terminal , easily. 

Optional: Gvisor ( Container Security Platform)
----------------

    # https://gvisor.dev/
    $ sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
    $ curl -fsSL https://gvisor.dev/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/gvisor-archive-keyring.gpg
    $ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/gvisor-archive-keyring.gpg] https://storage.googleapis.com/gvisor/releases release main" | sudo tee /etc/apt/sources.list.d/gvisor.list > /dev/null
    $ sudo apt-get update && sudo apt-get install -y runsc
    # If you have Docker installed, it will be automatically configured.

Optional: RancherDesktop
-----------------------

    https://rancherdesktop.io/

Optional: LinuxServers.io
-------------------------

    https://docs.linuxserver.io/
    https://fleet.linuxserver.io/

Optional: DockStarter
---------------------

    https://dockstarter.com/


Optional: Trivy
---------------

    https://github.com/aquasecurity/trivy

References
----------

    https://docs.docker.com/compose/install/compose-plugin/#install-the-plugin-manually
    https://docs.portainer.io/start/install/server/docker/linux
    https://docs.docker.com/engine/reference/commandline/cli/
    https://docs.docker.com/engine/install/ubuntu/
    https://yacht.sh/docs/Installation/Getting_Started
    https://www.howtogeek.com/devops/how-to-use-docker-with-a-ufw-firewall/
    https://www.howtogeek.com/devops/how-to-create-a-dockerfile-from-an-existing-image/
    https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry

