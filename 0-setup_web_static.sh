#!/usr/bin/env bash
<<<<<<< HEAD
# describe it then
apt-get update
apt-get -y install nginx

directories=("/data/web_static/releases/test" "/data/web_static/shared/")

for directory in "${directories[@]}"; do
  #  if [ ! -e "$directory" ]; then
  mkdir -p "$directory"
  #  fi
done

echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" >/data/web_static/releases/test/index.html

# Create a symbolic link /data/web_static/current linked to the /data/web_static/releases/test/ folder.
# If the symbolic link already exists, it should be deleted and recreated every time the script is ran
ln --symbolic --force /data/web_static/releases/test /data/web_static/current

# The -R option ensures that the ownership changes are applied
# recursively to all files and directories within the folder
chown -R ubuntu:ubuntu /data/

sed -i '/listen 80 default_server;/a \ \n    location /hbnb_static {\n        alias /data/web_static/current/;\n        index index.html;\n    }' /etc/nginx/sites-available/default

service nginx restart
=======
# Script that sets up web servers for the deployment of web_static.
sudo apt-get update
sudo apt-get -y install nginx
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
echo "Airbnb clone- Deploy static" | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i "45 a \ \n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}" /etc/nginx/sites-enabled/default
sudo service nginx restart
exit 0
>>>>>>> 235aceb83e77b7aedb945d35b1faeae0c9488776
