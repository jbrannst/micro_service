#node.js good practices: 
# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md

FROM node:latest


# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# replace this with your application's default port
ENV PORT 8080
ENV NODEJS_IP 0.0.0.0

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install
RUN npm install mocha -g

# Bundle app source
COPY . /usr/src/app

CMD [ "node", "application.js" ]

EXPOSE 8080
