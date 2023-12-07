pipeline {
    agent any

    tools {
        // Define the Node.js installation configured in Jenkins
        nodejs 'NodeJS'
        git 'Git'
    }

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Pull the source code from version control
                    git 'https://github.com/thinkC/ecommerce.git'

                    // Build Docker image
                    sh 'docker build -t thinkc/ecommerce-app1:latest .'

                    // Log in to Docker Hub
                    withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_HUB_CREDENTIALS')]) {
                        sh "echo $DOCKER_HUB_CREDENTIALS | docker login -u thinkc --password-stdin"
                    }

                    // Push Docker image to Docker Hub
                    sh 'docker push thinkc/ecommerce-app1:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply Kubernetes manifests
                    sh 'kubectl apply -f deployment.yaml'
                // Create or update Kubernetes Service
                sh 'kubectl apply -f service.yaml'
                }
            }
        }
    }
}
