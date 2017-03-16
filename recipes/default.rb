#
# Cookbook Name:: ieducar
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

user 'ieducar' do
  group 'sudo'
  shell '/bin/bash'
  password '$1$.1VOZ8qJ$eIDOOtIIud0KPR82S0iY2/'
  manage_home true
  home '/home/ieducar'
end

execute 'locale' do
  command 'sudo echo -e "pt_BR.ISO-8859-1 ISO-8859-1 \nen_US.ISO-8859-1 ISO-8859-1" >> /var/lib/locales/supported.d/local'
end

execute 'dpkg' do
  command 'sudo dpkg-reconfigure locales'
end

execute 'update-locale' do
  command 'sudo update-locale LC_ALL=pt_BR.ISO-8859-1 LANG=pt_BR.ISO-8859-1'
end

#passwd 6AWr2#ach8WedEHu3ReZ

package 'curl'
package 'wget'
package 'rpl'
package 'unzip'
package 'libreadline6'
package 'libreadline-dev'
package 'make'
package 'gcc'
package 'zlib1g-dev'
package 'flex'
package 'bison'
package 'apache2'
package 'libapache2-mod-php5'
package 'php5-pgsql'
package 'php5-curl'
package 'php-pear'
package 'git-core'
package 'gcc-4.7'

execute 'Git Config' do
  command 'git config --global url."https://".insteadOf git://'
end

ieducar_pear 'Instalando Pear Package'

ieducar_pgvm 'Instalando PGVM'

ieducar_pg 'Instalando Postgres e instanciando o banco'

ieducar_config 'Configurando o apache'

execute 'Adiciona inicializacao do postgres' do
  command 'echo "@reboot $HOME/.pgvm/environments/8.2.23/bin/postgres -D $HOME/.pgvm/clusters/8.2.23/main" > tmp_crontab'
end

execute 'Atualiza crontab' do
  command 'crontab tmp_crontab'
end

execute 'Remove crontab temporaria' do
  command 'rm tmp_crontab'
end

execute 'Restart Apache 2' do
  command 'sudo service apache2 restart'
end
