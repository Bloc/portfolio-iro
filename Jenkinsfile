pipeline {
    agent {
        docker { image 'jekyll:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'jekyll --version'
            }
        }
    }
}

