## ruby-build for Docker

Install any* ruby.

###### Docker repository

Available as base build for your Dockerfile as `gurpartap/ruby-build[:version_tag]`.

Automated Registry Repo is available at https://registry.hub.docker.com/u/gurpartap/ruby-build/


###### Usage example

```
FROM gurpartap/ruby-build:ruby-2.1.2

WORKDIR /app
ADD ./Gemfile Gemfile
RUN bundle install

CMD bundle exec rack
```
