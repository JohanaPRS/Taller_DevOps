FROM openjdk:8-alpine
ADD target/spring-boot-docker-0.0.1-SNAPSHOT.jar /usr/share/spring-boot-docker-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/spring-boot-docker-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
