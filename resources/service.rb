# Encoding: utf-8
# Cookbook Name:: docker_registry
# Resource:: service
# Copyright 2014, Paul Czarkowski
# License:: Apache 2.0

actions :create, :remove, :restart

default_action :create if defined?(default_action)

attribute :name, kind_of: String, name_attribute: true, default: node[:docker_registry][:name]
attribute :path, kind_of: String, default: node[:docker_registry][:path]
attribute :user, kind_of: String, default: node[:docker_registry][:user]
attribute :group, kind_of: String, default: node[:docker_registry][:group]
attribute :templates_cookbook, kind_of: String, default: node[:docker_registry][:templates_cookbook]
