# Encoding: utf-8
#
# Cookbook Name:: docker_registry
# Attributes:: default


# docker image
default['docker_registry']['image'] = 'registry'

# version of docker registry to run
default['docker_registry']['version'] = '2.1.1'

# use a volume mount for local files when using container method
default['docker_registry']['volume_mount'] = ''

# default name of running image
default['docker_registry']['name'] = 'docker_registry'

# IP and Port to listen on.
default['docker_registry']['listen_ip'] = '0.0.0.0'
default['docker_registry']['listen_port'] = 5000

# databag containing docker_registry secrets.
# set to `attributes` if using attributes.
default['docker_registry']['secrets'] = ''
default['docker_registry']['encrypted_databag'] = false # true or false

# storage driver to enable.
# valid options: local, s3, swift # anything else will result in no persistent storage
default['docker_registry']['storage_driver'] = 'local'

# settings for local storage driver
default['docker_registry']['storage']['local']['storage_path'] = '/var/lib/registry'

# session secret, should be same for multiple load balanced registries
default['docker_registry']['http']['secret'] = 'asecretforlocaldevelopment'

# set to info or warn for prod
default['docker_registry']['log']['level'] = 'debug'

# settings for s3 storage driver
default['docker_registry']['storage']['s3'] = {
  region: 'us-west-1',
  bucket: 'my_docker',
  rootdirectory: '/registry',
  accesskey: 'nopenopenope',
  secretkey: 'nopenopenope',
  encrypt: true,
  secure: true,
  v4auth: true,
  chunksize: 5242880
}

# settings for swift storage driver
default['docker_registry']['storage']['swift'] = {
    username: 'username',
    password: 'password',
    authurl: 'https://identity.api.rackspacecloud.com/v2.0/',
    tenant: 'tenant',
    tenantid: nil, # use this or tenant not both
    domain: nil, # domain name for Openstack Identity v3 API
    domainid: nil, #domain id for Openstack Identity v3 API
    insecureskipverify: true,
    region: 'DFW',
    container: 'my_docker',
    rootdirectory: '/registry'
}
