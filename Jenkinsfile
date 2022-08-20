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
         bat "${scannerHome}/bin/sonar-scanner \ -Dsonar.projectKey=sonar-shivambindal -X"
        }
      }
    }
  }
}
