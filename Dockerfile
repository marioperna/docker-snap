FROM nginx:alpine

# Installa unzip
RUN apk add --no-cache unzip

# Scarica e scompatta Snap! v10.7.2
RUN curl -L \
    https://github.com/jmoenig/Snap/archive/refs/tags/v10.7.2.zip \
    -o /tmp/snap.zip && \
    unzip /tmp/snap.zip -d /usr/share/nginx/html && \
    rm /tmp/snap.zip

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
