#!/bin/bash

if [ -z $1 ]; then
  echo Please specify a version number! ... cancelling
  exit 1
fi

v=${1}

echo "Updating nodejs version to ${v}"

echo "Updating Dockerfile..."
cat Dockerfile.template | sed s/VERSION/${v}/ > Dockerfile

echo "Creating tag..."
git tag -f "${v}"

echo "Removing remote tag (if it existed)..."
git push origin ":refs/tags/${v}"

echo "Push tags..."
git push --tags

echo "Pushed new docker version. Please update docker hub references!"
