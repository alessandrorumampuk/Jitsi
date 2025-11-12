# Use Node.js 22 with Debian as the base image
FROM node:22-bookworm

# Set the working directory
WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    make \
    g++ \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Set environment variables
ENV NODE_ENV=development

# Start the application
CMD ["npm", "start"]