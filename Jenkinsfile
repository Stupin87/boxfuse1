pipeline {
    agent {
        docker {
            image 'maven:3.6.3-openjdk-11'
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
            agent {label 'maven'}
            steps {
                
                sh 'docker build -f /boxfuse1/Dockerfile.app -t boxfuse1 .'
            }
        }
        stage('Push to Nexus') {
            agent {label 'maven'}
            steps {
                withCredentials([usernamePassword(credentialsId: '26f2ddee-0e23-4038-8234-1f59b4582679', usernameVariable: 'NEXUS_USERNAME', passwordVariable: 'NEXUS_PASSWORD')]) {
                sh 'docker login 158.160.38.190:8081 -u $NEXUS_USERNAME -p $NEXUS_PASSWORD'
      }
                sh 'docker tag boxfuse1:latest 158.160.38.190:8123/boxfuse1:v1.0.0'
                sh 'docker push 158.160.38.190:8123/boxfuse1:v1.0.0'
            }
        }
    }
}