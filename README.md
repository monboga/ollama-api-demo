# Ollama API Demo con Spring Boot

Este proyecto es una demostración de cómo integrar y consumir un modelo de lenguaje de **Ollama** utilizando una API REST construida con **Spring Boot**. El entorno está completamente orquestado con **Docker Compose**, incluyendo un script de inicio que descarga y configura automáticamente el modelo de lenguaje, dejando el servicio listo para ser consumido al instante.

## ✨ Características

* **API REST para interactuar con Ollama:** Expone un endpoint sencillo para enviar prompts y recibir respuestas del modelo de lenguaje.
* **Entorno 100% Dockerizado:** La aplicación, el servidor de Ollama y sus dependencias se gestionan a través de Docker, garantizando un despliegue consistente y aislado.
* **Modelo de IA Pre-cargado:** El modelo de lenguaje (ej. `llama3.2:1b`) se descarga automáticamente la primera vez que se inician los servicios, gracias a un script de inicio personalizado.
* **Comunicación Optimizada:** Los contenedores se comunican a través de una red Docker dedicada para mayor seguridad y fiabilidad.

## 📁 Estructura del Proyecto

El proyecto está organizado para separar la configuración de cada servicio:

```
.
├── ollama/
│   ├── Dockerfile      # Define la imagen personalizada de Ollama
│   └── entrypoint.sh   # Script que descarga el modelo al iniciar el contenedor
├── src/                # Código fuente de la aplicación Spring Boot
├── Dockerfile          # Define la imagen de la aplicación Spring Boot
├── docker-compose.yml  # Orquesta todos los servicios (app y ollama)
└── README.md           # Esta documentación
```

## 📋 Requisitos Previos

* **Docker** instalado en tu sistema.
* **Docker Compose** instalado (generalmente viene con Docker Desktop).

## 🚀 Configuración y Ejecución

Sigue estos pasos para levantar todo el entorno.

### 1. Clona el Repositorio
```bash
git clone git@github.com:monboga/ollama-api-demo.git
cd ollama-api-demo
```

### 2. Construye las Imágenes de Docker
Este comando leerá los `Dockerfile` y el `docker-compose.yml` para construir las imágenes personalizadas de tu aplicación y de Ollama.

**Nota:** La primera vez que ejecutes este comando, puede tardar varios minutos, ya que descargará el modelo de lenguaje definido en `ollama/entrypoint.sh`.

```bash
docker-compose build
```

### 3. Inicia los Servicios
Este comando iniciará los contenedores de la API de Spring Boot y de Ollama en segundo plano.
```bash
docker-compose up -d
```
El backend estará listo para recibir peticiones una vez que los contenedores se hayan iniciado.

### 4. Verifica que Todo Funcione (Opcional pero Recomendado)

* **Verifica que el modelo de Ollama esté disponible:**
    ```bash
    docker exec -it ollama ollama list
    ```
    Deberías ver el modelo (ej. `llama3.2:1b`) en la lista.

* **Prueba la API directamente:**
    Puedes usar `curl` en tu terminal o simplemente pegar la URL en un navegador.
    ```bash
    curl "http://localhost:8080/api/v1/generate?promptMessage=Hola, preséntate en una frase."
    ```
    Deberías recibir una respuesta en texto generada por el modelo de IA.

### 5. Detén los Servicios
Cuando termines de usar la aplicación, puedes detener y eliminar los contenedores con:
```bash
docker-compose down
```

## 🔧 Personalización

### Cambiar el Modelo de IA

Para usar un modelo de Ollama diferente, debes actualizar su nombre en **dos** lugares:

1.  **Script de descarga:** En el archivo `ollama/entrypoint.sh`, modifica la línea `ollama pull nombre-del-modelo`.
2.  **Código de Spring Boot:** En el archivo `src/main/java/edu/labvr/ollama_api_demo/service/LlamaAIService.java`, modifica la línea `options.setModel("nombre-del-modelo");`.

Después de hacer estos cambios, recuerda reconstruir las imágenes con `docker-compose build`.

## 📡 Endpoint de la API

* **URL:** `http://localhost:8080/api/v1/generate`
* **Método:** `GET`
* **Parámetro:** `promptMessage` (string)
* **Ejemplo de uso:**
    ```
    http://localhost:8080/api/v1/generate?promptMessage=Explica qué es una red neuronal en 20 palabras.
    ```