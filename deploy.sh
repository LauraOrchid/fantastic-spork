cd /
amazon-linux-extras install nginx1
wget raw.githubusercontent.com/lauraorchid/fantastic-spork/main/music.tar
tar xf music.tar
chown -R nginx:nginx /music
echo "server {
	server_name floristpony.eu.org;
	listen 80;
	root /music;
}" >> /etc/nginx/conf.d/laura.conf
systemctl enable --now nginx
amazon-linux-extras install python3.8
python3 -m venv /opt/certbot
/opt/certbot/bin/pip install --upgrade pip
/opt/certbot/bin/pip install certbot certbot-nginx
ln -s /opt/certbot/bin/certbot /usr/bin/certbot
certbot --nginx -d floristpony.eu.org
echo "rm /music/result.txt
uptime >> /music/result.txt
yum update -y >> /music/result.txt" >> /one.sh
crontab -e
