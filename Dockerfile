FROM node:alpine

WORKDIR /app

COPY . .

USER appuser

RUN chown -R appuser:appuser /app

RUN chmod -R 755 /app

RUN npm install

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]