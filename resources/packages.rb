action :create do
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
  package 'libreadline6-dev'
  package 'make'
  package 'gcc'
  package 'zlib1g-dev'
  package 'flex'
  package 'bison'
  package 'apache2'
  package 'libapache2-mod-php7.0'
  package 'php7.0'
  package 'php7.0-pgsql'
  package 'php7.0-curl'
  package 'php-pear'
  package 'php-xdebug'
  package 'php-zip'
  package 'git-core'
  package 'gcc-4.7'
  package 'openjdk-8-jre'
  package 'php-mbstring'
  package 'postgresql'
  package 'postgresql-contrib'

  execute 'Git Config' do
    command 'git config --global url."https://".insteadOf git://'
  end
end
