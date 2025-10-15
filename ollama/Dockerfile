# 1. Usamos la imagen oficial de Ollama como base
FROM ollama/ollama

# 2. Copiamos nuestro script de inicio al interior de la imagen
COPY entrypoint.sh /entrypoint.sh

# 3. Le damos permisos de ejecución al script
RUN chmod +x /entrypoint.sh

# 4. Le decimos a Docker que ejecute nuestro script cuando el contenedor se inicie
ENTRYPOINT ["/entrypoint.sh"]