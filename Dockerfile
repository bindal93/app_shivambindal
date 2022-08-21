FROM node:current-alpine3.16
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 7100
CMD [ "npm", "start" ]
