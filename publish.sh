#!/bin/bash

VERSION=$(node --eval "console.log(require('./package.json').version);")

# publish master branch
gulp build
git commit -am "v$VERSION"
git tag v$VERSION -f
git push --tags -f
git push

# update pages
git checkout gh-pages
git merge master
git push
git checkout master