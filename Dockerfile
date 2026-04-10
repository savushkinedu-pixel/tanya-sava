FROM nginx:alpine

# Remove default config; write a template that reads $PORT at runtime.
# The official nginx image processes /etc/nginx/templates/*.template via
# envsubst on startup — Railway injects PORT automatically.
RUN rm /etc/nginx/conf.d/default.conf \
 && printf 'server {\n\
    listen ${PORT};\n\
    server_name _;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / {\n\
        try_files $uri $uri/ /index.html;\n\
    }\n\
}\n' > /etc/nginx/templates/default.conf.template

COPY . /usr/share/nginx/html

EXPOSE 8080
