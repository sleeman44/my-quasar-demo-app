# Dockerfile

# Dockerfile

# Step 1: Use a Node.js image to build the Quasar app using Quasar CLI
FROM node:18-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install the project dependencies
RUN npm install
RUN npm install -g @vue/cli
# Install Quasar CLI globally
RUN npm install -g @quasar/cli

# Copy the rest of the application source code to the container
COPY . .

# Build the Quasar app for production using Quasar CLI
RUN quasar build

# Step 2: Use Nginx to serve the built Quasar app
FROM nginx:alpine

# Copy the built files from the build stage to Nginx's default HTML directory
COPY --from=build /app/dist/spa /usr/share/nginx/html

# Add entrypoint script for injecting environment variables
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 80
EXPOSE 80

# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]

#Start (if not using entrypoint.sh)
#CMD ["nginx", "-g", "daemon off;"]
