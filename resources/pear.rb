action :create do
  remote_file 'Baixando Mail' do
    source 'http://download.pear.php.net/package/Mail-1.2.0.tgz'
    path './Mail-1.2.0.tgz'
  end

  remote_file 'Baixando Net_Socket' do
    source 'http://download.pear.php.net/package/Net_Socket-1.0.14.tgz'
    path './Net_Socket-1.0.14.tgz'
  end

  remote_file 'Baixando Net_SMTP' do
    source 'http://download.pear.php.net/package/Net_SMTP-1.6.2.tgz'
    path './Net_SMTP-1.6.2.tgz'
  end

  remote_file 'Baixando Net_URL' do
    source 'http://download.pear.php.net/package/Net_URL2-2.0.5.tgz'
    path './Net_URL2-2.0.5.tgz'
  end

  remote_file 'Baixando HTTP_Request2' do
    source 'http://download.pear.php.net/package/HTTP_Request2-2.2.0.tgz'
    path './HTTP_Request2-2.2.0.tgz'
  end

  remote_file 'Baixando Services_ReCaptcha' do
    source 'http://download.pear.php.net/package/Services_ReCaptcha-1.0.3.tgz'
    path './Services_ReCaptcha-1.0.3.tgz'
  end

  execute 'Instalando Mail pear' do
    command 'pear install -O ./Mail-1.2.0.tgz'
  end

  execute 'Instalando Net_Socket pear' do
    command 'pear install -O ./Net_Socket-1.0.14.tgz'
  end

  execute 'Instalando Net_SMTP-1.6.2 pear' do
    command 'pear install -O ./Net_SMTP-1.6.2.tgz'
  end

  execute 'Instalando Net_URL2-2.0.5 pear' do
    command 'pear install -O ./Net_URL2-2.0.5.tgz'
  end

  execute 'Instalando HTTP_Request2-2.2.0 pear' do
    command 'pear install -O ./HTTP_Request2-2.2.0.tgz'
  end

  execute 'Instalando Services_ReCaptcha-1.0.3 pear' do
    command 'pear install -O ./Services_ReCaptcha-1.0.3.tgz'
  end

  file 'Mail-1.2.0.tgz' do
    action :delete
  end

  file 'Net_Socket-1.0.14.tgz' do
    action :delete
  end

  file 'Net_SMTP-1.6.2.tgz' do
    action :delete
  end

  file 'Net_URL2-2.0.5.tgz' do
    action :delete
  end

  file 'HTTP_Request2-2.2.0.tgz' do
    action :delete
  end

  file 'Services_ReCaptcha-1.0.3.tgz' do
    action :delete
  end
end
