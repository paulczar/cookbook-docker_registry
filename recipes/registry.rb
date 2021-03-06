# Encoding: utf-8
#
# Cookbook Name:: docker_registry
# Recipe:: install
#
# Copyright 2014, Paul Czarkowski
#

if node['docker_registry']['ip'] == '0.0.0.0'
  registry_ip = '127.0.0.1'
else
  registry_ip = node['docker_registry']['ip']
end
registry_port = node['docker_registry']['port']

docker_service 'default' do
  provider Chef::Provider::DockerService::Upstart
  insecure_registry node['docker_registry']['insecure']
  action [:create, :start]
  only_if { node['docker_registry']['install_docker'] }
end

docker_image node['docker_registry']['image'] do
  tag node['docker_registry']['version']
  action :pull
end

envs = []
vols = []

envs << "REGISTRY_HTTP_SECRET=#{node['docker_registry']['http']['secret']}"
envs << "REGISTRY_LOG_LEVEL=#{node['docker_registry']['log']['level']}"

case node['docker_registry']['storage_driver']
when 'local'
  vols << "#{node['docker_registry']['storage']['local']['storage_path']}:/var/lib/registry"
when 'swift'
  node['docker_registry']['storage']['swift'].each do |key,val|
    envs << "REGISTRY_STORAGE_SWIFT_#{key.upcase}=#{val}" unless val.nil?
  end
when 's3'
  node['docker_registry']['storage']['s3'].each do |key,val|
    envs << "REGISTRY_STORAGE_S3_#{key.upcase}=#{val}" unless val.nil?
  end
end

docker_container node['docker_registry']['name'] do
  repo node['docker_registry']['image']
  tag node['docker_registry']['version']
  port "#{node['docker_registry']['ip']}:#{node['docker_registry']['port']}:5000"
  env envs
  binds vols
  action :run
end
