action :create do
  execute 'Instalando Mail pear' do
    command 'pear install XML_RPC2'
  end

  execute 'Instalando Net_Socket pear' do
    command 'pear install Mail'
  end

  execute 'Instalando Net_SMTP-1.6.2 pear' do
    command 'pear install Net_SMTP'
  end

  execute 'Instalando Net_URL2-2.0.5 pear' do
    command 'pear install Services_ReCaptcha'
  end
end
