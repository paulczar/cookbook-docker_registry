# Encoding: utf-8
name             'docker_registry'
maintainer       'Paul Czarkowski'
maintainer_email 'username.taken@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures docker_registry'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

%w(ubuntu debian).each do |os|
  supports os
end

depends 'runit', '~> 1.7.2'
depends 'git', '~> 4.3.1'
depends 'python', '~> 1.4.6'
depends 'docker', '~> 0.37.0'
depends 'apt', '~> 2.7.0'

%w(yum).each do |ckbk|
  recommends ckbk
end
