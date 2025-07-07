FROM nginx:alpine

# Installa curl, unzip e jq
RUN apk add --no-cache curl unzip jq

# Scarica ed estrae l'ultima release di Snap!
RUN SNAP_URL=$(curl -s https://api.github.com/repos/jmoenig/Snap/releases/latest | jq -r '.assets[] | select(.name | endswith(".zip")) | .browser_download_url') && \
    echo "Scaricando: $SNAP_URL" && \
    curl -L "$SNAP_URL" -o /tmp/snap.zip && \
    unzip /tmp/snap.zip -d /usr/share/nginx/html && \
    rm /tmp/snap.zip

# Espone la porta 80
EXPOSE 80

# Comando di default
CMD ["nginx", "-g", "daemon off;"]
