pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout des GitHub-Repositories
                git 'https://github.com/ozangumus/testanwendung'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Docker-Image bauen
                script {
                    sh 'docker build -t mein-html-projekt .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                // Docker-Container starten
                script {
                    sh 'docker run -d -p 8080:80 mein-html-projekt'
                }
            }
        }
    }
}
