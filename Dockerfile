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
ENV LANG=en_US.utf8

# Cambiar la contraseña del usuario root
RUN echo 'root:${ROOT_PASSWORD}' | chpasswd

# Copy script to install al required programs
COPY ./scripts/install-apps.sh /tmp/script.sh

# Dar permisos de ejecución al script
RUN chmod +x /tmp/script.sh

# Instalar otros paquetes necesarios (por ejemplo, curl, nano, etc.)
RUN /tmp/script.sh
# Establecer el directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios al contenedor (por ejemplo, archivos fuente)
# COPY . /app

# Exponer un puerto (si es necesario, por ejemplo, para una aplicación web)
# EXPOSE 8080

# Mantener el contenedor activo ejecutando un comando que no termina
CMD ["tail", "-f", "/dev/null"]