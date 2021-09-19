pipeline {
  agent any
  stages {
    stage('Check env') {
      steps {
        sh 'mvn -v'
        sh 'java -version'
      }
    }

    stage('Build') {
      steps {
        sh 'mvn clean package'
        sh 'java -jar spring-boot-docker-0.0.1-SNAPSHOT.jar'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }

  }
}