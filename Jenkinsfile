pipeline {
  agent any
  stages {
    stage('Check env') {
      steps {
        tool 'maven'
      }
    }

    stage('Build') {
      steps {
        sh 'mvn package -B'
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