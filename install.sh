#!/bin/bash
sudo apt-get install -y build-essential
sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y ufw
sudo apt-get install -y rabbitmq-server
sudo apt-get install -y tmux
sudo apt-get install -y postgresql postgresql-contrib
sudo apt install -y python3 python3-venv python3-pip python3-venv python-pip
sudo apt-get install -y libsasl2-dev libldap2-dev libssl-dev
sudo apt-get install -y python-ldap gettext libapache2-mod-wsgi
sudo apt-get install -y apache2-utils ssl-cert libapache2-mod-shib2
sudo apt-get install -y libpq-dev
sudo pip3 install psycopg2


sudo pip3 install south
sudo pip3 install uwsgi
sudo pip3 install httplib2
sudo pip3 install oauth2client
sudo apt update
sudo -u postgres createuser $(whoami)
sudo -u postgres createuser root
sudo -u postgres psql -c 'alter user '$(whoami)' with createdb;' postgres
sudo -u postgres createdb -O $(whoami) helios
sudo apt-get update
sudo apt-get install -f
sudo pip3 install -r requirements.txt

python3.6 -m venv $(pwd)/venv
sudo apt install -y libpq-dev
sudo pip3 install psycopg2
source venv/bin/activate
pip3 install -r requirements.txt

sudo chmod 777 reset.sh
sh -x ./reset.sh

source venv/bin/activate
echo IP: $(hostname -i)
echo Run: python manage.py runserver 0.0.0.0:8000
echo Run: celery -A helios worker -S django -l info -E