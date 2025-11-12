# Use Node.js 18 Alpine as the base image
FROM node:18-alpine

# Enable corepack for Yarn
RUN corepack enable

# Set the working directory
WORKDIR /app

# Copy package files
COPY package.json yarn.lock* ./

# Install Yarn
RUN yarn set version stable

# Install dependencies
RUN yarn install --immutable

# Copy the rest of the application
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Set environment variables
ENV NODE_ENV=development

# Start the application
CMD ["yarn", "start"]