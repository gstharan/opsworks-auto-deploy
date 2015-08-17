
#For Install the MongoDB server
bash "repo" do
code <<-EOH
apt-get update
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongo.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7F0CEB10
apt-get update
EOH
end



package 'mongodb-org' do
  action :install
end

#Configure the dbpath and listen address and port
template "/etc/mongodb.conf" do
cookbook 'mongodb'
source 'mongodb.erb'
variables( :db_path => node[:mongodb][:conf][:db_path], :log_path => node[:mongodb][:conf][:log_path], :bind_ip => node[:mongodb][:conf][:bind_ip], :port => node[:mongodb][:conf][:port] )
end

#Reload the service
service "mongod start" do
  service_name "mongod"
  action :reload
end

