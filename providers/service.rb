# Encoding: utf-8
# Cookbook Name:: docker_registry
# Provider:: service
# Copyright 2014, Paul Czarkowski
# License:: Apache 2.0

require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

def load_current_resource
  new_resource.clone
end

action :disable do
  dr = registry_resources
  case dr[:install_type]
  when 'pip'
    @run_context.include_recipe 'runit::default'
    ri = runit_service dr[:name] do
      action :disable
    end
    new_resource.updated_by_last_action(ri.updated_by_last_action?)
  when 'docker'

  end
end

action :restart do
  dr = registry_resources
  case dr[:install_type]
  when 'pip'
    @run_context.include_recipe 'runit::default'
    ri = runit_service dr[:name] do
      action :restart
    end
    new_resource.updated_by_last_action(ri.updated_by_last_action?)
  when 'docker'

  end
end

action :stop do
  dr = registry_resources
  case dr[:install_type]
  when 'pip'
    @run_context.include_recipe 'runit::default'
    ri = runit_service dr[:name] do
      action :stop
    end
    new_resource.updated_by_last_action(ri.updated_by_last_action?)
  when 'docker'

  end
end

action :start do
  dr = registry_resources
  case dr[:install_type]
  when 'pip'
    @run_context.include_recipe 'runit::default'
    ri = runit_service dr[:name] do
      action :start
    end
    new_resource.updated_by_last_action(ri.updated_by_last_action?)
  when 'docker'

  end
end

action :enable do
  dr = registry_resources
  @run_context.include_recipe 'runit::default'
  ri = runit_service dr[:name] do
    options(
      name: dr[:name],
      path: dr[:path],
      listen_ip: dr[:listen_ip],
      listen_port: dr[:listen_port],
      install_type: dr[:install_type],
      user: dr[:user],
      group: dr[:group],
      docker_image: dr[:docker_image]
    )
    cookbook  dr[:templates_cookbook]
    default_logger true
    run_template_name dr[:run_template]
    log_template_name dr[:log_template]
    action :enable
  end
  new_resource.updated_by_last_action(ri.updated_by_last_action?)
end

private

def registry_resources                              #                 [:docker_registry][:local_options]
  storage_driver_options = new_resource.storage_driver_options || node[:docker_registry]["#{new_resource.storage_driver}_options"]
  docker_image = new_resource.docker_image || node[:docker_registry][:images][new_resource.storage_driver]
  registry = {
    name: new_resource.name,
    path: new_resource.path,
    user: new_resource.user,
    group: new_resource.group,
    templates_cookbook: new_resource.templates_cookbook,
    version: new_resource.version,
    install_type: new_resource.install_type,
    storage_driver: new_resource.storage_driver,
    storage_driver_options: storage_driver_options,
    storage_driver_version: new_resource.storage_driver_version,
    listen_ip: new_resource.listen_ip,
    listen_port: new_resource.listen_port,
    docker_image: docker_image,
    run_template: new_resource.run_template,
    log_template: new_resource.log_template
  }
  registry
end
