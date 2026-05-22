FROM node:alpine

WORKDIR /app

COPY --chown=daemon:daemon . .

USER daemon

RUN npm install && build

EXPOSE 3000

CMD ["npm", "start"]
