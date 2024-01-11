pipeline {
    agent {
        docker {
            image 'stupin87/boxfuse1'
            label 'test'
        }
    }
    stages {
        stage('Cloning repository') {
            steps {
                git 'https://github.com/Stupin87/boxfuse1.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -f /boxfuse1/Dockerfile.app-t -t boxfuse1 .'
            }
        }
        stage('Push to Nexus') {
            steps {
                withCredentials([usernamePassword(credentialsId: '26f2ddee-0e23-4038-8234-1f59b4582679', usernameVariable: 'NEXUS_USERNAME', passwordVariable: 'NEXUS_PASSWORD')]) {
                    sh 'docker login 158.160.38.190:8081 -u $NEXUS_USERNAME -p $NEXUS_PASSWORD'
                }
                sh 'docker tag boxfuse1:latest 158.160.38.190:8123/boxfuse1:v1.0.0'
                sh 'docker push 158.160.38.190:8123/boxfuse1:v1.0.0'
            }
        }
        stage('Deploy on Production') {
            steps {
                script {
                    def remoteMachine = "root@158.160.111.205"
                    sshCommand remote: remoteMachine, command: "docker pull 158.160.38.190:8123/boxfuse1:v1.0.0"
                    sshCommand remote: remoteMachine, command: "docker run -d -p 8185:8185 158.160.38.190:8123/boxfuse1:v1.0.0"
                }
            }
        }
    }
}