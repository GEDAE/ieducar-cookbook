action :create do
  execute 'Instalando PGVM' do
    cwd '/home/ieducar'
    user 'ieducar'
    command 'wget https://raw.github.com/guedes/pgvm/master/bin/pgvm-self-install'
  end

  execute 'Instalando PGVM' do
    cwd '/home/ieducar'
    user 'ieducar'
    command 'sudo su -c \'bash pgvm-self-install --update\' ieducar'
  end

  execute 'Removendo o script do pgvm' do
    cwd '/home/ieducar'
    user 'ieducar'
    command 'rm pgvm-self-install'
  end

  execute 'source' do
    cwd '/home/ieducar'
    user 'ieducar'
    command 'sudo su -c \'source .bashrc\' ieducar'
  end

  execute 'criar diertorio do src' do
    user 'ieducar'
    command 'mkdir -p /home/ieducar/.pgvm/src'
  end

  cookbook_file '/home/ieducar/.pgvm/src/postgresql-8.2.23.tar.gz' do
    source 'postgresql-8.2.23.tar.gz'
  end

  cookbook_file '/home/ieducar/.pgvm/src/postgresql-8.2.23.tar.gz.md5' do
    source 'postgresql-8.2.23.tar.gz.md5'
  end

  execute 'Instalando Postgres 8.2.23' do
    environment ({"pgvm_home" => "/home/ieducar/.pgvm",
      "pgvm_clusters" => "/home/ieducar/.pgvm/clusters",
      "pgvm_logs" => "/home/ieducar/.pgvm/logs",
      "pgvm_environments" => "/home/ieducar/.pgvm/environments",
      "PATH" => "/home/ieducar/.pgvm/bin:/home/ieducar/.pgvm/environments/current/bin:#{ENV['PATH']}",
      "CONFIG_OPTS" => "CC=gcc-4.7",
      "MAKE_OPTS" => "-j4"})
    user 'ieducar'
    command 'pgvm install 8.2.23'
  end

  execute 'Usando Postgres 8.2.23' do
    environment ({"pgvm_home" => "/home/ieducar/.pgvm",
      "pgvm_clusters" => "/home/ieducar/.pgvm/clusters",
      "pgvm_logs" => "/home/ieducar/.pgvm/logs",
      "pgvm_environments" => "/home/ieducar/.pgvm/environments",
      "PATH" => "/home/ieducar/.pgvm/bin:/home/ieducar/.pgvm/environments/current/bin:#{ENV['PATH']}",
      "CONFIG_OPTS" => "CC=gcc-4.7",
      "MAKE_OPTS" => "-j4"})
    user 'ieducar'
    command 'pgvm use 8.2.23'
  end

  execute 'Cliando um cluster Postgres 8.2.23' do
    environment ({"pgvm_home" => "/home/ieducar/.pgvm",
      "pgvm_clusters" => "/home/ieducar/.pgvm/clusters",
      "pgvm_logs" => "/home/ieducar/.pgvm/logs",
      "pgvm_environments" => "/home/ieducar/.pgvm/environments",
      "PATH" => "/home/ieducar/.pgvm/bin:/home/ieducar/.pgvm/environments/current/bin:#{ENV['PATH']}",
      "CONFIG_OPTS" => "CC=gcc-4.7",
      "MAKE_OPTS" => "-j4"})
    user 'ieducar'
    command 'pgvm cluster create main'
  end

  execute 'Cliando um cluster Postgres 8.2.23' do
    environment ({"pgvm_home" => "/home/ieducar/.pgvm",
      "pgvm_clusters" => "/home/ieducar/.pgvm/clusters",
      "pgvm_environments" => "/home/ieducar/.pgvm/environments",
      "pgvm_logs" => "/home/ieducar/.pgvm/logs",
      "PATH" => "/home/ieducar/.pgvm/bin:/home/ieducar/.pgvm/environments/current/bin:#{ENV['PATH']}",
      "CONFIG_OPTS" => "CC=gcc-4.7",
      "MAKE_OPTS" => "-j4"})
    user 'ieducar'
    command 'pgvm cluster start main'
  end
end
