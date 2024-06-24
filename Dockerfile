# Usar una imagen base de Debian
FROM debian:12.5-slim

# Argumentos
ARG ROOT_PASSWORD

# Actualizar los repositorios de paquetes e instalar locales
RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/*

# Configurar locale en_US.UTF-8
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Establecer la variable de entorno LANG
ENV LANG en_US.utf8

# Cambiar la contraseña del usuario root
RUN echo 'root:${nueva_contraseña}' | chpasswd

# Instalar otros paquetes necesarios (por ejemplo, curl, nano, etc.)
RUN apt-get update && \
    apt-get install -y \
    curl \
    nano \
    git && \
    rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios al contenedor (por ejemplo, archivos fuente)
# COPY . /app

# Exponer un puerto (si es necesario, por ejemplo, para una aplicación web)
# EXPOSE 8080

# Comando para ejecutar tu aplicación (cambiar según tus necesidades)
CMD ["./start.sh"]

