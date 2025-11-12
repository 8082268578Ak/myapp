
# Dockerfile for a simple static site
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
