# Nginx als Basisimage verwenden
FROM nginx:alpine

# Arbeitsverzeichnis im Container festlegen
WORKDIR /usr/share/nginx/html

# Kopiere die HTML-Datei in das Nginx-HTML-Verzeichnis
COPY test.html .

# Port 80 freigeben, damit der Webserver erreichbar ist
EXPOSE 80

# Nginx starten
CMD ["nginx", "-g", "daemon off;"]
