# node-swagger-docker

#### EXAMPLE: change to version 9.4.0 (change version in Dockerfile)
```
# check existing tags
git tag --list
```

```
# edit Dockerfile, commit and create tag locally
git commit . -m 'node 9.4.0'
git tag "9.4.0"
```

```
# change version in Dockerfile to latest and overwrite tag 'latest'
git commit . -m 'node latest'
git tag -f "latest"
git push origin :refs/tags/latest
```

```
# push tags
git tag --list
git push --tags
```

#### EXAMPLE: build the docker image
docker build -t remstef/node-swagger:latest .
