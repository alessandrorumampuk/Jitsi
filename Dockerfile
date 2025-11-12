# Use Node.js 18 Alpine as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 8080

# Start the application
CMD ["npm", "start"]