##
# NodeJS with Swagger executables
##
FROM node:9.3.0

RUN npm install -g swagger

RUN ( echo "swagger project create" && echo "swagger project edit -s --host 0.0.0.0 --port 3001" && echo "swagger project start" )  >> $HOME/.bash_history

EXPOSE 3001
EXPOSE 10010

CMD [ "swagger", "project", "start" ]
