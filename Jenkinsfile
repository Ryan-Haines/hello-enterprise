pipeline {
    agent any

    environment {
        registry = 'registry:5000/my-enterprise-app'
    }

    stages {
        stage('Clone Git') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build registry
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("http://${registry}") {
                        docker.image(registry).push()
                    }
                }
            }
        }
    }
}
