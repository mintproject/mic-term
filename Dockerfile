FROM node:14-bullseye
RUN apt-get update && apt-get install -y \ 
    python3 \
    build-essential 
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
RUN npm install
COPY --chown=node:node . .
USER node
EXPOSE 8080
CMD [ "npm", "start" ]
