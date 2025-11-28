# ---------- Etapa 1: Build ----------
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app

# Instalar Maven (no incluido en la imagen base)
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Copiar pom.xml y descargar dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiar el código fuente y compilar el JAR
COPY . .
RUN mvn clean package -DskipTests

# ---------- Etapa 2: Runtime ----------
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Copiar el JAR compilado
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
