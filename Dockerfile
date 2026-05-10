FROM nginx:stable-alpine

# Copy static assets to Nginx default public directory
COPY ./app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Healthcheck to ensure container is healthy
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
