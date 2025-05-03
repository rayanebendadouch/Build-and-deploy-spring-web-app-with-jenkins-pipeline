pipeline {
    agent any
tools{
    jdk 'jdk17'
    maven 'M398'
}

environment{
    SONNAR_VAR= tool "sonar-scanner"
}
    stages {
        stage('scm checkout') {
            steps {
              git changelog: false, poll: false, url: 'https://github.com/rayanebendadouch/Build-deploy-spring-web-app-with-jenkins-pipeline.git'
            }
        }
         stage('compile') {
            steps {
                bat "mvn clean compile"
            }
        }
         stage('sonar-analysis') {
            steps {
                 withSonarQubeEnv('sonar') {
                     withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                        bat """
                        "%SONNAR_VAR%\\bin\\sonar-scanner.bat" ^
                        -Dsonar.login=${SONAR_TOKEN} ^
                        -Dsonar.projectName=my-random-app ^
                        -Dsonar.java.binaries=. ^
                        -Dsonar.projectKey=my-random-app ^
                        -Dsonar.organization=rayanebendadouch
                    """

                     }

                }
            }
        }
           stage('build') {
            steps {
            bat "mvn clean install"
            }
        }
         stage('docker build and push') {

            steps {
                script{
                      withDockerRegistry(credentialsId: '2a1ed270-1863-495b-a8d9-d23e5e26f8d9') {
    bat "docker build -t random-app ."
            bat "docker tag random-app rayanebendaouch/random-app:latest"
            bat "docker push rayanebendaouch/random-app:latest"
}
                }


            }
        }
         stage('run container') {

            steps{
                bat "docker run -d -p 8080:8082 rayanebendaouch/random-app:latest"
            }
        }
    }
}
