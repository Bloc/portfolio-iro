pipeline {
    agent any

    stages {
        stage('Testing') {
            steps {
                sh 'pwd' 
            }
        }
    stage('Building') {
            steps {
                sh 'source ~/.bashrc' 
                sh 'bundle exec jekyll build' 
            }
        }
    }
}
