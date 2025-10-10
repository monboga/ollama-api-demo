# Ollama API Demo

Este proyecto es una demostración de cómo integrar y consumir la API de Ollama utilizando Spring Boot. El objetivo es proporcionar una base para desarrollar aplicaciones que interactúen con modelos de lenguaje de Ollama de manera sencilla y escalable.

## Estructura del Proyecto

- `Dockerfile`: Define la imagen personalizada para la aplicación Spring Boot.
- `docker-compose.yml`: Orquesta los servicios necesarios, incluyendo la aplicación y Ollama.
- `src/`: Código fuente de la aplicación Spring Boot.
- `README.md`: Documentación del proyecto.

## Descripción

La aplicación expone endpoints REST que permiten enviar solicitudes a la API de Ollama, procesar respuestas y facilitar la integración con otros sistemas. El uso de Docker y Docker Compose simplifica la configuración y despliegue, asegurando que todos los servicios necesarios estén disponibles y correctamente conectados.

## Requisitos Previos

- Docker instalado en tu sistema.
- Docker Compose instalado.

## Pasos para Uso

1. **Clona el repositorio**
    ```bash
    git clone https://github.com/tu-usuario/ollama-api-demo.git
    cd ollama-api-demo
    ```

2. **Construye la imagen de la aplicación**
    ```bash
    docker build -t ollama-api-demo .
    ```

3. **Inicia los servicios con Docker Compose**
    ```bash
    docker-compose up
    ```

    Esto levantará tanto la aplicación Spring Boot como el servicio de Ollama.

4. **Accede a la aplicación**
    - La API estará disponible en `http://localhost:8080`.
    - Consulta la documentación de los endpoints en el código fuente o mediante herramientas como Swagger si está habilitado.

5. **Detén los servicios**
    ```bash
    docker-compose down
    ```

## Personalización

- Modifica el `docker-compose.yml` para ajustar puertos o variables de entorno según tus necesidades.
- Actualiza el `Dockerfile` si requieres dependencias adicionales.

## Soporte

Para dudas o problemas, abre un issue en el repositorio.
