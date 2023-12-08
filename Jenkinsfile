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

    stages {
        stage('Build and Push Docker Image') {

            steps {
                script {
                    // Pull the source code from version control
                    git 'https://github.com/thinkC/ecommerce.git'

                    // Build Docker image
                    sh 'docker build -t thinkc/ecommerce-app2:latest .'

                    // // Build and push Docker image using Docker Hub credentials
                    docker.withRegistry('https://registry-1.docker.io','docker-hub-credentials') {
                        def customImage = docker.build("thinkc/ecommerce-app2:latest")
                        // Push Docker image to Docker Hub
                        customImage.push()


                     }
                    // // Push Docker image to Docker Hub
                    // sh 'docker push thinkc/ecommerce-app3:latest'
                }
            }
        }


        // stage('Build and Push Docker Image') {
        //     steps {
        //         script {
        //             git 'https://github.com/thinkC/ecommerce.git'

        //             // Build and push Docker image using Docker Hub credentials
        //             docker.withRegistry('https://registry-1.docker.io', [
        //                 credentials('docker-hub-credentials')
        //             ]) {
        //                 def customImage = docker.build("thinkc/ecommerce-app2:latest")
        //                 customImage.push()
        //             }
        //         }
        //     }
        // }

        // stage('Deploy to Kubernetes') {
        //     steps {
        //         script {
        //             // Apply Kubernetes manifests
        //             sh 'kubectl apply -f deployment.yaml'
        //         // Create or update Kubernetes Service
        //         sh 'kubectl apply -f service.yaml'
        //         }
        //     }
        // }
    }
}




///////////////////////////////

// pipeline {
//     agent any

//     tools {
//         nodejs 'NodeJS'
//         git 'Git'
//     }

//     stages {
//         stage('Build and Push Docker Image') {
//             steps {
//                 script {
//                     git 'https://github.com/thinkC/ecommerce.git'

//                     // Build and push Docker image using Docker Hub credentials
//                     docker.withRegistry('https://registry-1.docker.io', [
//                         credentials('docker-hub-credentials')
//                     ]) {
//                         def customImage = docker.build("thinkc/ecommerce-app2:latest")
//                         customImage.push()
//                     }
//                 }
//             }
//         }

//         // stage('Deploy to Kubernetes') {
//         //     steps {
//         //         script {
//         //             // Apply Kubernetes manifests
//         //             sh 'kubectl apply -f deployment.yaml'
//         //             // Create or update Kubernetes Service
//         //             sh 'kubectl apply -f service.yaml'
//         //         }
//         //     }
//         // }
//     }
// }
