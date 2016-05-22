
echo "=== Installing ArangoDB..."
wget https://www.arangodb.com/repositories/arangodb2/xUbuntu_12.04/Release.key
apt-key add - < Release.key
rm -f Release.key

echo 'deb https://www.arangodb.com/repositories/arangodb2/xUbuntu_12.04/ /' | sudo tee /etc/apt/sources.list.d/arangodb.list
apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install arangodb=2.8.9 -y

# Change endpoint binding so the admin interface can be used with Vagrant port forwarding
sed -i "s|^endpoint = tcp://127.0.0.1:8529|endpoint = tcp://0.0.0.0:8529|" /etc/arangodb/arangod.conf
/etc/init.d/arangodb restart

echo "ArangoDB server daemon (default HTTP port 8529)"
echo "sudo /etc/init.d/arangodb <start|stop|status>"