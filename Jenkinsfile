pipeline {
    agent any

    stages {
        stage('Testing') {
            steps {
                sh 'pwd && bundle --version && jekyll --version' 
            }
        }
    stage('Building') {
            steps {
                sh 'bundle exec jekyll build' 
            }
        }
    }
}
