#!/bin/sh

# Replace the placeholder in the index.html with the actual API_URL value
#envsubst '${API_URL}' < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index.html.tmp && \
#mv /usr/share/nginx/html/index.html.tmp /usr/share/nginx/html/index.html

# Replace the placeholder in the index.html with the actual API_URL value
sed -i 's|__API_URL__|'${API_URL}'|g' /usr/share/nginx/html/index.html

# Start Nginx
nginx -g 'daemon off;'
