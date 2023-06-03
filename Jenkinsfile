pipeline {
    agent any

    environment {
        DOCKER_IMAGE = '5love-nginx'
        DOCKER_TAG = `git rev-parse --short=6  HEAD`
        DOCKER_CREDENTIALS = 'dockerhub' // This should be the ID of the credentials in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code with your html files and Dockerfile
                checkout scm
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push Docker image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKER_CREDENTIALS}") {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }
    }
}
