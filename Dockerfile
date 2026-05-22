FROM node:alpine

WORKDIR /app

COPY . .

USER daemon

RUN npm install && build

RUN chown -R daemon:daemon /app

RUN chmod -R 777 /app


EXPOSE 3000

CMD ["npm", "start"]
