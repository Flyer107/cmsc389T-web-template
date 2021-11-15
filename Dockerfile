#Use the node:10-alpine image as a base to
FROM node:10-alpine
#create a directory for the app and its node_modules with node as its owner
# RUN useradd -ms /bin/bash node

RUN mkdir -p /home/node/app/ && chown -R node:node /home/node/app

WORKDIR /home/node/app
#expose port 8080 and run the app
EXPOSE 8080

#install all packages in package.json
# COPY package.json ./
COPY * ./

USER node

RUN npm install

COPY --chown=node:node . .

CMD [ "node", "app.js"]


#the docker lecture will help you complete this file 
#there should be a total of 9 lines
