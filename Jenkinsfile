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
                // Docker-Image lokal bauen
                script {
                    bat 'docker build -t mein-html-projekt .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                // Docker-Container lokal starten (für Tests)
                script {
                    bat 'docker run -d -p 8081:80 mein-html-projekt'
                }
            }
        }
        stage('Create Kubernetes YAML') {
            steps {
                // Kubernetes YAML-Datei erstellen
                script {
                    writeFile file: 'deployment.yaml', text: '''
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mein-html-projekt-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mein-html-projekt
  template:
    metadata:
      labels:
        app: mein-html-projekt
    spec:
      containers:
      - name: mein-html-projekt
        image: mein-html-projekt:latest
        ports:
        - containerPort: 80
'''
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                
                script {
                    bat 'kubectl apply -f deployment.yaml'
                }
            }
        }
        stage('Expose Kubernetes Service') {
            steps {
                
                script {
                    bat 'kubectl expose deployment mein-html-projekt-deployment --type=NodePort --name=mein-html-service --port=8081 --target-port=80'
                }
            }
        }
    }
}
