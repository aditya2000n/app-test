FROM node:alpine

# 1. Explicitly create the /app directory and give the 'node' user ownership
RUN mkdir -p /app && chown -R node:node /app

# 2. Set the working directory
WORKDIR /app

# Copy package files first for better layer caching
COPY package*.json ./

# Install dependencies as root
RUN npm install

# Copy application source
COPY . .

# Build the application
RUN npm run build

# Set proper ownership
RUN chown -R daemon:daemon /app

# Switch to non-root user
USER daemon

EXPOSE 3000

CMD ["npm", "start"]