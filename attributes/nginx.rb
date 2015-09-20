override['nginx']['default_site_enabled'] = false

default['docker_registry']['web']['hostname'] = 'registry.local'
default['docker_registry']['web']['aliases'] = 'registry'
default['docker_registry']['web']['port'] = '80'

default['docker_registry']['web']['ssl']['enabled'] = false
default['docker_registry']['web']['ssl']['port'] = '443'
default['docker_registry']['web']['ssl']['selfsigned'] = false
default['docker_registry']['web']['ssl']['cert'] = '/etc/nginx/conf.d/registry.crt'
default['docker_registry']['web']['ssl']['key'] = '/etc/nginx/conf.d/registry.key'

default['docker_registry']['web']['auth']['enabled'] = false
