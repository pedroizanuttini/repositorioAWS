# Use official Node.js runtime as base image
FROM node:18-alpine

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application source code
COPY src/ ./src/

# Expose port (optional, if you add a web server later)
# EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
