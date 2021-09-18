pipeline {
  agent {dockerfile true}
  stages {
    stage('Build') {
      steps {
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
}
