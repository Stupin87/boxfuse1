pipeline {
    agent {
        docker {
            image 'maven:3.6.3-openjdk-11'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t boxfuse1 .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker login -u admin -p Keglia8905823!'
                sh 'docker tag boxfuse1:1 158.160.47.233:8123/boxfuse1:2'
                sh 'docker push 158.160.47.233:8123/boxfuse1:2'
            }
        }

        
		stage('Deploy') {
            steps {
                sh 'docker run -d -p 8080:8080 158.160.47.233:8123/boxfuse1:2'
            }
        }
    }
}