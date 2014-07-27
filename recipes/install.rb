# Encoding: utf-8
#
# Cookbook Name:: docker_registry
# Recipe:: install
#
# Copyright 2014, Paul Czarkowski
#

docker_registry_instance 'registry' do
  install_type 'docker'
  version 'latest'
  docker_image 'registry'
end

docker_registry_config 'registry' do
  install_type 'docker'
  version 'latest'
end

docker_registry_service 'registry' do
  install_type 'docker'
  version 'latest'
  subscribes :restart, 'docker_registry_config[registry]', :delayed
  action [:enable, :start]
end
