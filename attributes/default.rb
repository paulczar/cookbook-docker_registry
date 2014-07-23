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

default[:docker_registry][:ui][:listen_port] = '8080'
default[:docker_registry][:ui][:listen_ip] = '127.0.0.1'
default[:docker_registry][:ui][:config_dir] = '/opt/docker_registry_ui'

# storage driver to enable.
# valid options: local, s3, swift
default[:docker_registry][:storage_driver] = 'local'
default[:docker_registry][:storage_driver_version] = ''

# settings for local storage driver
default[:docker_registry][:local_options] = {
  storage_path: "#{node[:docker_registry][:path]}/storage"
}

# settings for s3 storage driver
default[:docker_registry][:s3_options] = {
  s3_region: 'us-west-1',
  s3_bucket: 'my_docker',
  storage_path: '/registry',
  s3_access_key: '',
  s3_secret_key: ''
}

# settings for swift storage driver
default[:docker_registry][:swift_options] = {
  storage_path: '/registry',
  swift_authurl: 'https://identity.api.rackspacecloud.com/v2.0/',
  swift_container: 'my_docker',
  swift_user: '',
  swift_password: '',
  swift_tenant_name: '',
  swift_region_name: 'DFW'
}
