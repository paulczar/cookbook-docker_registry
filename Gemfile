source 'https://rubygems.org'

gem 'berkshelf', '> 3'

# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.5.2"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end

group :ruby do
  gem 'chef', '>= 11.8'
  gem 'rake', '>= 10.2'
  gem 'rubocop', '>= 0.23'
  gem 'foodcritic', '>= 4'
  gem 'chefspec', '>= 3.4'
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'guard', '>= 2.6'
end

group :chefdk do
  gem 'serverspec'
  gem 'guard-rubocop'
  gem 'vagrant-wrapper'
end
