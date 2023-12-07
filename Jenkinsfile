pipeline {
    agent any

    tools {
        // Define the Node.js installation configured in Jenkins
        nodejs 'NodeJS'
        git 'Git'
    }

    // environment {
    //     DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    // }
    environment {
        // DOCKER_USERNAME = credentials('docker-hub-username')
        DOCKER_PASSWORD = credentials('docker-hub-password')
        bat "echo %DOCKER_PASSWORD%"
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

                    // // Log in to Docker Hub
                    // withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_HUB_CREDENTIALS')]) {
                    //     bat 'docker login -u thinkc --password-stdin'
                    // }

                    // login to docker using docker credentials
                    // bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin'
                    bat 'echo %DOCKER_PASSWORD% | docker login -u thinkc --password-stdin'

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



