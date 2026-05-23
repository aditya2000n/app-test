pipeline {

    agent any 

    stages {
        stage('Checkout scm') {
            steps {
                echo "Pull code from github"
                checkout scm
            }
        }

        stage('Build Docker Image and Run Container') {
            steps {
                echo "Login to the server"
                sshagent (['adityavm01-sshkey']) {
                    withEnv(['DOCKER_HOST=ssh://aditya@192.168.0.109']) {
                        echo "Stop and remove existing container"
                        sh "docker stop app-test || true && docker rm app-test || true"
                        echo "Build new Docker image"
                        sh "docker build -t app-test:latest ."
                        echo "Run new Docker container"
                        sh "docker run -d --name app-test -p 3000:3000 app-test:latest"
                    }
                }
                
            }
        }
    }

    post {
        always {
            echo "Pipeline completed"
            sh "docker system prune -f"
        }
    }
}