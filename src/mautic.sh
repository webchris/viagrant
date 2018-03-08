echo "=== Installing requirements..."
apt-get install -y php libapache2-mod-php7.0 php-gd php-mysql php-curl php-cli php-xdebug php-xml mcrypt php7.0-mcrypt php7.0-zip
apt-get install -y php7.0-bcmath php-zip php-imap php-mailparse php-intl
sudo -u root apt-get install -y php-mbstring php-bcmath php-amqplib php7.0-intl php7.0-imap
apachectl graceful
service apache2 restart

echo "=== Build for Node..."
apt-get install build-essential

echo "--- Installing node.js ---"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "=== Installing npm..."
curl -L https://www.npmjs.com/install.sh | sh

echo "=== Installing Grunt..."
npm install -g grunt-cli

echo "=== Creating Mysql DB (mautic)..."
mysql -u root -e "create database mautic"
mysql -u root -e "GRANT ALL PRIVILEGES ON mautic.* To 'mautic'@'localhost' IDENTIFIED BY 'mautic'"

echo "=== Downloading Mautic..."
if [ ! -f mautic* ]; then
    wget -q --no-check-certificate -O mautic-master.zip https://github.com/mautic/mautic/archive/master.zip
else
    echo "Mautic zip package already exists, using it instead of downloading."
fi

echo "=== Unzipping Mautic..."
# Become ubuntu user to set file ownership correctly:
sudo apt-get install unzip
sudo -u ubuntu unzip -q mautic*
sudo -u ubuntu mkdir -p www
rm -f www/index.php
mv -n mautic*/* www
mv -n mautic*/.* www
rm -rf mautic*/*
rmdir mautic* 2> /dev/null

echo "=== Installing and starting composer..."
cd www
sudo apt -y install composer
composer install

echo "=== Mautic ready to install. Use 'mautic' as database information. ==="
