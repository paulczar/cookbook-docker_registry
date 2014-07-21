# Encoding: utf-8
# Cookbook Name:: docker_registry
# Provider:: config
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

action :create do
  dr = registry_resources
  Chef::Log.info("creating config files at #{dr[:path]}")

  dir = directory "#{dr[:path]}/config" do
    owner dr[:user]
    group dr[:group]
    recursive true
    mode '0755'
    action :create
  end
  new_resource.updated_by_last_action(dir.updated_by_last_action?)

  tpl = template "#{dr[:path]}/config/config.yml" do
    source 'config.yml.erb'
    cookbook dr[:templates_cookbook]
    group dr[:group]
    owner dr[:user]
    mode '0600'
    action :create
  end
  new_resource.updated_by_last_action(tpl.updated_by_last_action?)

  tpl = template "#{dr[:path]}/config/config.env" do
    source 'config.env.erb'
    cookbook dr[:templates_cookbook]
    group dr[:group]
    owner dr[:user]
    mode '0700'
    variables registry: dr, config: "#{dr[:path]}/config/config.yml"
    action :create
  end
  new_resource.updated_by_last_action(tpl.updated_by_last_action?)
end

private

def registry_resources
  registry = {
    path: new_resource.path,
    user: new_resource.user,
    group: new_resource.group,
    listen_ip: new_resource.listen_ip,
    listen_port: new_resource.listen_port,
    flavor: new_resource.flavor,
    flavor_opts: new_resource.flavor_opts,
    templates_cookbook: new_resource.templates_cookbook
  }
  registry
end
