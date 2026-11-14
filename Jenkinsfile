pipeline {
    agent any
    tools {
        maven 'Maven'
        jdk 'Java'
    }
    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'PetClinic Lab13 - JOE ANDERSON'
                sh 'java -version && mvn -version'
            }
        }
        stage('Build') {
            steps { sh 'mvn -B -ntp clean compile' }
        }
        stage('Test') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'mysql-petclinic',
                    usernameVariable: 'DB_USERNAME', passwordVariable: 'DB_PASSWORD')]) {
                    sh 'mvn -B -ntp test -Dspring.profiles.active=mysql'
                }
            }
            post {
                always { junit testResults: 'target/surefire-reports/TEST-*.xml' }
            }
        }
        stage('Package') {
            steps {
                sh 'mvn -B -ntp package -DskipTests'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
}
