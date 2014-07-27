# Encoding: utf-8
# Cookbook Name:: docker_registry
# Resource:: instance
# Copyright 2014, Paul Czarkowski
# License:: Apache 2.0

actions :create, :remove

default_action :create if defined?(default_action)

attribute :name, kind_of: String, name_attribute: true, default: node[:docker_registry][:name]
attribute :path, kind_of: String, default: node[:docker_registry][:path]
attribute :install_type, kind_of: String, default: node[:docker_registry][:install_type]
attribute :version, kind_of: String, default: node[:docker_registry][:version]
attribute :user, kind_of: String, default: node[:docker_registry][:user]
attribute :group, kind_of: String, default: node[:docker_registry][:group]
attribute :storage_driver, kind_of: String, default: node[:docker_registry][:storage_driver]
attribute :storage_driver_options, kind_of: Hash
attribute :storage_driver_version, kind_of: String, default: node[:docker_registry][:storage_driver_version]
attribute :docker_image, kind_of: String
