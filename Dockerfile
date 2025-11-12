# Use Node.js 18 Alpine as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Create packages directory and copy if it exists
RUN mkdir -p packages
COPY --from=0 /app/package*.json ./
RUN if [ -d "packages" ]; then cp -r packages/ ./ || true; fi

# Install dependencies with workspaces support
RUN npm install -g npm@latest && \
    if [ -d "packages" ] && [ "$(ls -A packages 2>/dev/null)" ]; then \
      npm install --legacy-peer-deps --workspaces; \
    else \
      npm install --legacy-peer-deps; \
    fi

# Copy the rest of the application
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Set environment variables
ENV NODE_ENV=development

# Start the application
CMD ["sh", "-c", "npm install -g npm@11.6.2 && npm start"]