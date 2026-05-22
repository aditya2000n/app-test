FROM node:alpine

# 1. Explicitly create the /app directory and give the 'node' user ownership
RUN mkdir -p /app && chown -R node:node /app

# 2. Set the working directory
WORKDIR /app

# 3. Switch to the built-in non-root 'node' user
USER node

# 4. Copy your files and assign them to the 'node' user
COPY --chown=node:node . .

# 5. Install dependencies and build
RUN npm install && npm run build

EXPOSE 3000

CMD ["npm", "start"]