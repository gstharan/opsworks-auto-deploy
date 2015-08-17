include_recipe 'aws'

aws_s3_file "backend_deploy" do
  bucket node[:my_backend_apps][:s3bucket]
  remote_path node[:my_backend_apps][:be_file]
  aws_access_key_id node[:my_backend_apps][:custom_access_key]
  aws_secret_access_key node[:my_backend_apps][:custom_secret_key]
end
