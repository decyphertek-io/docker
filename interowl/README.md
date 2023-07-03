clone the IntelOwl project repository
--------------------------------------
    git clone https://github.com/intelowlproject/IntelOwl
    cd IntelOwl/

construct environment files from templates
------------------------------------------
    cd docker/
    cp env_file_app_template env_file_app
    cp env_file_postgres_template env_file_postgres
    cp env_file_integrations_template env_file_integrations
    cd ..
    cp frontend/public/env_template.js frontend/public/env.js

verify installed dependencies
------------------------------
    ./initialize.sh

start the app
--------------
    python3 start.py prod up
    # now the application is running on http://localhost:80
    # create a super user 
    docker exec -ti intelowl_uwsgi python3 manage.py createsuperuser
    # now you can login with the created user form http://localhost:80