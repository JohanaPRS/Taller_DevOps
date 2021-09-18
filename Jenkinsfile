pipeline {
  agent any
  stages {
    stage('Build Docker Image') {
      steps {
        sh 'mvnw spring-boot:run'
      }
    }

  }
}