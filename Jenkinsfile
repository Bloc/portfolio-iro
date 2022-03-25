pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
		bundle exec jekyll build
            }
        }
    }
}
