FROM node:alpine

RUN mkdir -p /app && chown -R node:node /app

WORKDIR /app

USER node

COPY . .


RUN npm install

RUN npm run build


EXPOSE 3000

CMD ["npm", "start"]