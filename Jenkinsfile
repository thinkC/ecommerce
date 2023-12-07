pipeline {
    agent any

    tools {
        // Define the Node.js installation configured in Jenkins
        nodejs 'NodeJS'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Pull the source code from version control
                    git 'https://github.com/your-username/ecommerce-app.git'

                    // Build and push Docker image
                    sh 'docker build -t your-registry/ecommerce-app:latest .'
                    sh 'docker push your-registry/ecommerce-app:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply Kubernetes manifests
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
