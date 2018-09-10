#
# Cookbook:: ieducar_cookbook
# Recipe:: instantiate_school
#
# Copyright:: 2018, Rodrigo Sanches Devigo, All Rights Reserved.

cities = data_bag('cities')

cities.each do |city_key|
  city = data_bag_item('cities', city_key)

  # Create the virtual ieducar_vhost
  cookbook_file "/etc/apache2/sites-available/#{city_key}.conf" do
    source 'ieducar_vhost'
  end

  ruby_block "edit_virtual_host" do
    block do
      file = Chef::Util::FileEdit.new("/etc/apache2/sites-available/#{city_key}.conf")
      file.search_file_replace("ieducar.local", "#{city['domain']}")
      file.write_file
    end
  end

  execute 'Ativando o ieducar' do
    command "sudo a2ensite #{city_key}.conf"
  end

  # Insert the school's information in ieducar.ini
  ruby_block "edit_ieducar_ini" do
    block do
      regex = "[#{city['domain']} : production]"
      file = Chef::Util::FileEdit.new("/home/ieducar/app/shared/ieducar/configuration/ieducar.ini")
      file.insert_line_if_no_match(/#{Regexp.escape(regex)}/, "\[#{city['domain']} : production\]")
      file.write_file
      file.insert_line_after_match(/#{Regexp.escape(regex)}/, "app.database.dbname = #{city['app.database.dbname']}")
      file.insert_line_after_match(/#{Regexp.escape(regex)}/, "app.local.country = #{city['app.locale.country']}")
      file.insert_line_after_match(/#{Regexp.escape(regex)}/, "app.locale.timezone = #{city['app.locale.timezone']}")
      file.insert_line_after_match(/#{Regexp.escape(regex)}/, "app.locale.province = #{city['app.locale.province']}")
      file.insert_line_after_match(/#{Regexp.escape(regex)}/, "app.entity.name = #{city['app.entity.name']}")
      file.write_file
    end
  end

  # Insert the school's database information in phinx.xml

  # Restore the school's database and alter search path
  # cookbook_file './ieducar.sql' do
  #   source 'ieducar.sql'
  # end
  #
  # execute 'Criando o db' do
  #   user 'ieducar'
  #   command "/home/ieducar/.pgvm/environments/9.5.11/bin/createdb #{city['app.database.dbname']} -p 5433"
  # end
  #
  # execute 'Restore o db' do
  #   user 'ieducar'
  #   command "/home/ieducar/.pgvm/environments/9.5.11/bin/psql -d #{city['app.database.dbname']} -p 5433 < ieducar.sql"
  # end
  #
  # file 'ieducar.sql' do
  #   action :delete
  # end
  #
  # execute 'Mudando o search_path' do
  #   user 'ieducar'
  #   command "/home/ieducar/.pgvm/environments/9.5.11/bin/psql -d #{city['app.database.dbname']} -p 5433 -c 'ALTER DATABASE '#{city['app.database.dbname']}' SET search_path = \"ieducar\", public, portal, cadastro, acesso, alimentos, consistenciacao, historico, pmiacoes, pmicontrolesis, pmidrh, pmieducar, pmiotopic, urbano, modules;'"
  # end

end

# Restart apache2
execute 'Reload apache 2' do
  command 'sudo service apache2 reload'
end
