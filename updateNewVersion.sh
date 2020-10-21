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

echo "Creating tag..."
git tag -f "${v}"

echo "Pushing tags..."
git push --tags

echo "Pushed new docker version. Please check automated builds in docker hub manually!"
echo "If necessary, manually run:"
echo " "curl -H \"Content-Type: application/json\" --data \"{\'source_type\': \'Tag\', \'source_name\': \'${v}\'}\" -X POST https://registry.hub.docker.com/u/remstef/node-swagger/trigger/e3846c99-664e-473a-a10f-ad8e9bce4aaa/
