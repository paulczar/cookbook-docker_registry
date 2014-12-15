# Encoding: utf-8
name             'docker_registry'
maintainer       'Paul Czarkowski'
maintainer_email 'username.taken@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures docker_registry'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w(ubuntu debian).each do |os|
  supports os
end

%w(build-essential runit git ant python docker).each do |ckbk|
  depends ckbk
end

%w(yum apt).each do |ckbk|
  recommends ckbk
end
