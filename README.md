docker_registry Cookbook
========================

This is a cookbook written to help you install and run a docker registry of
your very own.

It only supports the newest version of the registry ( `> 2` ) and will also
run an nginx proxy if you want SSL or authentication.

You can choose to back the filestore locally, or via s3 or swift.   When backing the filestore with s3 or swift I highly recommend running the registry on `localhost` with no SSL or authentication on every server that wants to access the registry. see http://bridgetkromhout.com/speaking/2015/oscon/ and http://0x74696d.com/posts/host-local-docker-registry/.

Requirements
------------

The only hard requirement is the `docker` cookbook which is listed in
`metadata.rb`.

If you want the cookbook to also run an `nginx` proxy for you, you will
need to add the appropriate cookbooks in the `recommends` section of 
`metadata.rb` to your run list.  see `.kitchen.yml` for an example of this.

Attributes
----------

Attributes are self documented in `attributes/*`

Usage
-----

#### docker_registry::default

calls `docker_registry::install`

#### docker_registry::registry

Installs and runs docker registry

#### docker_registry::nginx

Installs and runs nginx proxy for registry

Allows you to secure the registry with SSL.

see `.kitchen.yml` for runlist and attributes to create an SSL (self-signed)
protected registry.

To interact with the registry inside the TK instance you'll need to set
`127.0.0.1 registry.local` in hosts files.


Testing
-------

If you have ChefDK

```
$ chef exec bundle install --without=ruby
$ chef exec berks install
$ chef exec rake
```

If you do not have ChefDK

```
$ bundle install
$ berks install
$ chef exec rake
```



Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Paul Czarkowski

Copyright 2014,2015 Paul Czarkowski

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
