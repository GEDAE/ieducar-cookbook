action :create do
  execute 'Criando a conta do banco de dados' do
    user 'postgres'
    command 'psql -c CREATE ROLE ieducar LOGIN ENCRYPTED PASSWORD \'md5d2db8ddcfc6534176fdd0d01ac5cee01\' SUPERUSER INHERIT NOCREATEDB NOCREATEROLE;'
  end
  execute 'Criando o db' do
    user 'postgres'
    command 'createdb ieducar'
  end
end
