# Encoding: utf-8
name             'docker_registry'
maintainer       'Paul Czarkowski'
maintainer_email 'username.taken@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures docker_registry'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

%w(ubuntu debian).each do |os|
  supports os
end

depends 'docker', '~> 1.0.0'

recommends 'nginx', '~> 2.7.6'
recommends 'openssl', '~> 4.4.0'
recommends 'avahi', '~> 1.0.2'
recommends 'apt'
recommends 'yum'
