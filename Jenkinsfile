pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout des GitHub-Repositories
                git branch: 'main', url: 'https://github.com/ozangumus/testanwendung'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Docker-Image bauen
                script {
                    
                    bat 'docker build -t mein-html-projekt .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                // Docker-Container starten (lokal für Tests)
                script {
                    
                    bat 'docker run -d -p 8081:80 mein-html-projekt'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Deployment auf Kubernetes
            }
        }
    }
}
