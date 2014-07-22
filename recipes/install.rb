# Encoding: utf-8
#
# Cookbook Name:: docker_registry
# Recipe:: install
#
# Copyright 2014, Paul Czarkowski
#

docker_registry_instance 'docker_registry'

docker_registry_config 'docker_registry'

docker_registry_service 'docker_registry'

service 'docker_registry' do
  action :nothing
  subscribes :restart, "template/#{node[:docker_registry][:path]}/config/config.yml"
  subscribes :restart, "template/#{node[:docker_registry][:path]}/config/config.env"
end
