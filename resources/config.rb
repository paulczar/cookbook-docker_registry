# Encoding: utf-8
# Cookbook Name:: docker_registry
# Resource:: config
# Copyright 2014, Paul Czarkowski
# License:: Apache 2.0

actions :create, :remove

default_action :create if defined?(default_action)

attribute :name, kind_of: String, name_attribute: true, default: node[:docker_registry][:name]
attribute :path, kind_of: String, default: node[:docker_registry][:path]
attribute :user, kind_of: String, default: node[:docker_registry][:user]
attribute :group, kind_of: String, default: node[:docker_registry][:group]
attribute :version, kind_of: String, default: node[:docker_registry][:version]
attribute :install_type, kind_of: String, default: node[:docker_registry][:install_type]
attribute :listen_ip, kind_of: String, default: node[:docker_registry][:listen_ip]
attribute :listen_port, kind_of: String, default: node[:docker_registry][:listen_port]
attribute :templates_cookbook, kind_of: String, default: node[:docker_registry][:templates_cookbook]
attribute :storage_driver, kind_of: String, default: node[:docker_registry][:storage_driver]
attribute :storage_driver_options, kind_of: Hash
