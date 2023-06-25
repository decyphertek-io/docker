AutoGPT
=======

Unleash ChatGPT and even have it execute linux commands in reference to completing a requested task. Be careful, this can get costly. 

Install
-------

    # Optional: If using an immutable system and no python, then:
    $ wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
    $ bash Anaconda3-2023.03-1-Linux-x86_64.sh
    # Replace <PATH_TO_CONDA> with the path to your conda install
    $ source <PATH_TO_CONDA>/bin/activate
    $ conda init
    $ conda config --set auto_activate_base True
    $ conda install pip
    # Autogpt - clone repo.
    $ git clone -b stable https://github.com/Significant-Gravitas/Auto-GPT.git
    $ mv Auto-GPT/ .Auto-GPT/ 
    $ cd .Auto-GPT
    $ mv .env.template .env
    $ vim .env
    OPENAPI Key = your api key
    # May have to run with sudo, depending on the setup. 
    $ pip install -r requirements.txt
    $ python3 -m autogpt 
    # Optional: Runs nonstop to solve the problem. 
    $ python3 -m autogpt --continuous 
    # Optional: Text to speech. Still troubleshooting Elevenlabs TTS API . 
    $ python3 -m autogpt --speak
    # FOllow the instructions from terminal.


References
----------

    https://docs.agpt.co/setup/


