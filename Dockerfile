FROM nginx:alpine

# Installa unzip
RUN apk add --no-cache unzip

# Scarica e scompatta Snap! v10.7.2
RUN curl -L \
    https://github.com/jmoenig/Snap/archive/refs/tags/v10.7.2.zip \
    -o /tmp/snap.zip && \
    unzip /tmp/snap.zip -d /usr/share/nginx/html && \
    rm /tmp/snap.zip

# sposta il contenuto della cartella Snap-10.7.2 in /usr/share/nginx/html 
RUN mv /usr/share/nginx/html/Snap-10.7.2/* /usr/share/nginx/html/ && \
    rm -rf /usr/share/nginx/html/Snap-10.7.2

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
