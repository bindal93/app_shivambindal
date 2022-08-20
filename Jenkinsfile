pipeline {
  agent any
  environment {
    scannerHome = tool 'SonarQubeScanner';
    username='admin';
    appName='app_shivambindal'
  }
  tools {
    nodejs 'nodejs'
  }
  stages {
    stage('Build') {
      steps {
        bat 'npm i'
      }
    }
    stage('Test case execution') {
      when {
        branch 'master'
      }
      steps {
        bat 'npm test'
      }
    }
    stage('Sonarqube Analysis') {
      when {
        branch 'develop'
      }
      steps {
        echo "Starting sonarqube analysis"
        withSonarQubeEnv('Test_Sonar') {
          bat '${scannerHome}/bin/sonar-scanner -D"sonar.projectKey=sonar-shivambindal" -D"sonar.sources=." -D"sonar.host.url=http://localhost:9000" -D"sonar.login=sqp_d9a47c845a5d64d77238d9b42c84dee2885246b7"'
        }
      }
    }
  }
}
