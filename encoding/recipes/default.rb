
execute 'installs encoding pt_br' do
  user 'root'
  command 'locale-gen --no-purge --lang pt_BR '
end
