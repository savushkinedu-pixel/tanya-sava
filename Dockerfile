FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
CMD sh -c "echo 'server{listen '${PORT:-80}';location/{root /usr/share/nginx/html;try_files \$uri \$uri/ /index.html;}}' > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
