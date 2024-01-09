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
                    withDockerRegistry([credentialsId: 'bc601eaa-d042-49f8-891c-ac989a887f3d', url: '158.160.47.233:8081'])
                    dockerImage.push()
                }
            }
        }
    }
}
