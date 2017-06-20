#!bin/bash

setup_doce_api_server() {

    # setup the api
    echo -n 'Downloading the api server...'
    git clone https://github.com/doce-org/api-doce-io.git api.doce.io

    echo -n 'Launching api server docker container...'
    cd api.doce.io/scripts
    chmod +x *
    sh rpi_dev_docker.sh
    cd ../..

}

setup_doce_web_app() {

    # setup the web app
    echo -n 'Downloading the web application...'
    git clone https://github.com/doce-org/web-doce-io.git web.doce.io

    echo -n 'Launching web app docker container...'
    cd web.doce.io/scripts
    chmod +x *
    sh rpi_dev_docker.sh

}

main() {

    # prepare the project folder
    echo -n 'Preparing installation folder...'
    if [ -d "app" ]; then
        sudo rm -rf app
    fi
    mkdir app
    cd app

    # setup the api server
    setup_doce_api_server

    # setup the web app
    setup_doce_web_app

    cd

    echo -n 'Installation is finished. You may wait for a few minutes, until all docker are up and running...'
    echo -n 'You will then be able to access D.O.C.E from a web browser at this address: http:/black-pearl:8080/ (local only)'

}

main

