
sudo apt-get -y update
sudo apt-get -y install python3 python3-venv python3-dev
sudo apt-get -y install  nginx supervisor git

cd ~
mkdir att1
cd att1

git clone https://github.com/dgranuzzo/Att-aws

python3 -m venv att-env

source att-env/bin/activate


pip install -r requirements.txt
pip install gunicorn

echo "export FLASK_APP=micro1.py" >> ~/.profile

SECRET_KEY=52cb883e323erwertyt365rgdx8e951ba4a


gunicorn app:app -b localhost:8000 &

#

sudo supervisorctl reread
sudo service supervisor restart

#arquivo virtual.conf

sudo nginx -t
sudo service nginx restart

# após micro1.conf

sudo supervisorctl reload

mkdir certs
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout certs/key.pem -out certs/cert.pem

sudo rm /etc/nginx/sites-enabled/default
#cria arquivo micro1

sudo service nginx reload