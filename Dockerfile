# Use official Node.js runtime as base image
FROM node:18-alpine AS base

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Test stage - includes dev dependencies for testing
FROM base AS test
RUN npm ci
COPY src/ ./src/
COPY tests/ ./tests/
COPY jest.config.js ./
CMD ["npm", "run", "test"]

# Production stage - only production dependencies
FROM base AS production
RUN npm ci 
COPY src/ ./src/
EXPOSE 3000
CMD ["npx", "pm2-runtime", "start", "src/index.js", "--name", "repositorioaws"]
