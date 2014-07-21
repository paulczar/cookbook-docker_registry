# Encoding: utf-8
# Cookbook Name:: docker_registry
# Provider:: instance
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
  dr_dir = directory dr[:path] do
    recursive true
    action :delete
  end
  new_resource.updated_by_last_action(dr_dir.updated_by_last_action?)
end

action :create do
  dr = registry_resources
  Chef::Log.info("Installing docker_registry to #{dr[:path]} via #{dr[:install_type]}")

  ur = user dr[:user] do
    home dr[:path]
    system true
    action :create
    manage_home true
    uid dr[:uid]
  end
  new_resource.updated_by_last_action(ur.updated_by_last_action?)

  gr = group dr[:group] do
    gid dr[:gid]
    members dr[:user]
    append true
    system true
  end
  new_resource.updated_by_last_action(gr.updated_by_last_action?)

  case dr[:install_type]
  when 'pip'
    @run_context.include_recipe 'python::default'

    %w(build-essential libevent-dev liblzma-dev).each do |pkg|
      i_pkg = package pkg
      new_resource.updated_by_last_action(i_pkg.updated_by_last_action?)
    end

    dr_venv = python_virtualenv dr[:path] do
      owner dr[:user]
      group dr[:group]
      action :create
    end
    new_resource.updated_by_last_action(dr_venv.updated_by_last_action?)

    dr_pip_reg = python_pip 'docker-registry' do
      virtualenv dr[:path]
      user dr[:user]
      group dr[:group]
      version dr[:version]
    end
    new_resource.updated_by_last_action(dr_pip_reg.updated_by_last_action?)

  end
end

private

def registry_resources
  registry = {
    path: new_resource.path,
    user: new_resource.user,
    group: new_resource.group,
    version: new_resource.version,
    install_type: new_resource.install_type
  }
  registry
end
