clone the IntelOwl project repository
--------------------------------------
    git clone https://github.com/intelowlproject/IntelOwl
    cd IntelOwl/

construct environment files from templates
------------------------------------------
    cp docker/env_file_app_template docker/env_file_app
    cp docker/env_file_postgres_template docker/env_file_postgres
    cp docker/env_file_integrations_template docker/env_file_integrations
    cp frontend/public/env_template.js frontend/public/env.js

verify installed dependencies & Start the APP
------------------------------
    ./start prod up

Create a superuser
--------------
    sudo docker exec -ti intelowl_uwsgi python3 manage.py createsuperuser
    now you can login with the created user from http://localhost:80/login
