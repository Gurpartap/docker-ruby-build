## ruby-build for Docker

Use [**any**](https://github.com/sstephenson/ruby-build/tree/master/share/ruby-build)[1] ruby for your Docker container.

###### Docker repository

Available as base build for your Dockerfile as `gurpartap/ruby-build[:version_tag]`.

Automated Registry Repo is available at https://registry.hub.docker.com/u/gurpartap/ruby-build/


###### Usage example

```
FROM gurpartap/ruby-build:2.1.2
# FROM gurpartap/ruby-build:1.9.3-p547
# FROM gurpartap/ruby-build:2.2.0-dev

ADD Gemfile Gemfile
RUN bundle install

CMD bundle exec rack
```

[1] Currently only MRI rubies are supported.
