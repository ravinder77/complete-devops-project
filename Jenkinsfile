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
                checkout scm
            }
        }
        stage('Say Hello'){
            steps {
                echo 'hello there'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }
//        stage('Lint and Test') {
//            parallel {
//                stage('Lint') {
//                    steps {
//                        sh 'npm run lint'
//                    }
//                }
//                stage('Test') {
//                    steps{
//                        sh 'npm test -- --coverage'
//                    }
//                }
//            }
//        }
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
//        stage('Build Docker Image') {
//            steps{}
//        }
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