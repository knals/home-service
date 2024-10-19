# Usa una imagen base de Maven con Eclipse Temurin JDK 17 para construir el proyecto
FROM maven:3.8.8-eclipse-temurin-17 AS build
WORKDIR /app

# Copia el archivo POM y descarga las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copia el código fuente y compila la aplicación
COPY src ./src
RUN mvn clean package -DskipTests

# Usa una imagen base de Eclipse Temurin OpenJDK 21 para ejecutar la aplicación
FROM eclipse-temurin:17
WORKDIR /app

# Copia el paquete JAR desde la fase de construcción anterior
COPY --from=build /app/target/home-service-0.0.1-SNAPSHOT.jar app.jar

# Exponer el puerto de la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]