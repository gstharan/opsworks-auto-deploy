  script "execute_migration" do
    interpreter "bash"
    user "root"
    code <<-EOH
      docker exec app0  ./swf/core/bin/knex migrate:latest
    EOH
  end



