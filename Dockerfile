FROM nginx:alpine

# Installa curl e unzip
RUN apk add --no-cache curl unzip

# Scarica ed estrae l'ultima release di Snap!
RUN curl -s https://api.github.com/repos/jmoenig/Snap/releases/latest \
    | grep browser_download_url \
    | grep '.zip' \
    | cut -d '"' -f 4 \
    | xargs curl -L -o /tmp/snap.zip && \
    unzip /tmp/snap.zip -d /usr/share/nginx/html && \
    rm /tmp/snap.zip

# Espone la porta 80
EXPOSE 80

# Comando di default
CMD ["nginx", "-g", "daemon off;"]
