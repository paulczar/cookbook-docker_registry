# Encoding: utf-8
#
# Cookbook Name:: docker_registry
# Recipe:: webui
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'docker::default'

directory node[:docker_registry][:ui][:config_dir] do
  owner 'root'
  group 'root'
  mode '0744'
end

docker_image 'atcol/docker-registry-ui' do
  tag 'latest'
end

docker_container 'atcol/docker-registry-ui' do
  detach true
  port "#{node[:docker_registry][:config][:listen_port]}:8080"
  env "REG1=http://#{node[:docker_registry][:config][:listen_ip]}:#{node[:docker_registry][:config][:listen_port]}/v1/"
  volume "#{node[:docker_registry][:ui][:config_dir]}:/var/lib/h2"
  tag 'latest'
end
