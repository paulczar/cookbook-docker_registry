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

action :remove do
  dr = registry_resources
  %w(config.yml config.env).each do |file|
    dr_dir = file "#{dr[:path]}/#{file}" do
      action :delete
    end
    new_resource.updated_by_last_action(dr_dir.updated_by_last_action?)
  end
end

action :restart do
  dr = registry_resources
  @run_context.include_recipe 'runit::default'
  ri = runit_service dr[:name] do
    action :restart
  end
  new_resource.updated_by_last_action(ri.updated_by_last_action?)
end

action :create do
  dr = registry_resources
  @run_context.include_recipe 'runit::default'
  ri = runit_service dr[:name] do
    options(
      path: dr[:path],
      user: dr[:user],
      group: dr[:group]
   )
    cookbook  dr[:templates_cookbook]
    default_logger true
  end
  new_resource.updated_by_last_action(ri.updated_by_last_action?)
end

private

def registry_resources
  registry = {
    name: new_resource.name,
    path: new_resource.path,
    user: new_resource.user,
    group: new_resource.group,
    templates_cookbook: new_resource.templates_cookbook
  }
  registry
end
