pipeline {
    agent any

    environment {
        DOCKERHUB = credentials('dockerhub-creds')
        APP_NAME = 'myapp'
        IMAGE = '12208709amit/myapp'
        EC2_HOST = '52.5.227.232'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/8082268578Ak/myapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_PSW | docker login -u $DOCKERHUB_USR --password-stdin'
                sh 'docker push $IMAGE:latest'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no ubuntu@$EC2_HOST '
                    docker pull $IMAGE:latest &&
                    docker stop myapp || true &&
                    docker rm myapp || true &&
                    docker run -d -p 80:80 --name myapp $IMAGE:latest
                '
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
