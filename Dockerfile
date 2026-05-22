FROM node:alpine

WORKDIR /app

COPY . .

USER daemon

RUN npm install && npm build

EXPOSE 3000

CMD ["npm", "start"]
