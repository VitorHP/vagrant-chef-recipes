
package "postgresql-9.1"
package "libpq-dev"

execute "stop database" do
  user "postgres"
  command "/etc/init.d/postgresql stop"
end

template "/etc/postgresql/9.1/main/pg_hba.conf" do
  source "pg_hba.conf"
  owner "postgres"
  group "postgres"
end

template "/etc/postgresql/9.1/main/postgresql.conf" do
  source "postgresql.conf"
  owner "postgres"
  group "postgres"
end

if File.exists? "/var/lib/postgresql/9.1/main/data/"
  execute "rm -rf /var/lib/postgresql/9.1/main/data/*"
end

execute "create new datadir" do
  user "postgres"
  command "/usr/lib/postgresql/9.1/bin/initdb --locale=pt_BR.UTF-8 -D /var/lib/postgresql/9.1/main/data"
end

execute "start database" do
  user "postgres"
  command "/etc/init.d/postgresql start"
end
