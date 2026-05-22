FROM node:alpine

WORKDIR /app

# # Copy package files first for better layer caching
# COPY package*.json ./
# Copy application source
COPY . .

# Install dependencies as root
RUN npm install

# Build the application
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]