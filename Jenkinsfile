pipeline {
  agent any
  stages {
    stage('Clean Workspace') {
      steps {
        sh '''echo "---------------Cleaninig $WORKSPACE BEGIN -----------------------------"
deleteDir() /* clean up our workspace */'''
      }
    }

    stage('Clone') {
      steps {
        sh '''echo "------------------------------Cloning Github Repo------------------------------------ "

checkout(scm: [$class: \'GitSCM\', userRemoteConfigs: [[url: "${pipelineParams.scmclone}", name: "origin"]], branches: [[name: "${VersionBranch}"]]])'''
      }
    }

    stage('Build') {
      steps {
        sh '''echo "---------------------------------Compiling--------------------------------------------"
withEnv(["JAVA_HOME=${ tool \'java11\' }", "PATH+MAVEN=${tool \'maven\'}/bin:${env.JAVA_HOME}/bin"]) {
                
sh "mvn clean install -f pom.xml -Djavax.net.ssl.trustStore=/etc/ssl/keystore.jks -Djavax.net.ssl.trustStorePassword=changeit"
                
}                '''
      }
    }

    stage('Tests') {
      steps {
        sh ''' echo "------------------------------Runninig Tests-----------------------------"
            
parallel: {
    stage(\'Unity test\') {
  	withEnv(["JAVA_HOME=${ tool \'java11\' }", "PATH+MAVEN=${tool \'maven\'}/bin:${env.JAVA_HOME}/bin"]) {
						sh "mvn test -f pom.xml"
					}

				}
				
    stage(\'Sonar Analysis\',) {
	withEnv(["JAVA_HOME=${ tool \'java11\' }", "PATH+MAVEN=${tool \'maven\'}/bin:${env.JAVA_HOME}/bin"]){
						withSonarQubeEnv(\'sonar\') {
							sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -f pom.xml -Djavax.net.ssl.trustStore=/etc/ssl/keystore.jks -Djavax.net.ssl.trustStorePassword=changeit"
							
						}
					}
				}
			}'''
      }
    }

    stage('POM Vars') {
      steps {
        sh '''echo "-----------------------Read Variables from pom---------------------------"
            //variables desde pom padre
            IMAGE = readMavenPom(file: "pom.xml").getArtifactId()
            GROUP = readMavenPom(file: "pom.xml").getGroupId()
            PACKAGE = readMavenPom(file: "pom.xml").getPackaging()
            BUILD = readMavenPom(file: "pom.xml").getBuild()
            NAME = readMavenPom(file: "pom.xml").getName()
            VERSION = readMavenPom(file: "pom.xml").getVersion()
            
            nexusRepo = "${pipelineParams.nexusRepo}"

            echo "$IMAGE"
            echo "$GROUP"
            echo "$PACKAGE"
            echo "$BUILD"
            echo "$NAME"
            echo "$VERSION"'''
      }
    }

  }
}