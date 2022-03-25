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
                sh 'gem install jekyll bundler' 
                sh 'bundle exec jekyll build' 
            }
        }
    }
}
