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


ieducar_cookbook_packages 'Instalando pacotes APT'
ieducar_cookbook_pear 'Instalando Pear Package'
ieducar_cookbook_pg 'Criando a base de dados vazia'
ieducar_cookbook_config 'Preparando a estrutura de diretórios da aplicação para o Capistrano'


execute 'Restart Apache 2' do
  command 'sudo service apache2 restart'
end
