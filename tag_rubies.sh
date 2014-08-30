#!/bin/bash
# Usage: tag_rubies.sh
#
# - push master
# - read available versions from https://github.com/sstephenson/ruby-build/tree/master/share/ruby-build
# - for each version, populate the placeholder in Dockerfile and (re)tag the repo
# - push tags to Github
#

git commit -m "Committing master Dockerfile ($(date '+%Y%m%d'))" Dockerfile
git push origin master

rubies=$(curl --silent https://api.github.com/repos/sstephenson/ruby-build/contents/share/ruby-build | awk '/"name":/ { print $2 }' | tr -d '",')

for ruby_tag in $rubies
do
  sed -i '' -e "s/\${ruby_tag}/${ruby_tag}/g" Dockerfile
  git commit -m "Merging changes on master to ${ruby_tag}" Dockerfile
  git tag -d "${ruby_tag}"
  git tag "${ruby_tag}"
  git checkout -q master
done

git push --tags
