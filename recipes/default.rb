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
#package 'php-mbstring'
#package 'rpl'

execute 'Git Config' do
  command 'git config --global url."https://".insteadOf git://'
end

ieducar_cookbook_pear 'Instalando Pear Package'
ieducar_cookbook_pgvm 'Instalando Postgres Version Manager'
ieducar_cookbook_config 'Criando a estrutura de diretórios da aplicação'


execute 'Restart Apache 2' do
  command 'sudo service apache2 restart'
end
