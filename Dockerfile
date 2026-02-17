# Use official Node.js runtime as base image
FROM node:18-alpine

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install all dependencies
RUN npm ci

# Copy application source code
COPY jest.config.js ./
COPY tests/ ./tests/
COPY src/ ./src/

# Expose port 3000
EXPOSE 3000

# Command to run the application with PM2
CMD ["npx", "pm2-runtime", "start", "src/index.js", "--name", "repositorioaws"]
