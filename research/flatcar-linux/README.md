FlatCar Linux
==============

"Flatcar Container Linux's built-in security features, minimal design and automated updates provide a strong foundation for your infrastructure's security strategy."

Ubuntu Butane Install ( Ignition )
----------------------
    $ sudo apt install alien
    # wget butane ((can run in docker as well ( docker run -p 8080:8080 ghcr.io/meixxi/butane-converter:latest ) ))
    $ wget https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Everything/x86_64/os/Packages/b/butane-0.15.0-3.fc37.x86_64.rpm
    $ sudo alien butane-0.15.0-3.fc37.x86_64.rpm
    $ sudo dpkg -i butane-0.15.0-3.fc37.x86_64.deb
    $ vim flatcar.bu

    variant: flatcar 
    version: 1.0.0
    storage:
      files:
      - path: /etc/hostname  
        contents:
          inline: decyphertek  
    systemd:
      units:
        - name: docker.service
          enabled: true

    $ butane --pretty --strict flatcar.bu > flatcar.ign
    # Cat flatcar.ign and copy its contents
    $ cat flatcar.ign

    {
      "ignition": {
        "version": "3.3.0"
      },
      "storage": {
        "files": [
          {
            "path": "/etc/hostname",
            "contents": {
              "compression": "",
              "source": "data:,decyphertek"
            }
          }
        ]
      },
      "systemd": {
        "units": [
          {
            "enabled": true,
            "name": "docker.service"
          }
        ]
      }
    }

    # Subscribe to Flatcar Linux 
    # https://aws.amazon.com/marketplace/pp/prodview-2hdonbnvl3s4c?sr=0-1&ref_=beagle&applicationId=AWSMPContessa
    # Launch Flatcar Ec2 instance
    # Add the flatcar.ign to your user data under advanced settings
    # Launch Flatcar Ec2 instance
    # SSH Into the system
    $ ssh core@ip-of-server

Docker Compose binary install
-------------------------------

    # Install Docker Compose
    $ sudo curl -L https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o /opt/bin/docker-compose
    $ sudo  chmod +x /opt/bin/docker-compose
    $ docker-compose --version



Alternate method
-------------------

    $ lsblk
    # May have to format it. 
    $ sudo flatcar-install -d /dev/nvme0n1 -i flatcar.ign
    $ sudo reboot


References
--------------

    https://www.flatcar.org/docs/latest/container-runtimes/getting-started-with-docker/
    https://github.com/flatcar/container-linux-config-transpiler/blob/flatcar-master/doc/getting-started.md
    https://github.com/coreos/docs/blob/master/os/booting-on-ec2.md
    https://computingforgeeks.com/install-flatcar-container-linux-in-proxmox-ve/

https://serversforhackers.com/c/div-variables-in-docker-compose