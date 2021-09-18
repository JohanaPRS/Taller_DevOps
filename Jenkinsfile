pipeline {
  agent {
    node {
      label 'Dockerfile'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t my_docker_hub_username/my_image_name:my_image_version .'
        sh 'java -jar target/spring-boot-docker-0.0.1-SNAPSHOT.jar'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn test'
        echo 'Tests OK'
      }
    }

  }
  environment {
    Env = 'true'
  }
}