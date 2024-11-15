# Use Node.js official image as the base image for the build stage
FROM node:18-alpine AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and lock file
COPY package.json package-lock.json ./

# Install dependencies and cache them
RUN npm install --frozen-lockfile

# Copy application code
COPY . .

# Build the React application
RUN npm run build

# Use a lightweight nginx image for the production stage
FROM nginx:alpine AS runner

# Copy the build files from the builder stage to the nginx html directory
COPY --from=builder /app/build /usr/share/nginx/html

# Expose the port nginx will serve on
EXPOSE 80

# Start nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
