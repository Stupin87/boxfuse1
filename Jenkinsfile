pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/Stupin87/boxfuse1.git'
            }
        }

        stage('Build and Push') {
            steps {
                dir('boxfuse1/') {
                    script {
                        sh 'docker build -f /boxfuse1/Dockerfile -t boxfuse1 .'
                        sh 'docker tag boxfuse1:latest 158.160.47.233:8123/boxfuse1:2'
                        sh 'docker push 158.160.47.233:8123/boxfuse1:2'
                    }
                }
            }
        }
    }
}
