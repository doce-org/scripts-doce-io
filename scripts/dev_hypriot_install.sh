#!bin/bash

# install apt-get on hypriot
curl -s https://packagecloud.io/install/repositories/Hypriot/Schatzkiste/script.deb.sh | sudo bash

# run the postgres docker container
docker run --name doce-postgres -e POSTGRES_PASSWORD=doce -d tobi312/rpi-postgresql

# prepare the project folder
mkdir app
cd app

# setup the api
git clone https://github.com/doce-org/api-doce-io.git api.doce.io
cd api.doce.io/scripts
sh rpi_dev_docker.sh
cd

# setup the web app
git clone https://github.com/doce-org/web-doce-io.git web.doce.io
cd web.doce.io/dist
npm run postinstall

