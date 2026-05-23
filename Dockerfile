FROM node:alpine

# 2. Set the working directory
WORKDIR /app

USER node

COPY . .


RUN npm install

RUN npm run build


EXPOSE 3000

CMD ["npm", "start"]