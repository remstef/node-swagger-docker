##
# NodeJS with Swagger executables
##
FROM node:9.2

RUN npm install -g swagger

EXPOSE 3001
EXPOSE 10010

CMD [ "swagger", "project", "start" ]
