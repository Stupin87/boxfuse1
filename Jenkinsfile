pipeline {
    agent any
    environment {
        NEXUS_CREDENTIALS = credentials('baf7b7ca-b8bd-4b73-8083-b902943cf70a')
        NEXUS_URL = 'http:// 8081'
        DOCKER_IMAGE_TAG = 'boxfuse1:v1.0.0'
    }
    stages {
        stage('Build') {
            steps {
                script {
                        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: NEXUS_CREDENTIALS]]) {
                        sh "docker pull $NEXUS_URL/$DOCKER_IMAGE_TAG"
                    }
                }
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                script {
                    sh "docker run -v /var/run/docker.sock:/var/run/docker.sock $NEXUS_URL/$DOCKER_IMAGE_TAG sh -c 'cd /app && mvn clean package'"
                    sh "docker build -t your-application:$BUILD_NUMBER -f Dockerfile.app ."
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: NEXUS_CREDENTIALS]]) {
                        sh "docker tag your-application:$BUILD_NUMBER $NEXUS_URL/your-application:$BUILD_NUMBER"
                        sh "docker push $NEXUS_URL/your-application:$BUILD_NUMBER"
                    }
                }
            }
        }
    }
}