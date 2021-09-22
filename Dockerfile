FROM openjdk:8-alpine
ADD target/spring-boot-docker-0.0.1-SNAPSHOT.jar spring-boot-docker-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "spring-boot-docker-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
