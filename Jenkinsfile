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
                    bat 'docker build -t thinkc/ecommerce-app1:latest .'

                    // // Log in to Docker Hub
                    // withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_HUB_CREDENTIALS')]) {
                    //     bat "echo $DOCKER_HUB_CREDENTIALS | docker login -u thinkc --password-stdin"
                    // }

                    // Log in to Docker Hub
                    withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_HUB_CREDENTIALS')]) {
                        bat 'docker login -u thinkc --password-stdin'
                    }

                    // Push Docker image to Docker Hub
                    bat 'docker push thinkc/ecommerce-app1:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply Kubernetes manifests
                    bat 'kubectl apply -f deployment.yaml'
                // Create or update Kubernetes Service
                bat 'kubectl apply -f service.yaml'
                }
            }
        }
    }
}



