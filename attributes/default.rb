# Encoding: utf-8
#
# Cookbook Name:: docker_registry
# Attributes:: default

# version of docker registry to run
default[:docker_registry][:version] = '0.7.3'

# method to install (pip)
default[:docker_registry][:install_type] = 'pip'

# cookbook containing templates
default[:docker_registry][:template_cookbook] = 'docker_registry'

# default name of service for runit
default[:docker_registry][:name] = 'docker_registry'

# user to run docker_registry as
default[:docker_registry][:user] = 'docker_registry'
default[:docker_registry][:group] = node[:docker_registry][:user]

default[:docker_registry][:path] = '/opt/docker_registry'

# registry settings
default[:docker_registry][:config][:listen_ip] = '0.0.0.0'
default[:docker_registry][:config][:listen_port] = 5000
default[:docker_registry][:config][:flavor] = ['local'] # local, s3, swift
default[:docker_registry][:config][:flavor_opts] = {
  storage_path: '/tmp/registry'
}
# databag containing docker_registry secrets.
# set to `attributes` if using attributes.
default[:docker_registry][:secrets] = ''
default[:docker_registry][:encrypted_databag] = false # true or false
