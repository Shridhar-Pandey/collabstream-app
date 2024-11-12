# Use the official Node.js image as a base
FROM node:18

# Create and set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json for dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 443
EXPOSE 443

# Start the server
CMD ["node", "server.js"]
