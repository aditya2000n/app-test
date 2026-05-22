FROM node:alpine

WORKDIR /app

COPY . .

RUN chown -R demon:demon /app

# Install dependencies as root
RUN npm install

# Build the application
RUN npm run build

USER demon

EXPOSE 3000

CMD ["npm", "start"]