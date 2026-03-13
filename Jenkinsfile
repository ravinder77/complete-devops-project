pipeline {
    agent any
    tools {
        nodejs 'Nodejs-24'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timestamps()
    }
//    environment {
//
//    }
    stages{
        stage('Checkout Code') {
            steps {
                branch 'main'
                git url: ''
            }
        }
        stage('Install Dependencies') {
            steps {
                dir('app'){
                    sh 'npm install'
                }
            }
        }
        stage('Run Test') {
            dir('app'){
                sh 'npm test'
            }
        }
//        stage('SonarQube Analysis') {
//            steps{
//                echo 'hello sonar'
//            }
//        }
//        stage('OWASP Dependency Check') {
//            steps{}
//        }
//        stage('Trivy FileSystem Security Check') {
//            steps{
//
//            }
//        }
        stage('Build Docker Image') {
            steps{
                sh 'chmod +x build.sh'
            }
        }
//        stage('Trivy Image Scan') {}
//        stage('Login to ECR') {}
//        stage('Push Image to ECR'){}
//        stage('Deploy to EKS'){}

    }
//    post {
//        success {
//
//        }
//        failure {
//
//        }
//        always {
//            cleanws()
//        }
//    }
}