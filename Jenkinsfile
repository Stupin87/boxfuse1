pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Stupin87/boxfuse1.git'
            }
        }

        stage('Build and Push') {
            steps {
                dir('boxfuse1') {
                    script {
                        sh 'docker build -t home/keglia/boxfuse1/Dockerfile .'
                        sh 'docker tag boxfuse1:latest 158.160.47.233:8123/boxfuse1:2'
                        sh 'docker push 158.160.47.233:8123/boxfuse1:2'
                    }
                }
            }
        }
    }
}
