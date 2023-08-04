pipeline {
    agent {
        kubernetes {
            label 'docker-agent'
        }
    }

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
                    catchError(buildResult: 'UNSTABLE') {
                        docker.build registry
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("http://${registry}") {
                        catchError(buildResult: 'UNSTABLE') {
                            docker.image(registry).push()
                        }
                    }
                }
            }
        }
    }
}
