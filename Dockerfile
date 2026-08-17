# Use the unprivileged Nginx image for better security
FROM nginxinc/nginx-unprivileged:1.25-alpine

# Copy our custom HTML file into the container
COPY app/index.html /usr/share/nginx/html/index.html

# Expose the default unprivileged port
EXPOSE 8080