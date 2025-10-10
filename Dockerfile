# Usa una imagen base de OpenJDK con Maven para construir la aplicación
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copia el pom.xml y descarga las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copia el resto del código fuente y construye el JAR
COPY . .
RUN mvn clean package -DskipTests

# Usa una imagen ligera de Java para ejecutar el JAR
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copia el JAR generado desde la etapa de build
COPY --from=build /app/target/*.jar app.jar

# Expone el puerto típico de Spring Boot
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]