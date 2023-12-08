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
    // environment {
    //     DOCKER_USERNAME = credentials('docker-hub-username')
    //     DOCKER_PASSWORD = credentials('docker-hub-password')
        
    // }

    stages {
        stage('Build and Push Docker Image') {

            steps {
                script {
                    // Pull the source code from version control
                    git 'https://github.com/thinkC/ecommerce.git'

                    // Build Docker image
                    bat 'docker build -t thinkc/ecommerce-app2:latest .'

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
                    // bat "echo %DOCKER_USERNAME%"
                    // bat "echo %DOCKER_PASSWORD%"
                    // bat 'echo %DOCKER_PASSWORD% | docker login -u thinkc --password-stdin'

                    // Build and push Docker image using Docker Hub credentials
                    docker.withRegistry('https://registry-1.docker.io', 'docker-hub-credentials1') {
                        def customImage = docker.build("thinkc/ecommerce-app2:latest")
                        customImage.push()
                    }
                    // Push Docker image to Docker Hub
                    bat 'docker push thinkc/ecommerce-app2:latest'
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


//////////////

// pipeline {
//     agent any

//     tools {
//         // Specify the Git installation configured in Jenkins
//         git 'NameOfYourGitInstallation'
//         // ...
//     }

//     stages {
//         stage('Build and Push Docker Image') {
//             agent {
//                 docker {
//                     // Use the same Docker image as your application
//                     image 'node:18-alpine'
//                 }
//             }
//             steps {
//                 script {
//                     // Pull the source code from version control
//                     git 'https://github.com/your-username/ecommerce-app.git'

//                     // Build and push Docker image using Docker Hub credentials
//                     withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
//                         sh 'docker build -t your-registry/ecommerce-app:latest .'
//                         sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
//                         sh 'docker push your-registry/ecommerce-app:latest'
//                     }
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 script {
//                     // Apply Kubernetes manifests
//                     sh 'kubectl apply -f deployment.yaml'

//                     // Rolling restart of pods to apply changes
//                     sh 'kubectl rollout restart deployment your-deployment-name'
//                 }
//             }
//         }
//     }
// }



