action :create do

  # execute 'Dropando o db caso ele exista' do
  #     command '/home/ieducar/.pgvm/environments/8.2.23/bin/dropdb ieducar -p 5433'
  # end

  cookbook_file './ieducar.sql' do
    source 'ieducar.sql'
  end

  execute 'Criando o db' do
    user 'ieducar'
    command '/home/ieducar/.pgvm/environments/9.5.11/bin/createdb ieducar -p 5433'
  end

  execute 'Restore o db' do
    user 'ieducar'
    command '/home/ieducar/.pgvm/environments/9.5.11/bin/psql -d ieducar -p 5433 < ieducar.sql'
  end

  file 'ieducar.sql' do
    action :delete
  end

  execute 'Mudando o search_path' do
    user 'ieducar'
    command "/home/ieducar/.pgvm/environments/9.5.11/bin/psql -d ieducar -p 5433 -c 'ALTER DATABASE 'ieducar' SET search_path = \"ieducar\", public, portal, cadastro, acesso, alimentos, consistenciacao, historico, pmiacoes, pmicontrolesis, pmidrh, pmieducar, pmiotopic, urbano, modules;'"
  end
end
