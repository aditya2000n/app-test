FROM node:24-alpine


# make the NODE_ENV variable available to the application to ommit dev dependencies installation
ENV NODE_ENV=production

# make the workifg directory and change the ownership to node user
RUN mkdir -p /app && chown -R node:node /app

# make working directory as /app
WORKDIR /app

# copy the package.json and package-lock.json to the working directory
COPY --chown=node:node pakcage*.json ./

# switch to node user
USER node

# install the dependencies
RUN npm ci --omit=dev

# build the application
RUN npm run build

# copy the rest of the application code to the working directory
COPY --chown=node:node . .

# expose the port the application is running on
EXPOSE 3000

# run the application

CMD ["npm", "start"]