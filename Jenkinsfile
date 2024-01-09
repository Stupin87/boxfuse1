pipeline {
    agent any
    environment {
        registry = "158.160.47.233:8081"
        imageName = '158.160.47.233:8081/boxfuse1'
        dockerImage = 'boxfuse1'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build(imageName, "--file Dockerfile .")
                }
            }
        }
        stage('Push to Nexus') {
            steps {
                script {
                    sh "docker tag boxfuse1:latest 158.160.47.233:8123/boxfuse1:2"
                    sh "docker push 158.160.47.233:8123/boxfuse1:2"
                }
            }
        }
    }
}
