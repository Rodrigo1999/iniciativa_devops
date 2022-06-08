FROM node:alpine
WORKDIR /app
COPY ./src/package.json ./
RUN npm install
COPY . .
EXPOSE 80
CMD [ "node", "./src/server.js" ]