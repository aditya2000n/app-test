# Stage 1: Build the application

FROM node:24-alpine as builder

# make the NODE_ENV variable available to the application to ommit dev dependencies installation
ENV NODE_ENV=production

# make the workifg directory and change the ownership to node user
RUN mkdir -p /app && chown -R node:node /app

# make working directory as /app
WORKDIR /app

# copy the package.json and package-lock.json to the working directory
COPY --chown=node:node package*.json ./

RUN ls -la

# install the dependencies
RUN npm ci --omit=dev

# copy the rest of the application code to the working directory
COPY --chown=node:node . .

# build the application
RUN npm run build

# Stage 2: Host the application

FROM nginxinc/nginx-unprivileged:alpine3.23-perl

# Get the static files from the builder stage and copy them to the nginx html directory
COPY --from=builder /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

# expose the port the application is running on
EXPOSE 80

# run the application
CMD ["nginx", "-g", "daemon off;"]