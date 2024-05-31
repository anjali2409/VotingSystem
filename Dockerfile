# Stage 1: Build ReactJS app
FROM node:14 as builder

WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the application files
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Create Nginx image and copy built files
FROM nginx:1.16.0-alpine

WORKDIR /usr/share/nginx/html

# Remove the default Nginx configuration
RUN rm -rf ./*
RUN rm /etc/nginx/conf.d/default.conf

# Copy the built files from the previous stage
COPY --from=builder /app/build /usr/share/nginx/html

# Copy custom Nginx configuration
COPY /nginx.conf /etc/nginx/conf.d

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]