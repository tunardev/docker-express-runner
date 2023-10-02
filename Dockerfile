# Use a smaller Node.js image as the runtime environment
FROM node:14-alpine

# Copy application files to the /usr/src/app directory
WORKDIR /usr/src/app
COPY . .

# Install necessary dependencies
RUN npm install

# Set the port number as an environment variable
ENV PORT=3000

# Compile TypeScript code
RUN npm run build

# Add a health check (e.g., Express.js health route)
HEALTHCHECK --interval=5s --timeout=5s --retries=3 CMD wget --quiet --tries=1 --spider http://localhost:${PORT}/health || exit 1

# Command to run the application
CMD ["npm", "start"]

# Specify on which port the application will run
EXPOSE 3000
