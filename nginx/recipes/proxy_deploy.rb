
template "/etc/nginx/nginx.conf" do
cookbook 'nginx'
source 'nginx.config.erb'
end


node[:deploy].each do |application, deploy|
 if deploy[:environment_variables][:APP_SUB_TYPE] != "nginx_outbound"
   Chef::Log.warn("Skipping nginx-outbound application #{application} as app_sub_type is not set to nginx_outbound")
   next
 end
 Chef::Log.warn("Running nginx_outbound application #{application} as app_sub_type is set to nginx_outbound")
 nginx_web_app application do
   cookbook "nginx"
   template "proxy_site.erb"
   deploy deploy
   application deploy
 end
end

#nginx reload
service "nginx" do
  action :reload
end

