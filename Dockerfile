# Base image
FROM node:16.15.1 AS builder


# Create app directory
WORKDIR /usr/src/app

# Copy src folder and package.json and package-lock.json files
COPY package*.json ./
COPY ./src ./src

# Install app dependencies and creates a "dist" folder with the production build
RUN npm ci --quiet && npm run build

# Application port
EXPOSE 3000

# Start the server using the production build
CMD ["node", "dist/main.js"]
