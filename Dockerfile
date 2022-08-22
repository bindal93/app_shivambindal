FROM lts-alpine3.15
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 7100
CMD [ "npm", "start" ]
