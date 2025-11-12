# Use Node.js 18 Alpine as the base image
FROM node:18-alpine

# Install Yarn
RUN corepack enable && corepack prepare yarn@stable --activate

# Set the working directory
WORKDIR /app

# Copy package files
COPY package*.json ./
COPY yarn.lock* ./

# Install dependencies using Yarn
RUN yarn install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Set environment variables
ENV NODE_ENV=development

# Start the application
CMD ["yarn", "start"]