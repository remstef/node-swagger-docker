#!/bin/bash

if [ -z $1 ]
then
  echo Please specify a node version number... cancelling
  exit 1
fi

v=${1}

if ( git tag --list | grep ^${v}$; )
then
  echo "Tag already exists. Do you want to overwrite it?"
  read -p "[Y/N]: " decision
  if ! [[ ${decision} = "Y" || ${decision} = "y" ]]
  then
    echo "... cancelled"
    exit 1
  fi
  echo "Removing local tag..."
  git tag -d "${v}"
  echo "Removing remote tag..."
  git push origin ":refs/tags/${v}"
fi

echo "Updating nodejs version to ${v}"

echo "Updating Dockerfile..."
cat Dockerfile.template | sed s/VERSION/${v}/ > Dockerfile

echo "Commit Dockerfile..."
git commit Dockerfile -m "Update Dockerfile to version ${v}"

echo "Creating tag..."
git tag -f "${v}"

echo "Pushing..."
git push && git push --tags

echo "Pushed new docker version. Please check automated builds in docker hub manually!"
