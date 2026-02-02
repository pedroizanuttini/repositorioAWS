# Use official Node.js runtime as base image
FROM node:18-alpine

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (including PM2)
RUN npm ci --only=production

# Copy application source code
COPY src/ ./src/

# Expose port 3000
EXPOSE 3000

# Command to run the application with PM2
CMD ["npx", "pm2-runtime", "start", "src/index.js", "--name", "repositorioaws"]
