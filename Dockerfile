FROM node:alpine

WORKDIR /app

COPY . .

USER daemon

RUN npm install && build

EXPOSE 3000

CMD ["npm", "start"]
