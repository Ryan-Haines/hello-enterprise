pipeline {
    agent any 
    
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-react-app .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 80:80 my-react-app'
            }
        }
    }
}

