FROM node:alpine

WORKDIR /app

COPY . .

USER daemon

RUN chmod -R 777 /app

RUN npm install && build

EXPOSE 3000

CMD ["npm", "start"]
