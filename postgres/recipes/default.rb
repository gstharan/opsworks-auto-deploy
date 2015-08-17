bash "postgres" do
user "root"
code <<-EOH
touch  /etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql-9.4
EOH
end

