pipeline {
    agent any
    stages {
        stage('Setup') {
            steps { 
                sh 'pwd'
                echo 'Installing Dependencies'
                sh 'sudo apt-get -y install python3.8 python3-pip'
                sh 'python3 -m pip install --user --upgrade pip'
                sh 'pip install pytest'
            }
        }
      stage('Build') {
            steps {
                echo 'Building'
                sh 'python3.8 mathlib.py'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
                sh 'python3.8 -m pytest -v test_mathlib.py'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'sudo docker rmi -f myapp abhishekmazumder/myapp:latest'
                sh 'sudo docker images'
                echo 'Building Docker Image from Dockerfile'
                sh 'sudo docker build -t myapp .'
                sh 'sudo docker tag myapp abhishekmazumder/myapp:latest'
                sh 'sudo docker login -u="abhishekmazumder" -p="Asdfg09876#"'
                echo 'Pushing Docker Image to DockerHub'
                sh 'sudo docker push abhishekmazumder/myapp:latest'
            }
        }
        stage('Create Container') {
            steps {
                sh 'sudo docker ps'
                echo 'Pulling Docker Image from DockerHub'
                sh 'docker pull abhishekmazumder/myapp:latest'
                echo 'Creating Container'
                sh 'sudo docker run -d -it abhishekmazumder/myapp:latest bash'
            }
        }
    }
}
