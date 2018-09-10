action :create do
  cookbook_file '/etc/apache2/sites-available/ieducar.conf' do
    source 'ieducar_vhost'
  end

  execute 'Reload apache 2' do
    command 'sudo a2enmod rewrite'
  end
  #
  execute 'Reload apache 2' do
    command 'sudo service apache2 reload'
  end

  execute 'Ativando o ieducar' do
    command 'sudo a2ensite ieducar.conf'
  end

  execute 'Desativando o 000-default' do
    command 'sudo a2dissite 000-default.conf'
  end

  directory '/home/ieducar/app' do
    owner 'ieducar'
    group 'sudo'
    mode '0775'
  end

  directory '/home/ieducar/app/shared' do
    owner 'ieducar'
    group 'sudo'
    mode '0775'
  end

  directory '/home/ieducar/app/shared/ieducar' do
    owner 'ieducar'
    group 'sudo'
    mode '0775'
  end

  directory '/home/ieducar/app/shared/ieducar/vendor' do
    owner 'ieducar'
    group 'sudo'
    mode '0775'
  end

  directory '/home/ieducar/app/shared/ieducar/configuration' do
    owner 'ieducar'
    group 'sudo'
    mode '0775'
  end

  remote_file '/home/ieducar/app/shared/phinx.php' do
    source 'https://github.com/portabilis/i-educar/blob/master/phinx.php.sample'
  end

  remote_file '/home/ieducar/app/shared/ieducar/configuration/ieducar.ini' do
    source 'https://raw.githubusercontent.com/portabilis/i-educar/master/ieducar/configuration/ieducar.ini.sample'
  end
end
