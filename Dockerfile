FROM node:alpine

# 1. Explicitly create the /app directory and give the 'node' user ownership
RUN mkdir -p /app && chown -R node:node /app

# 2. Set the working directory
WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

RUN chown -R demon:demon /app

USER demon

EXPOSE 3000

CMD ["npm", "start"]