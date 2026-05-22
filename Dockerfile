FROM node:alpine

WORKDIR /app

COPY . .

USER appuser

RUN npm install

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]