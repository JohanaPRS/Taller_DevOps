pipeline {
  agent any
   
  stages {
    stage('Build') {
       steps {
        sh 'mvn clean package'
        sh '''java -jar spring-boot-docker-0.0.1-SNAPSHOT.jar
'''     }
    }
  }

    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }

    stage('Build Docker image') {
      steps {
        sh 'docker build -t my_docker_hub_username/my_image_name:my_image_version .'
        sh 'docker run -p 8091:8091 --env SPRING_PROFILES_ACTIVE=docker my_docker_hub_username/my_image_name:my_image_version'
      }
    }

  }
}
