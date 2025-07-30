FROM gradle:jdk17 as builder
COPY . .
RUN gradle build -x test --no-daemon

FROM openjdk:17-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=build/libs/cart-1.0.0.jar
COPY --from=builder ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
