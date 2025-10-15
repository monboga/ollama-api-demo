#!/bin/sh

# 1. Inicia el servidor de Ollama en segundo plano
echo "Iniciando servidor de Ollama..."
ollama serve &

# 2. Captura el ID del proceso del servidor
PID=$!

# 3. Espera unos segundos para asegurar que el servidor esté listo
echo "Esperando que el servidor esté listo..."
sleep 3

# 4. Ejecuta el comando para descargar el modelo
echo "Descargando el modelo llama3.2:1b (si no existe)..."
ollama pull llama3.2:1b

# 5. Mantiene el contenedor en ejecución esperando a que el servidor principal termine
echo "El servidor está en ejecución. El modelo está listo."
wait $PID