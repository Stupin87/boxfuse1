pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dir('boxfuse1/'){
                  script{
                    sh 'docker build -t home/keglia/boxfuse1/Dockerfile .'
                    sh 'docker tag boxfuse1:latest 158.160.47.233:8123/boxfuse1:2'
            }
                }
            }
        }
        
        stage('Publish to Nexus') {
            steps {
                sh 'docker push 158.160.47.233:8123/boxfuse1:1'
                
            }
        }
    }
}
