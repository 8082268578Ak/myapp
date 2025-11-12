
# Use a lightweight Nginx base image
FROM nginx:alpine

# Copy all files from your repository to Nginx's default HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80
