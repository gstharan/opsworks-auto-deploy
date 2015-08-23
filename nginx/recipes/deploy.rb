#Install the nginx


package 'nginx' do
  action :install
end

template "/etc/nginx/sites-available/bellefit" do
cookbook 'nginx'
source 'bellefit.erb'
end

template "/etc/nginx/nginx.conf" do
cookbook 'nginx'
source 'nginx.erb'
end

template "/etc/nginx/sites-available/3dcart" do
cookbook "nginx"
source "apirest.3dcart.conf"
end

link "/etc/nginx/sites-enabled/default" do
  action :delete
  only_if "test -L /etc/nginx/sites-enabled/default"
end

link "/etc/nginx/sites-enabled/bellefit" do
  to "/etc/nginx/sites-available/bellefit"
end

link "etc/nginx/sites-enabled/3dcart" do
  to "/etc/nginx/sites-available/apirest.3dcart.conf"
end
#nginx reload
service "nginx" do
  action :reload
end

