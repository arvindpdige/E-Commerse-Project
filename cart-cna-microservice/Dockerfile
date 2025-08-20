# Build stage
FROM gradle:8-jdk17-alpine AS builder
WORKDIR /app
COPY . .
RUN ls -la /app
RUN chmod +x gradlew
RUN gradle build -x test 

# Run stage
FROM openjdk:17-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
WORKDIR /app

# Automatically copy the built JAR without hardcoding name
COPY --from=builder /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
