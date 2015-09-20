# Encoding: utf-8
#
# Cookbook Name:: docker_registry
# Recipe:: nginx
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'nginx::default'

if node['docker_registry']['web']['ssl']['enabled'] && node['docker_registry']['web']['ssl']['selfsigned']
  include_recipe 'openssl::default'
  openssl_x509 node['docker_registry']['web']['ssl']['cert'] do
    key_file = node['docker_registry']['web']['ssl']['key']
    common_name node['docker_registry']['web']['hostname']
    org 'Docker Registry'
    org_unit 'Containers'
    country 'US'
  end
end

if node['docker_registry']['ip'] == '0.0.0.0'
  registry_ip = '127.0.0.1'
else
  registry_ip = node['docker_registry']['ip']
end

registry_port = node['docker_registry']['port']

template '/etc/nginx/sites-available/docker-registry' do
  source 'docker-registry.nginx.erb'
  notifies :restart, 'service[nginx]'
  variables(
    server_name: node['docker_registry']['web']['hostname'],
    server_aliases: node['docker_registry']['web']['aliases'],
    listen_port: node['docker_registry']['web']['port'],
    ssl_enabled: node['docker_registry']['web']['ssl']['enabled'],
    ssl_port: node['docker_registry']['web']['ssl']['port'],
    ssl_cert: node['docker_registry']['web']['ssl']['cert'],
    ssl_key: node['docker_registry']['web']['ssl']['key'],
    auth_enabled: node['docker_registry']['web']['auth']['enabled'],
    registry_ip: registry_ip,
    registry_port: registry_port
  )
end

nginx_site 'docker-registry'
