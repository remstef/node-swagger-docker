# node-swagger-docker

This docker extends node js docker images and adds swagger and some convenience commands to the image.


#### update a new tagged version in git repository
```
./updateNewVersion.sh 14.14.0
```

This additionally invokes automatic builds in Docker Hub and creates a new image with the respective tag and node version.
