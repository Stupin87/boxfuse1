pipeline {
    agent any
    environment {
        NEXUS_CREDENTIALS = credentials('26f2ddee-0e23-4038-8234-1f59b4582679')
        NEXUS_URL = 'http://158.160.101.95:8081'
        DOCKER_IMAGE_TAG = 'boxfuse1:v1.0.0'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'NEXUS_CREDENTIALS']]) {
                        sh "docker login -u username -p password"
                        sh "docker pull $NEXUS_URL/$DOCKER_IMAGE_TAG"
                    }
                }
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh "docker run -v /var/run/docker.sock:/var/run/docker.sock $NEXUS_URL/$DOCKER_IMAGE_TAG sh -c 'cd /app && mvn clean package'"
                    sh "docker build -t boxfuse1:$BUILD_NUMBER -f Dockerfile.app ."
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'NEXUS_CREDENTIALS']]) {
                        sh "docker tag boxfuse1:$BUILD_NUMBER $NEXUS_URL/boxfuse1:$BUILD_NUMBER"
                        sh "docker push $NEXUS_URL/boxfuse1:$BUILD_NUMBER"
                    }
                }
            }
        }
    }
}
