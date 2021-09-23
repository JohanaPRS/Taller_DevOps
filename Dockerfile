FROM openjdk:8-alpine
ADD target/java-jenkins-docker.jar java-jenkins-docker.jar
ENTRYPOINT ["java", "-jar", "spring-boot-docker-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
