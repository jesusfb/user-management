FROM maven:3.9 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -Dmaven.test.skip=true

FROM amazoncorretto:17-alpine
MAINTAINER LeninQuintero
COPY --from=builder /app/target/spring-boot-starter-parent-2.0.4.RELEASE.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/app.jar"]
