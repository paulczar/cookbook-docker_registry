# Encoding: utf-8
# used by ChefSpec for LWRPs

if defined?(ChefSpec)
  def create_docker_registry_config(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_config, :create, name)
  end

  def remove_docker_registry_config(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_config, :remove, name)
  end

  def create_docker_registry_instance(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_instance, :create, name)
  end

  def remove_docker_registry_instance(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_instance, :remove, name)
  end

  def enable_docker_registry_service(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_service, :enable, name)
  end

  def disable_docker_registry_service(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_service, :disable, name)
  end

  def start_docker_registry_service(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_service, :start, name)
  end

  def stop_docker_registry_service(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_service, :stop, name)
  end

  def restart_docker_registry_service(name)
    ChefSpec::Matchers::ResourceMatcher.new(:docker_registry_service, :restart, name)
  end

end
