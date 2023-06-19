Get started with docker
=======================

Docker is a lightweight container platform. 


Docker - Debian Quick Install:
-----------------------------

    # Debian based - Installs docker & docker compose.
    $ curl -fsSL https://raw.githubusercontent.com/decyphertek-io/configs/main/bash-scripts/docker.sh | bash
    <OR>
    # Docker's Convience Script Debian
    $ curl -fsSL https://get.docker.com -o get-docker.sh
    $ sudo sh get-docker.sh

Docker - Basic Commands:
------------------------

    # Search a container - Example
    $ docker search ubuntu
    # Download the container
    $ docker pull ubuntu
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

Docker Compose - Basic Commands:
--------------------------------

    # The old way to run docker compose 
    # Depending on how you installed Docker Compose, can modify
    $ docker-compose up -d
    # Docker Plugin uses docker compose instead of docker-compose
    $ docker compose build      Build or rebuild services
    $ docker compose convert    Converts the compose file to platform’s canonical format
    $ docker compose cp         Copy files/folders between a service container and the local filesystem
    $ docker compose create     Creates containers for a service.
    $ docker compose down       Stop and remove containers, networks
    $ docker compose events     Receive real time events from containers.
    $ docker compose exec       Execute a command in a running container.
    $ docker compose images     List images used by the created containers
    $ docker compose kill       Force stop service containers.
    $ docker compose logs       View output from containers
    $ docker compose ls         List running compose projects
    $ docker compose pause      Pause services
    $ docker compose port       Print the public port for a port binding.
    $ docker compose ps         List containers
    $ docker compose pull       Pull service images
    $ docker compose push       Push service images
    $ docker compose restart    Restart service containers
    $ docker compose rm         Removes stopped service containers
    $ docker compose run        Run a one-off command on a service.
    $ docker compose start      Start services
    $ docker compose stop       Stop services
    $ docker compose top        Display the running processes
    $ docker compose unpause    Unpause services
    $ docker compose up         Create and start containers
    $ docker compose version    Show the Docker Compose version information